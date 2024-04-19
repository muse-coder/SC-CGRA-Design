import timeit

import torch
import math
import  os
def TensorGenBitstream(rngSeq,tensorInputData,index,dataWidth = 8 ):
    len = rngSeq.size(0)
    quantizedata = (torch.round(tensorInputData / (2 ** (dataWidth - math.log2(len))))).to(rngSeq.device)


    singleBitstream = (quantizedata> rngSeq[index]).int()
    return singleBitstream



def tensorGenBitstreamSeries(rngSeq,tensorInputData,index,dataWidth = 8,validWidth = 5 ):
    length = len(rngSeq)
    sobolWidth = int(math.log2(length))
    tmp =((1<<(validWidth))-1)
    # shiftTime =dataWidth-int(math.log2(length))-1
    shiftTime =dataWidth-validWidth
    if(math.log2(length)>=dataWidth):
        quantizeData = tensorInputData
        tmp = math.log2(length) - dataWidth
        singleBitstreamMul = (quantizeData> (rngSeq[index]/(2**tmp))).int()

    else:
        quantizeData = ((tmp << shiftTime) &tensorInputData)
        singleBitstreamMul = (quantizeData> (rngSeq[index]<<(dataWidth-sobolWidth))).int()



    return singleBitstreamMul



def TensorLeftShiftBits(data,dataWidth,enlarge=True):
    # 将张量转换为整数类型（如果是浮点数）
    # dataExceptZero = torch.where(data>0 , data, 2**dataWidth-1)
    dividedData = (2**dataWidth-1)/data
    log2Result =torch.log2(dividedData)
    log2ResultFloor = torch.floor(log2Result).to(torch.int8)
    if(not enlarge):
        log2ResultFloor = torch.zeros_like(data)
    return log2ResultFloor




def TensorEnlargeModule(tensorData, dataWidth,enlarge=True,sobolWidth = 4):
    # leftShiftTimeTensor = dataWidth - TensorFindHighestOne(tensorData) - 1
    leftShiftTimeTensor = TensorLeftShiftBits(data= tensorData , dataWidth= dataWidth,enlarge= enlarge)
    enlargedNumberTensor = tensorData <<leftShiftTimeTensor

    return enlargedNumberTensor.to(torch.int32) , leftShiftTimeTensor

def matrixMulSeriesSC(tensorData_1 , tensorData_2 , SobolSeq1 , SobolSeq2, AscendingSeq , dataWidth , device , enlarge = True,validWidth= 5):
    bitstreamLength = len(SobolSeq1)
    enlargedData_1 , dataLeftShiftTime_1 =  TensorEnlargeModule(tensorData=abs(tensorData_1), dataWidth=dataWidth , enlarge= enlarge , sobolWidth=int(math.log2(bitstreamLength)))
    enlargedData_2 , dataLeftShiftTime_2 =  TensorEnlargeModule(tensorData=abs(tensorData_2), dataWidth=dataWidth , enlarge= enlarge , sobolWidth=int(math.log2(bitstreamLength)))
    '''
    Begin:将数据维度转换成合适shape
    '''
    dataScaledFactor =(2**((2*dataWidth - math.log2(bitstreamLength) - dataLeftShiftTime_2 - dataLeftShiftTime_1).to(torch.float64))).to( torch.float64)

    # SCResult = torch.empty((dataShape_1[0],dataShape_2[1]),dtype=torch.float)
    res_Stochastic = torch.zeros_like(enlargedData_1).to(device).to(torch.float64)
    res_Unary = torch.zeros_like(enlargedData_1).to(device).to(torch.float64)
    tensor1 = torch.zeros_like(enlargedData_1).to(device).to(torch.int32)
    tensor2 = torch.zeros_like(enlargedData_2).to(device).to(torch.int32)
    tensor3 = torch.zeros_like(enlargedData_2).to(device).to(torch.int32)
    if(enlarge):
        validWidth = validWidth
    else:
        validWidth = dataWidth
    for i in range (bitstreamLength):
        tensorBit_1 = tensorGenBitstreamSeries(rngSeq = SobolSeq1 , tensorInputData= enlargedData_1 , index= i ,validWidth = validWidth , dataWidth= dataWidth).to(device)
        tensorBit_2 = tensorGenBitstreamSeries(rngSeq = SobolSeq2 , tensorInputData= enlargedData_2 ,index= i  ,validWidth = validWidth , dataWidth= dataWidth).to(device)
        asendingBit_3 = tensorGenBitstreamSeries(rngSeq=AscendingSeq, tensorInputData=enlargedData_2, index=i,
                                               dataWidth=dataWidth).to(device)
        tensor1 = tensor1.to((torch.int32)) + tensorBit_1.to((torch.int32))
        tensor2 = tensor2.to((torch.int32)) + tensorBit_2.to((torch.int32))
        tensor3 = tensor3.to((torch.int32)) + asendingBit_3.to((torch.int32))

        res_Stochastic = res_Stochastic + (torch.bitwise_and(tensorBit_1 , tensorBit_2)).to(torch.int32)
        res_Unary = res_Unary + (torch.bitwise_and(tensorBit_1 , asendingBit_3)).to(torch.int32)

    tensor1 = tensor1.to(torch.float64) *(2**(dataWidth - math.log2(bitstreamLength)-dataLeftShiftTime_1))
    tensor2 = tensor2.to(torch.float64) *(2**(dataWidth - math.log2(bitstreamLength)-dataLeftShiftTime_2))
    tensor3 = tensor3.to(torch.float64) *(2**(dataWidth - math.log2(bitstreamLength)-dataLeftShiftTime_2))

    if not torch.equal(tensor2, tensor3):
        diff_tensor = tensor2 != tensor3
        diff_values = tensor2[diff_tensor].tolist() + tensor3[diff_tensor].tolist()
    res_Unary  = res_Unary  * dataScaledFactor
    res_Unary  = res_Unary .to(torch.int32)

    res_Stochastic = res_Stochastic * dataScaledFactor
    res_Stochastic = res_Stochastic.to(torch.int32)
    return res_Stochastic , res_Unary

