import struct

def convert_dat_to_bin(dat_file, bin_file):
    # 打开DAT文件
    with open(dat_file, 'r') as f:
        data = f.read().split()  # 读取所有数据

    # 将数据解析为浮点数向量
    vector = [float(val) for val in data]
    print(vector)

    # 创建新的BIN文件
    with open(bin_file, 'wb') as f:
        # 将浮点数向量以二进制格式写入BIN文件
        for val in vector:
            f.write(struct.pack('f', val))

    print("DAT文件转换为BIN文件成功！")

# 调用函数进行转换
convert_dat_to_bin('E:\\Code\git\\hls_for_cnn_mnist\\python for train\\record\\W_fc2.dat', 'E:\\Code\git\\hls_for_cnn_mnist\\python for train\\record\\W_fc2.bin')