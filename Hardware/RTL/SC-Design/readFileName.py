import os
workingnPath = os.getcwd()
directoryPath = workingnPath +'/SC_ARCH/'
assert (os.path.exists(directoryPath))
	# print(root)
	# print(dirs)
	# print(files)
# print(directoryPath)
fileName=open('fileName.txt',mode='w+')
for root,dirs,files in os.walk(directoryPath):
	for file in files:
		writeLine = ("\t{$RTL_PATH/"+file+"}\\")
		writeLine = writeLine + '\n'
		fileName.write(writeLine)
		# print("{$RTL_PATH/"+file+"}",end='\ \n')
fileName.close()