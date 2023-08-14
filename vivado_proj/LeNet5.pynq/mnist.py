from curses import KEY_HELP
import time
from pynq import Overlay
import numpy as np
from pynq import Xlnk
import struct
from scipy.misc import imread
import cv2

def readbinfile(filename,size):
    f = open(filename, "rb")
    z=[]
    for j in range(size):
        data = f.read(4)
        data_float = struct.unpack("f", data)[0]
        z.append(data_float)
    f.close()
    z = np.array(z)
    return z

def RunLeNet5(lenet5, w_conv0, b_conv0, w_conv1, b_conv1, w_fc0, b_fc0, w_fc1, b_fc1, feature_in, feature_out, result):
    lenet5.write(0x10,w_conv0.physical_address)
    lenet5.write(0x1c,b_conv0.physical_address)
    lenet5.write(0x28,w_conv1.physical_address)
    lenet5.write(0x34,b_conv1.physical_address)
    lenet5.write(0x40,w_fc0.physical_address)
    lenet5.write(0x4c,b_fc0.physical_address)
    lenet5.write(0x58,w_fc1.physical_address)
    lenet5.write(0x64,b_fc1.physical_address)
    lenet5.write(0x70,feature_in.physical_address)
    lenet5.write(0x7c,feature_out.physical_address)
    lenet5.write(0x88,result.physical_address)
    lenet5.write(0,(lenet5.read(0)&0x80)|0x01)
    tp=lenet5.read(0)
    while not ((tp>>1)&0x1):
          tp=lenet5.read(0)
	  
def Conv(CHin, Hin, Win, CHout, Kh, Kw, relu_en, feature_in, W, bias):
    Hout = Hin - Kh + 1
    Wout = Win - Kw + 1
    feature_out = []
    for cout in range(0, CHout):
        for hout in range(0, Hout):
           for wout in range(0, Wout):
                sum = 0
                for kh in range(0, Kh):
                    for kw in range(0, Kw):
                        h = hout + kh
                        w = wout + kw
                        for cin in range(0, CHin):
                            sum += feature_in[h][w][cin] * W[kh][kw][cin][cout]
                sum += bias[cout]
                if relu_en and sum < 0:
                    sum = 0
                feature_out[hout][wout][cout] = sum
    return feature_out

def Pool(CHin, Hin, Win, Kh, Kw, feature_in):
    Hout = Hin/Kh
    Wout = Win/Kw
    feature_out = []
    for cin in range(0, CHin):
        for hout in range(0, Hout):
            for wout in range(0, Wout):
                sum = -9999999
                for kh in range(0, Kh):
                    for kw in range(0,Kw):
                        h = hout*Kh + kh
                        w = wout*Kw + kw
                        sum = max(sum, feature_in[h][w][cin])
                feature_out[hout][wout][cin] = sum
    return feature_out

#Conv1
IN_WIDTH1      = 28
IN_HEIGHT1     = 28
IN_CH1         = 1
KERNEL_WIDTH1  = 5
KERNEL_HEIGHT1 = 5
OUT_CH1        = 16
OUT_WIDTH1     = 24
OUT_HEIGHT1    = 24

#Pool1
IN_WIDTH11     = OUT_WIDTH1
IN_HEIGHT11    = OUT_HEIGHT1
IN_CH11        = OUT_CH1

KERNEL_HEIGHT11= 2
KERNEL_WIDTH11 = 2
OUT_CH11       = IN_CH11
OUT_WIDTH11    = 12
OUT_HEIGHT11   = 12

#Conv2
IN_WIDTH2      = OUT_WIDTH11
IN_HEIGHT2     = OUT_HEIGHT11
IN_CH2         = OUT_CH11

KERNEL_WIDTH2  = 5
KERNEL_HEIGHT2 = 5
OUT_CH2        = 32
OUT_WIDTH2     = 8
OUT_HEIGHT2    = 8

#Pool2
IN_WIDTH21     = OUT_WIDTH2
IN_HEIGHT21    = OUT_HEIGHT2
IN_CH21        = OUT_CH2

KERNEL_HEIGHT21= 2
KERNEL_WIDTH21 = 2
OUT_CH21       = IN_CH21
OUT_WIDTH21    = 4
OUT_HEIGHT21   = 4

#Fc1
IN_WIDTH3      = OUT_WIDTH21
IN_HEIGHT3     = OUT_HEIGHT21
IN_CH3         = OUT_CH21

