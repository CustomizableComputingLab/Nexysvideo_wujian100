# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import numpy as np
import random
import matplotlib.pyplot as plt
import sys


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.
    # print('my first line of python except for micropython')


def file_write():
    with open('test.txt', 'w') as file_boj:
        file_boj.write('write successfully\n')


def file_read():
    with open('test.txt', 'r') as file_obj:
        contents = file_obj.read()
        print(contents.rstrip())


# save data number and float data in each line of float_data.txt
# calculate the softmax result and save in each line of PC_result.txt
def random_float_to_file(number):
    with open('data.txt',  'w') as float_data_obj:
        float_data_obj.write(str(number))
        float_data_obj.write('\n')
        float_arr = []*number
        for i in range(number):
            float_arr.append(random.uniform(-5, 5))
        x = np.array(float_arr)
        # print(x)
        np.savetxt(float_data_obj, x, fmt='%10.10f')
        x = np.exp(x)
        # print(x)
        x = x*1.0/np.sum(x)
        # print(x)
        # np.savetxt('PC_result.txt', x, fmt='%13.12f')
        np.savetxt('PC_result.txt', x, fmt='%10.10f')
#
# def draw_error():
#     fpga_arr = np.loadtxt('PC_result.txt', dtype=np.float32)
#     pc_arr = np.loadtxt('PC_result.txt', dtype=np.float32)
#     error = abs(fpga_arr - pc_arr)
#     plt.figure(figsize=(6, 18))
#     plt.subplot(311)
#     plt.ylabel('Result Scatte of two')
#     plt.plot(pc_arr, "*")
#     plt.plot(fpga_arr, "+")
#     plt.subplot(312)
#     plt.xlabel('Right Result')
#     plt.ylabel('FPGA Result')
#     plt.plot(pc_arr, fpga_arr, "*")
#     plt.subplot(313)
#     plt.ylabel('Absolute Error')
#     plt.plot(error, "*")
#     plt.show()


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # random_float_to_file(1024)
    random_float_to_file(int(sys.argv[1]))
    print('float data generated successfully')
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
