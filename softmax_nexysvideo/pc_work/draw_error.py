# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import numpy as np
import random
import matplotlib.pyplot as plt


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.
    print('my first line of python except for micropython')


def file_write():
    with open('test.txt', 'w') as file_boj:
        file_boj.write('write successfully\n')


def file_read():
    with open('test.txt', 'r') as file_obj:
        contents = file_obj.read()
        print(contents.rstrip())





def draw_error():
    fpga_arr = np.loadtxt('FPGA_result.txt', dtype=np.float32)
    pc_arr = np.loadtxt('PC_result.txt', dtype=np.float32)
    error = abs(fpga_arr - pc_arr)
    # for _ in error:
    #     if _ > 0.00000001:
    #         cnt += 1
    # error = np.minimum(error, 0.0002)
    plt.figure(figsize=(6, 18))
    # plt.subplot(311)
    # plt.ylabel('Result Scatte of two')
    # plt.plot(pc_arr, "*")
    # plt.plot(fpga_arr, "+")
    # plt.subplot(312)
    # plt.xlabel('PC Result')
    # plt.ylabel('FPGA Result')
    # plt.plot(pc_arr, fpga_arr, "*")
    plt.subplot(311)
    plt.ylabel('Absolute Error')
    plt.plot(error, "*")
    plt.show()


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    draw_error()
    print('draw error finished')
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
