import cv2
import numpy as np
imagePath = './standard_test_images/lena_color_256.tif'
import tifffile

image = tifffile.imread(imagePath)

# Load image
# image = cv2.imread('image.jpg')

# Convert to grayscale
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Smooth filter (Gaussian blur)
blur = cv2.GaussianBlur(gray, (5,5), 0)

# Sharpening filter (unsharp masking)
kernel = np.array([[-1,-1,-1], [-1,9,-1], [-1,-1,-1]])
sharpen = cv2.filter2D(gray, -1, kernel)

# Display images
cv2.imshow('Original', gray)
cv2.imshow('Smooth filter', blur)
cv2.imshow('Sharpening filter', sharpen)
cv2.waitKey(0)
cv2.destroyAllWindows()