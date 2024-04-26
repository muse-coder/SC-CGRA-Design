
from skimage.metrics import structural_similarity as compare_ssim
import tifffile
import cv2
import numpy as np

from Process.CustomFilter import *


def processEval(originImg,accurateImg,approximateImg,processName):
    # print("####################################")
    print("*****{0}*****".format(processName))
    metricEval(originImg, evalImg=accurateImg, evalName=processName)
    print("\n")
    metricEval(originImg, evalImg=approximateImg, evalName=processName)
    print("\n")
    print("compare approximate mote with accurate mode")
    ssimEval(accurateImg, approximateImg)
    print("####################################\n\n")


def metricEval(originImg, evalImg,evalName):
    print(evalName)
    ssimEval(originImg ,evalImg)
    psnrEval(originImg ,evalImg)
    return

def imgShow(imgName, img):
    cv2.imshow(imgName, img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


def ssimEval(originImg, evalImg):
    ssim = compare_ssim(originImg, evalImg, full=True)[0]
    print("ssim: %f" % ssim)


def psnrEval(orignImg,evalImg):
    psnr = cv2.PSNR(orignImg, evalImg)
    print('PSNR:', psnr)

def imgSave(imgName,imgSource):
    cv2.imwrite(imgName+'.png', imgSource)


# 定义近似乘法函数
def smoothProcess(smoothingKernel,originImg):
    smooth_f = open('./smooth.txt', 'w+')
    # 对图像进行平滑处理操作
    smooth_accurate_img = customFilter2D(originImg, smoothingKernel, accurate_mode)
    smooth_approximate_img = customFilter2D(originImg, smoothingKernel, approximate_mode)
    processEval(originImg, accurateImg = smooth_accurate_img, approximateImg = smooth_approximate_img, processName='smoothing')
    smooth_approximate_img_Name =  "_approximate_"
    smooth_accurate_img_Name =    "_accurate_"
    imgSave(imgName=smooth_approximate_img_Name ,imgSource=smooth_approximate_img )
    imgSave(imgName=smooth_accurate_img_Name ,imgSource=smooth_accurate_img )
    smooth_f.close()

def sharpenProcess(sharpenKernel,originImg):
    sharpen_f = open('./sharpen.txt', 'w+')
    sys.stdout = sharpen_f
    # 对图像进行平滑处理操作
    sharpen_approximate_img = customFilter2D(originImg, sharpenKernel, approximate_mode)
    sharpen_accurate_img = customFilter2D(originImg, sharpenKernel, accurate_mode)
    processEval(originImg, accurateImg = sharpen_accurate_img, approximateImg = sharpen_approximate_img, processName='sharpen')
    sharpen_approximate_img_Name ="sharpen_approximate_"
    sharpen_accurate_img_Name ="sharpen_accurate_"
    # imgShow(imgName=sharpen_approximate_img_Name ,img=sharpen_approximate_img )
    # imgShow(imgName=sharpen_accurate_img_Name, img=sharpen_accurate_img)

    imgSave(imgName=sharpen_approximate_img_Name ,imgSource=sharpen_approximate_img )
    imgSave(imgName=sharpen_accurate_img_Name ,imgSource=sharpen_accurate_img )
    sharpen_f.close()
# 读取图像
import sys
if __name__ == "__main__":
    imagePath = './standard_test_images/lena_color_512.tif'
    originImg = cv2.imread(imagePath, cv2.IMREAD_GRAYSCALE)
    imgSave(imgName="origin", imgSource=originImg)
    accurate_mode = 0
    approximate_mode = 1
    kernelLB = 3
    kernelUB = 5

    # smoothingKernel = np.ones((3, 3), dtype=np.int32) * (1 / (9))
    # smoothed_image = cv2.GaussianBlur(originImg, (5, 5), 0)
# 62
# 367

    kernel2 = np.array([[0, -0.388, 0],
                       [-0.4, 2.37, -0.4],
                       [0, -0.4, 0]], dtype=np.float32)

    sharpenProcess(kernel2 ,originImg )
