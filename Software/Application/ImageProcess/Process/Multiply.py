import math

from Process.Stochastic.components import scaled_mul


def accurateMultiply(a, b):
    return float(a * b )


def approximateMultiply(a, b):
    # sobol_1 = [0, 16, 24, 8, 12, 28, 20, 4, 6, 22, 30, 14, 10, 26, 18, 2, 3, 19, 27, 11, 15, 31, 23, 7, 5, 21, 29, 13,
    #            9, 25, 17, 1]
    #
    # sobol_2 = [0, 16, 8, 24, 12, 28, 4, 20, 10, 26, 2, 18, 6, 22, 14, 30, 15, 31, 7, 23, 3, 19, 11, 27, 5, 21, 13, 29,
    #            9, 25, 1, 17]
    sobol_1=  [0,32,48,16,24,56,40,8,12,44,60,28,20,52,36,4,6,38,54,22,30,62,46,14,10,42,58,26,18,50,34,2,3,35,51,19,27,59,43,11,15,47,63,31,23,55,39,7,5,37,53,21,29,61,45,13,9,41,57,25,17,49,33,1]
    sobol_2=  [0,32,16,48,24,56,8,40,20,52,4,36,12,44,28,60,30,62,14,46,6,38,22,54,10,42,26,58,18,50,2,34,17,49,1,33,9,41,25,57,5,37,21,53,29,61,13,45,15,47,31,63,23,55,7,39,27,59,11,43,3,35,19,51]
    # sobol_1= [0, 64, 96, 32, 48, 112, 80, 16, 24, 88, 120, 56, 40, 104, 72, 8, 12, 76, 108, 44, 60, 124, 92, 28, 20, 84, 116, 52, 36, 100, 68, 4, 6, 70, 102,
    #             38, 54, 118, 86, 22, 30, 94, 126, 62, 46, 110, 78, 14, 10, 74, 106, 42, 58, 122, 90, 26, 18, 82, 114, 50, 34, 98, 66, 2, 3, 67, 99, 35, 51, 115,
    #           83, 19, 27,91, 123, 59, 43, 107, 75, 11, 15, 79, 111, 47, 63, 127, 95, 31, 23, 87, 119, 55, 39, 103, 71, 7, 5, 69, 101, 37, 53, 117,
    #           85, 21, 29, 93,125, 61, 45, 109, 77, 13, 9, 73, 105, 41, 57, 121, 89, 25, 17, 81, 113, 49, 33, 97, 65, 1]

    # sobol_2= [0, 64, 32, 96, 48, 112, 16, 80, 40, 104, 8, 72, 24, 88, 56, 120, 60, 124, 28, 92, 12, 76, 44, 108, 20, 84, 52, 116, 36, 100, 4,
    #           68, 34, 98, 2, 66, 18, 82, 50, 114, 10, 74, 42, 106, 58, 122, 26, 90, 30, 94, 62, 126, 46, 110, 14, 78, 54, 118, 22, 86, 6, 70,
    #           38, 102, 51, 115, 19, 83, 3, 67, 35, 99, 27, 91, 59, 123, 43, 107, 11, 75, 15, 79, 47, 111, 63, 127, 31, 95, 39, 103, 7, 71, 23,
    #           87, 55, 119, 17, 81, 49, 113, 33, 97, 1, 65, 57, 121, 25, 89, 9, 73, 41, 105, 45, 109, 13, 77, 29, 93, 61, 125, 5, 69, 37, 101, 53, 117, 21, 85]
    #########################################################
    dataWidth = 16  ###
    sobolWidth = int(math.log(len(sobol_1), 2))  ###
    validSegWidth = sobolWidth + 1  ###
    flag =0
    # accurate_res = a * b
    # b = b * 10
    scale = 155
    b = b * scale

    if(b<0):
        flag = 1
        b = -b
    if(a*b==0):
        return 0
    num_1 = int(a)
    num_2 = int(b)
    isc_res = scaled_mul(
        num_1=num_1, num_2=num_2,
        sobol_1=sobol_1, sobol_2=sobol_2, validSegWidth=validSegWidth,
        sobolWidth=sobolWidth, dataWidth=dataWidth
    )
    error = abs(isc_res / (a*num_2) - 1)
    if(error>0.07):
        print("error")
        assert (error>0.05)
    # print(a*b/100)
    # print(isc_res/100)
    # return isc_res/100
    if flag :
        return float((-isc_res)/(scale))
    else:
        return float(isc_res/(scale))