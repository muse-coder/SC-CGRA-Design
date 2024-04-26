import numpy as np

from Process.Multiply import *


def customFilter2D(img, kernel, mode):
    # 获取卷积核大小
    ksize = kernel.shape[0]
    # 获取卷积核中心坐标
    anchor = (ksize // 2, ksize // 2)
    # 对图像进行卷积操作
    rows, cols = img.shape
    dst = np.zeros_like(img)
    for i in range(anchor[0], rows - anchor[0]):
        for j in range(anchor[1], cols - anchor[1]):
            sum = 0
            for u in range(-anchor[0], ksize - anchor[0]):
                for v in range(-anchor[1], ksize - anchor[1]):
                    # 使用自定义的近似乘法函数进行卷积操作
                    if (mode == 1):
                        res = approximateMultiply(img[i + u, j + v], kernel[u + anchor[0], v + anchor[1]])
                        sum += res
                    else:
                        sum += accurateMultiply(img[i + u, j + v], kernel[u + anchor[0], v + anchor[1]])
            dst[i, j] = sum
    return dst