def calculate(SeqType,dataWidth,enlarge = True,validWidth = 5):
    dim = (1<<dataWidth)-1
    partition = 64
    dim_1= int((dim+1)/partition)
    AED_base = 1<<(dataWidth*2)
    # dim_1= dim
    dim_2 = dim

    ascendingSeq = []
    for i in range(0,len(SeqType[0][0])):
        ascendingSeq.append(i)

    MREDGroup = []
    MEDGroup = []
    start_time = timeit.default_timer()
    for tuples in SeqType:
        SC_REDsum = 0
        SC_AEDsum = 0
        Unary_REDsum = 0
        Unary_AEDsum = 0
        for i in range(0,partition):
            start = dim_1 * i
            end = dim_1 * (i+1)
            tensor1 = torch.arange(start+1, end+1,dtype=torch.int64).unsqueeze(1).expand(dim_1, dim_2).to(device)
            # tensor2 = torch.arange(1, dim + 1).unsqueeze(0).expand(int((dim+1)/64), dim)
            tensor2 = torch.arange(1, dim + 1,dtype=torch.int64).unsqueeze(0).expand(dim_1, dim_2).to(device)
            tensor1 = torch.where(tensor1<dim,tensor1,dim)
            (SCResult,UnaryResult )= matrixMulSeriesSC(tensorData_1=tensor1, tensorData_2=tensor2, SobolSeq1=tuples[0], SobolSeq2=tuples[1],AscendingSeq=ascendingSeq,
                                                    dataWidth=dataWidth, device=device,enlarge=enlarge,validWidth=validWidth)
            accurateRes= tensor1 * tensor2
            SC_RED =    abs(1 - (SCResult.to(torch.float64) / accurateRes.to(torch.float64)))
            Unary_RED = abs(1 - (UnaryResult.to(torch.float64) / accurateRes.to(torch.float64)))
            SC_ED =    abs(SCResult.to(torch.float64) - accurateRes.to(torch.float64))/AED_base
            Unary_ED = abs(UnaryResult.to(torch.float64) - accurateRes.to(torch.float64)) /AED_base

            SC_REDsum += SC_RED
            SC_AEDsum += SC_ED

            Unary_REDsum += Unary_RED
            Unary_AEDsum += Unary_ED
            # print(i)
            # if(i==63):
            #     print(1)
        SC_RED = torch.sum(SC_REDsum)/(dim*dim)
        SC_ED = torch.sum (SC_AEDsum)/(dim*dim)
        Unary_RED = torch.sum(Unary_REDsum) / (dim * dim)
        Unary_ED = torch.sum(Unary_AEDsum) / (dim * dim)
        MREDGroup.append((SC_RED,Unary_RED))
        MEDGroup.append((SC_ED, Unary_ED))
    end_time = timeit.default_timer()

    print(MREDGroup)
    print(MEDGroup)
    length = len(SeqType[0][0])
    dir_name = "Result/"

    if not os.path.exists(dir_name):
        os.mkdir(dir_name)

    fileName = 'new_dataWidth_'+str(dataWidth)+"_precision_"+ str(length) +'_bitstream_' + str(validWidth)+ '_validWidth_.txt'
    if(not enlarge):
        fileName = 'origin_' + str(dataWidth)+'_precision_' + str(length) + '_bitstream.txt'

    fileName = dir_name + fileName
    file = open(fileName, mode='w+')
    file.write("MRED:\n")
    for data in MREDGroup:
        writeLine = ("\t"+str(data[0].item()) +","+str(data[1].item())+"\n" )
        file.write(writeLine)
    file.write("MED:\n")
    for data in MEDGroup:
        writeLine = ("\t"+str(data[0].item()) +","+str(data[1].item()) +"\n")
        file.write(writeLine)
    endLine = "cost time :"+str(end_time - start_time)+"seconds"
    file.write(endLine)

    file.close()

