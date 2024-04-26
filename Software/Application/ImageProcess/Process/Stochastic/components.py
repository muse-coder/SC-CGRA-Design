import random
# from statistics import mean 
import math
import statistics


def stream_gen(operator, sobol_sequence, validSegWidth, sobolWidth):
    length = len(sobol_sequence)
    bit_stream = []
    operatorBinary = (to_bin(operator, validSegWidth))
    # print("operator:" + operatorBinary)
    scaled_sobol_sequence = [sobol_sequence[i] << (validSegWidth - sobolWidth) for i in range(len(sobol_sequence))]
    # for i in range(length):
    #     print(to_bin(scaled_sobol_sequence[i],validSegWidth))

    for i in range(length):
        if operator > (scaled_sobol_sequence[i]):
            bit_stream.append(1)
        else:
            bit_stream.append(0)

    return bit_stream


def calculate(sequence_1, sequence_2):
    length = len(sequence_1)
    APC = 0
    for i in range(length):
        APC += sequence_1[i] & sequence_2[i]
    # print("APC=%d "%APC,end=' ')
    return APC


def scaled_mul(num_1, num_2, sobol_1, sobol_2, validSegWidth, sobolWidth, dataWidth=16):
    scaled_num_1, num_1_shift = sliding_window(num_1, dataWidth=dataWidth, validSegWidth=validSegWidth)
    scaled_num_2, num_2_shift = sliding_window(num_2, dataWidth=dataWidth, validSegWidth=validSegWidth)
    # print("validSegWidth =%d"%validSegWidth)
    # print("scaled_num_1:",to_bin(scaled_num_1,dataWidth))
    # print("scaled_num_2:",to_bin(scaled_num_2,dataWidth))

    # print("sobol_1")
    # for i in sobol_1:
    # print(to_bin(i,dataWidth))

    # print("sobol_2")

    # for j in sobol_2:
    # print(to_bin(j,dataWidth))

    bit_stream_1 = stream_gen(operator=scaled_num_1, sobol_sequence=sobol_1, validSegWidth=validSegWidth,
                              sobolWidth=sobolWidth)
    bit_stream_2 = stream_gen(operator=scaled_num_2, sobol_sequence=sobol_2, validSegWidth=validSegWidth,
                              sobolWidth=sobolWidth)
    # print("bit_stream_1:",bit_stream_1)
    # print("bit_stream_2:",bit_stream_2)
    scaled_res = calculate(bit_stream_1, bit_stream_2)
    shiftSum = 2 * dataWidth - sobolWidth - num_1_shift - num_2_shift
    exact_res = num_1 * num_2
    if (shiftSum >= 0):
        res = scaled_res << shiftSum
    else:
        res = scaled_res >> (-shiftSum)
    # print(res)
    # ED = abs(exact_res - res)
    # error = ED / exact_res
    # print("num1 = %d, num2 = %d,error = "%(num_1,num_2),end='')
    # print("%.4lf"%(error*100)+"%")
    return res


def to_bin(value, num):  # 十进制数据，二进制位宽
    bin_chars = ""
    temp = value
    for i in range(num):
        bin_char = bin(temp % 2)[-1]
        temp = temp // 2
        bin_chars = bin_char + bin_chars
    return bin_chars.upper()  # 输出指定位宽的二进制字符串


def sliding_window(value, dataWidth, validSegWidth):
    bin_str = to_bin(value, dataWidth)
    # # print(bin_str)
    length = len(bin_str)
    shift_count = 0
    count = 0
    for i in range(length):
        if bin_str[i] == '0':
            count += 1
            continue
        else:
            break
    valid_segment = []
    if (count < length - validSegWidth):
        valid_segment = bin_str[count:count + validSegWidth]
        # shift_count = -(dataWidth-count-validSegWidth)
    else:
        valid_segment = bin_str[count:length]
        for i in range(validSegWidth - (length - count)):
            valid_segment = valid_segment + '0'
        # shift_count = count+validSegWidth-dataWidth
    shift_count = count
    scaled_num = int(valid_segment, 2)

    return scaled_num, shift_count