KERNEL_WIDTH3  = 4
KERNEL_HEIGHT3 = 4
X_STRIDE3      = 1
Y_STRIDE3      = 1
OUT_CH3        = 128
OUT_WIDTH3     = 1
OUT_HEIGHT3    = 1

#Fc2
IN_WIDTH4      = OUT_WIDTH3
IN_HEIGHT4     = OUT_HEIGHT3
IN_CH4         = OUT_CH3
KERNEL_WIDTH4  = 1
KERNEL_HEIGHT4 = 1

#output
OUT_CH4        = 10
OUT_WIDTH4     = 1
OUT_HEIGHT4    = 1

#
OUT_PREDICT    = 1

xlnk=Xlnk()

ol=Overlay("/home/xilinx/jupyter_notebooks/pynq_conv/design_1.bit")
ol.ip_dict
ol.download()
lenet5 = ol.lenet5_0
print("Overlay download finish");  

#input image
image   = xlnk.cma_array(shape=(IN_HEIGHT1,IN_WIDTH1,IN_CH1),cacheable=0,dtype=np.float32)

#conv0
W_conv0 = xlnk.cma_array(shape=(KERNEL_HEIGHT1,KERNEL_WIDTH1,IN_CH1,OUT_CH1),cacheable=0,dtype=np.float32)
B_conv0 = xlnk.cma_array(shape=(OUT_CH1),cacheable=0,dtype=np.float32)

#conv1
W_conv1 = xlnk.cma_array(shape=(KERNEL_HEIGHT2,KERNEL_WIDTH2,IN_CH2,OUT_CH2),cacheable=0,dtype=np.float32)
B_conv1 = xlnk.cma_array(shape=(OUT_CH2),cacheable=0,dtype=np.float32)

#fc0
W_fc0   = xlnk.cma_array(shape=(KERNEL_HEIGHT3, KERNEL_WIDTH3, IN_CH3, OUT_CH3),cacheable=0,dtype=np.float32)
B_fc0   = xlnk.cma_array(shape=(OUT_CH3),cacheable=0,dtype=np.float32)

#fc1
W_fc1   = xlnk.cma_array(shape=(KERNEL_HEIGHT4, KERNEL_WIDTH4, IN_CH4, OUT_CH4),cacheable=0,dtype=np.float32)
B_fc1   = xlnk.cma_array(shape=(OUT_CH4),cacheable=0,dtype=np.float32)

#output
H_fc1   = xlnk.cma_array(shape=(OUT_CH4),cacheable=0,dtype=np.float32)

#result
Predict = xlnk.cma_array(shape=(OUT_PREDICT),cacheable=0,dtype=np.int32)


#Initialize W, bias
W_Conv0=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/W_conv1.bin",KERNEL_HEIGHT1*KERNEL_WIDTH1*IN_CH1*OUT_CH1)
W_Conv0=W_Conv0.reshape((KERNEL_HEIGHT1,KERNEL_WIDTH1,IN_CH1,OUT_CH1))
for i in range(KERNEL_HEIGHT1):
    for j in range(KERNEL_WIDTH1):
        for k in range(IN_CH1):
        	for l in range(OUT_CH1):
        		W_conv0[i][j][k][l]=W_Conv0[i][j][k][l]
B_Conv0=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/b_conv1.bin",OUT_CH1)
for i in range(OUT_CH1):
	B_conv0[i]=B_Conv0[i]

W_Conv1=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/W_conv2.bin",KERNEL_HEIGHT2*KERNEL_WIDTH2*IN_CH2*OUT_CH2)
W_Conv1=W_Conv1.reshape((KERNEL_HEIGHT2,KERNEL_WIDTH2,IN_CH2,OUT_CH2))
for i in range(KERNEL_HEIGHT2):
    for j in range(KERNEL_WIDTH2):
        for k in range(IN_CH2):
        	for l in range(OUT_CH2):
        		W_conv1[i][j][k][l]=W_Conv1[i][j][k][l]
B_Conv1=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/b_conv2.bin",OUT_CH2)
for i in range(OUT_CH2):
	B_conv1[i]=B_Conv1[i]

W_Fc0=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/W_fc1.bin",KERNEL_HEIGHT3*KERNEL_WIDTH3*IN_CH3*OUT_CH3)
W_Fc0=W_Fc0.reshape((KERNEL_HEIGHT3,KERNEL_WIDTH3,IN_CH3,OUT_CH3))
for i in range(KERNEL_HEIGHT3):
    for j in range(KERNEL_WIDTH3):
        for k in range(IN_CH3):
        	for l in range(OUT_CH3):
        		W_fc0[i][j][k][l]=W_Fc0[i][j][k][l]