def readSobolSeq(fileName):
    lines_as_lists = []
    with open(fileName, 'r') as file:
    # 逐行读取文件
        for line in file:
            # 去掉行尾的换行符，并按逗号分割字符串，得到一个字符串列表
            str_numbers = line.strip().split(',')
            # 将字符串列表中的每个元素转换为整数，得到一个整数列表
            int_list = [int(num) for num in str_numbers]
            # 将整数列表添加到lines_as_lists列表中
            lines_as_lists.append(int_list)
    return lines_as_lists


if __name__ == "__main__":
    # 打开文件，假设文件名为data.txt
    device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
    sobol_16 = readSobolSeq(fileName='SobolSequence/sobol16.txt')
    sobol_32 = readSobolSeq(fileName='SobolSequence/sobol32.txt')
    sobol_64 = readSobolSeq(fileName='SobolSequence/sobol64.txt')
    sobol_128 = readSobolSeq(fileName='SobolSequence/sobol128.txt')
    sobol_256 = readSobolSeq(fileName='SobolSequence/sobol256.txt')
    sobol_512 = readSobolSeq(fileName='SobolSequence/sobol512.txt')


    # sobolTensor = torch.tensor(sobol_1).to(device)
    dataWidth = 8

    SeqType_16 = [(sobol_16[0], sobol_16[1]), (sobol_16[1], sobol_16[2]), (sobol_16[2], sobol_16[3]),
                  (sobol_16[3], sobol_16[4]), (sobol_16[4], sobol_16[5]), (sobol_16[5], sobol_16[6]),
                  (sobol_16[6], sobol_16[7]), (sobol_16[7], sobol_16[2])]

    SeqType_32 = [(sobol_32[0], sobol_32[1]), (sobol_32[1], sobol_32[2]), (sobol_32[2], sobol_32[3]),
                  (sobol_32[3], sobol_32[4]), (sobol_32[4], sobol_32[5]), (sobol_32[5], sobol_32[6]),
                  (sobol_32[6], sobol_32[7]), (sobol_32[7], sobol_32[2])]

    SeqType_64 = [(sobol_64[0], sobol_64[1]), (sobol_64[1], sobol_64[2]), (sobol_64[2], sobol_64[3]),
                  (sobol_64[3], sobol_64[4]), (sobol_64[4], sobol_64[5]), (sobol_64[5], sobol_64[6]),
                  (sobol_64[6], sobol_64[7]), (sobol_64[7], sobol_64[2])]

    SeqType_128 = [(sobol_128[0], sobol_128[1]), (sobol_128[1], sobol_128[2]), (sobol_128[2], sobol_128[3]),
                   (sobol_128[3], sobol_128[4]), (sobol_128[4], sobol_128[5]), (sobol_128[5], sobol_128[6]),
                   (sobol_128[6], sobol_128[7]), (sobol_128[7], sobol_128[2])]

    SeqType_256 = [(sobol_256[0], sobol_256[1]), (sobol_256[1], sobol_256[2]), (sobol_256[2], sobol_256[3]),
                   (sobol_256[3], sobol_256[4]), (sobol_256[4], sobol_256[5]), (sobol_256[5], sobol_256[6]),
                   (sobol_256[6], sobol_256[7]), (sobol_256[7], sobol_256[2])]

    SeqType_512 = [(sobol_512[0], sobol_512[1]), (sobol_512[1], sobol_512[2]), (sobol_512[2], sobol_512[3]),
                   (sobol_512[3], sobol_512[4]), (sobol_512[4], sobol_512[5]), (sobol_512[5], sobol_512[6]),
                   (sobol_512[6], sobol_512[7]), (sobol_512[7], sobol_512[2])]
    # allTpye = [SeqType_16,SeqType_32]
    allTpye = [SeqType_16, SeqType_32,SeqType_64,SeqType_128 , SeqType_256,SeqType_512]
    # allTpye = [SeqType_256]
    allTpye = [SeqType_512]

    for types in allTpye:
        width = math.floor(math.log2(len(types[0][0])))
        calculate(types,dataWidth,enlarge=False,validWidth=dataWidth)

    # for types in allTpye:
    #     width = math.floor(math.log2(len(types[0][0])))
    #     for validWidth in range(width,dataWidth+1):
    #         calculate(types,dataWidth,enlarge=True,validWidth=validWidth)

