#ifndef  softmax_h
#define  softmax_h

#define     softmax_start_reg_addr      0x40010000
#define     softmax_num_reg_addr        0x40010004
#define     softmax_data_start_addr     0x40010008

#define     softmax_start_config        0x55550000
#define     softmax_end_flag            0x00000000

#define     divisor                     16777216


void softmax_cal_start();
void softmax_num_config(int num);
void write_data_to_softmax(int data_offset,int data[],int num);
void read_result_from_softmax(int data_offset,float buf[],int num);
void printf_result_from_softmax(int data_offset,int num);
int get_softmax_status();
void sd_softmax_cal();

int my_pow(int m,int n);
void printf_fix_array(int fix_data[],int num);
void printf_float_array(float row_data[],int num);
void max_deal(double row_data[],int num);
void doubled2fix16(double row_data[],int fix_data[],int num);


//example
void test_softmax_512_0();
void test_512_0();
void data_mcu_pre_deal_test();

#endif