B_Fc0=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/b_fc1.bin",OUT_CH3)
for i in range(OUT_CH3):
	B_fc0[i]=B_Fc0[i]

W_Fc1=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/W_fc2.bin",KERNEL_HEIGHT4*KERNEL_WIDTH4*IN_CH4*OUT_CH4)
W_Fc1=W_Fc1.reshape((KERNEL_HEIGHT4,KERNEL_WIDTH4,IN_CH4,OUT_CH4))
for i in range(KERNEL_HEIGHT4):
    for j in range(KERNEL_WIDTH4):
        for k in range(IN_CH4):
        	for l in range(OUT_CH4):
        		W_fc1[i][j][k][l]=W_Fc1[i][j][k][l]
B_Fc1=readbinfile("E:/Code/git/hls_for_cnn_mnist/python for train/record/b_fc2.bin",OUT_CH4)
for i in range(OUT_CH4):
	B_fc1[i]=B_Fc1[i]

print("Finish initial")


while(1):
    while(1):
        g = input("input enter to continue")
        break

    image1 = cv2.imread("/home/xilinx/overlay/mnist/data/1.jpg", cv2.IMREAD_GRAYSCALE).astype(np.float32)
    print("Read image")

    # image1 = image1.reshape((IN_HEIGHT1, IN_WIDTH1, IN_CH1))
    for i in range(IN_HEIGHT1):
        for j in range(IN_WIDTH1):
            for k in range(IN_CH1):
                image[i][j][k] = (255 - image1[i][j]) / 255

    print("Finish reading image")
    
    out_layer0 = [[[0] * OUT_CH1 for _ in range(OUT_WIDTH1)] for _ in range(OUT_HEIGHT1)]
    out_layer1 = [[[0] * OUT_CH11 for _ in range(OUT_WIDTH11)] for _ in range(OUT_HEIGHT11)]
    out_layer2 = [[[0] * OUT_CH2 for _ in range(OUT_WIDTH2)] for _ in range(OUT_HEIGHT2)]
    out_layer3 = [[[0] * OUT_CH21 for _ in range(OUT_WIDTH21)] for _ in range(OUT_HEIGHT21)]
    out_layer4 = [[[0] * OUT_CH3 for _ in range(OUT_WIDTH3)] for _ in range(OUT_HEIGHT3)]
    out_layer5 = [[[0] * OUT_CH4 for _ in range(OUT_WIDTH4)] for _ in range(OUT_HEIGHT4)]

    # conv0
    out_layer0 = Conv(IN_CH1, IN_HEIGHT1, IN_WIDTH1, OUT_CH1, KERNEL_HEIGHT1, KERNEL_WIDTH1, 1, image, W_conv0, B_conv0)
    # pool0
    out_layer1 = Pool(IN_CH11, IN_HEIGHT11, IN_WIDTH11, KERNEL_HEIGHT11, KERNEL_WIDTH11, out_layer0)
    # conv1
    out_layer2 = Conv(IN_CH2, IN_HEIGHT2, IN_WIDTH2, OUT_CH2, KERNEL_HEIGHT2, KERNEL_WIDTH2, 1, out_layer1, W_conv1, B_conv1)
    # pool1
    out_layer3 = Pool(IN_CH21, IN_HEIGHT21, IN_WIDTH21, KERNEL_HEIGHT21, KERNEL_WIDTH21, out_layer2)
    # fc0
    out_layer4 = Conv(IN_CH3, IN_HEIGHT3, IN_WIDTH3, OUT_CH3, KERNEL_HEIGHT3, KERNEL_WIDTH3, 1, out_layer3, W_fc0, B_fc0)
    # fc1
    out_layer5 = Conv(IN_CH4, IN_HEIGHT4, IN_WIDTH4, OUT_CH4, KERNEL_HEIGHT4, KERNEL_WIDTH4, 0, out_layer4, W_fc1, B_fc1)
    # fmax
    MAX_SOFT = out_layer5[0][0][0]
    result = 0
    for i in range(1, OUT_CH4):
        if(out_layer5[0][0][i] > MAX_SOFT):
            MAX_SOFT = out_layer5[0][0][i]
            print(MAX_SOFT)
            result = i
    print("Software run finish, the result is " + str(result))
    RunLeNet5(lenet5, W_conv0, B_conv0, W_conv1, B_conv1, W_fc0, B_fc0, W_fc1, B_fc1, image, H_fc1, Predict)
    print("Hardware run finish")
    MAX_HARD = Predict[0]
    print("The number you write is " + str(MAX_HARD))