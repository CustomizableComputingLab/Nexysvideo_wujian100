#include"softmax.h"
#include"io.h"
#include"stdio.h"
#include"ff.h"

/*
generate a signal to let the softmax module start to calculate
In fact, the softmax calculate the results faster than writing data to it using AHB
So this should be called after the data and num_reg is configured in case of wrong results.
*/
void softmax_cal_start()
{
    REG32(softmax_start_reg_addr) = softmax_start_config;
}

/*
config the data num to calculate      
the data is calculated from 0x40010008 to 0x40010008 + (num-1)*4 !!!!!!!!!!!!!!!!!!!!!!!! 
*/
void softmax_num_config(int num)
{
    REG32(softmax_num_reg_addr) = num;
}

/*   
data_offset shoulde be 0 to fff4
*/
void write_data_to_softmax(int data_offset,int data[],int num)
{
    int i;
    for(i=0;i<num;i++)
    {
        REG32(i*4 + data_offset + softmax_data_start_addr) = data[i];
    }
}

/*
return 0 if data is valid
In fact, the function returns 0 when module write the first result to the RAM.
Because the results write to RAM is faster than AHB, so the results is always valid.
*/
int get_softmax_status()
{
    int temp;
    temp = REG32(softmax_num_reg_addr);
    return temp;
}


/*
data_offset shoulde be 0 to fff4
*/
void read_result_from_softmax(int data_offset,float buf[],int num)
{
    int i;
    for(i=0;i<num;i++)
        buf[i] = REG32(i*4 + data_offset + softmax_data_start_addr);
}


/*
data_offset shoulde be 0 to fff4
*/
void printf_result_from_softmax(int data_offset,int num)
{
    int i;
    for(i=0;i<num;i++)
        printf("result at addr%x is %x \r\n",data_offset + i*4 + softmax_data_start_addr,REG32(i*4 + data_offset + softmax_data_start_addr) );
}


/**********************************************************/
/*******************row data pre_cal**********************/
//calculate the m^n
int my_pow(int m,int n)
{
    int i;
    int ret = m;
    for(i=0;i<n-1;i++)
        ret*=m;
    return ret;
}

void printf_fix_array(int fix_data[],int num)
{
    int i;
    for(i=0;i<num;i++)
        printf("%x\r\n",fix_data[i]);
}

void printf_float_array(float row_data[],int num)
{
    int i;
    for(i=0;i<num;i++)
        printf("%f\r\n",row_data[i]);
}

void max_deal(double row_data[],int num)
{       
    double max = row_data[0];
    int i;
    for(i=1;i<num;i++)
    {
        if(max < row_data[i])
            max = row_data[i];
    }
//     printf("double_max is %f\r\n",max);

    for(i=0;i<num;i++)
    {
        row_data[i] = max - row_data[i];                //get the |x|
    }
}

void double2fix16(double row_data[],int fix_data[],int num)
{
    int i;
    int zhengshu;
    double xiaoshu;
    int dot_pos;
    for(i=0;i<num;i++)
    {   
        dot_pos = 0;
        zhengshu = (int)row_data[i];
        xiaoshu = row_data[i] - zhengshu;
//         printf("row_data: %f  zhengshu is %d, xiaoshu is %f, ",row_data[i],zhengshu,xiaoshu);
        while(zhengshu != 0)
        {
            dot_pos++;
            zhengshu >>= 1;
        }
        // printf("dot_pos is %d , ",dot_pos);
        fix_data[i] = (int) (row_data[i] * my_pow(2,13-dot_pos));
        fix_data[i] += dot_pos << 13;
//         printf("hex of fix_data is %x \r\n",fix_data[i]);
    }
}


//end address should be 0x40010008 + 0x800 - 4 = 0x40010804
void test_softmax_512_0()
{
    int i = 0;
    for(i=0;i<512*4+8;i+=4)
    {
        *(volatile uint32_t *)(0x40010000 + i) = 0;
    }
    *(volatile uint32_t *)0x40010004 = 512;
    *(volatile uint32_t *)0x40010000 = 0x55550000;
    printf("write all data and configuration\r\n");
    while( (*(volatile uint32_t *)0x40010004) != 0x00000000 );
    printf("caculate all data already \r\n");
    for(i=0;i<512*4;i+=4)
    {
        printf("result at addr %x    is    %x\r\n",(0x40010008+i),*(volatile uint32_t *)(0x40010008+i) );
    }
    printf("finish\r\n");
    // while(1);
}


void test_512_0()
{
    int row_data[32] = {0};
    float res[32] = {0};
    int i;
    int data_offset;
    printf("softmax_test_512_0 start\r\n");
    for(i=0;i<16;i++)
    {
        data_offset = i * 32 * 4;
        write_data_to_softmax(data_offset,row_data,32);
    }
    softmax_num_config(512);
    softmax_cal_start();
    while(get_softmax_status());//return 0 if result valid
    printf_result_from_softmax(0,512);
    printf("softmax_test_512_0 finish\r\n");

    read_result_from_softmax(0,res,32);  //get the sub_results from fpga
    for(i=0;i<32;i++)
    {
        res[i]/= divisor;
        printf("%d result is %f\r\n",i,res[i]);
    }
}



void data_mcu_pre_deal_test()
{
    float row_data_array[11]={4.51346542727,
                            -0.575274318749,
                            0.847524503865,
                            1.36382970336,
                            1.97547231451,
                            1.43599437104,
                            -4.98817709218,
                            2.88877261067,
                            1.72245818548,
                            -0.946137884747,
                            4.99992225731};
    int fix_data_array[11]={0};
    int num = sizeof(row_data_array)/sizeof(row_data_array[0]);
    int i;

    printf("print the row data:\r\n");
    printf_float_array(row_data_array,num);
    max_deal(row_data_array,num);
    printf("calculate max - the row data\r\n");
    printf_float_array(row_data_array,num);
    printf("get the fix_data\r\n");
    float2fix16(row_data_array,fix_data_array,num);
    printf_fix_array(fix_data_array,num);

    //send to fpga
    write_data_to_softmax(0,fix_data_array,11);
    softmax_num_config(11);
    softmax_cal_start();
    while(get_softmax_status());//return 0 if result valid
    printf_result_from_softmax(0,11);
    read_result_from_softmax(0,row_data_array,11);  //get the sub_results from fpga
    
    for(i=0;i<11;i++)
    {
        row_data_array[i] /= divisor;                    //calculate the final results
        printf("result[%d] is %f\r\n",i,row_data_array[i]); 
    }
    printf("calculate all the row data to the final results already\r\n");
}


void sd_softmax_cal()
{
    FATFS FatFs;		/* FatFs work area needed for each volume */
    FIL Fil;			/* File object needed for each open file */
    FRESULT fr;
    int num = 0;        //float data num
    char buf[90];
    UINT br;
    int i;
    float *float_data;
	double* double_data;
    int *fix_data;
    
    f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    fr = f_open(&Fil,"data.txt",FA_READ);
    if(fr == FR_OK)
    {
        f_gets(buf,10,&Fil);
        num = atoi(buf);
         printf("the data number is %d\r\n",num);
        float_data = (float*)malloc(sizeof(float)*num);
        fix_data = (int*)malloc(sizeof(int)*num);
		double_data=(double*)malloc(sizeof(double)*num);
        //get the float data 
        for(i=0;i<num;i++)
        {
            f_gets(buf,20,&Fil);
//            float_data[i] = atof(buf);
			double_data[i]= atof(buf);
//             printf("%.12f\n",float_data[i]);
//			printf("%.12lf\n",double_data[i]);
        }
//		while(1);
        max_deal(double_data,num);                   //max - data[i]
        double2fix16(double_data,fix_data,num);       //float to 16 fix_point
        for(i=0;i<num;i++)                          //write fix_point data to softmax hardware
        {
            write_data_to_softmax(0,fix_data,num);
        }
        softmax_num_config(num);
        softmax_cal_start();                        //hardware enable
        printf("hardware starts running\r\n");
        while(get_softmax_status());                //wait until hardware finished
        printf("hardware finished\r\n");
        read_result_from_softmax(0,float_data,num);  //get the sub_results from fpga
        read_result_from_softmax(0,fix_data,num);  //get the sub_results from fpga
        double temp;
        for(i=0;i<num;i++)
        {
             float_data[i] = (double)float_data[i] / (divisor*1.0);
//             printf("0x%x\n",fix_data[i]);
//             printf("%d\n",fix_data[i]);
//            printf("%x\n",*(volatile uint32_t *)(0x40010008+i*4));
             printf("%10.10f\n",float_data[i]);
//             printf("%x\n",float_data[i]);
//            temp = (double)fix_data[i];
//            temp /= divisor;
//             printf("%lf\n",temp); 
        }
         printf("final calculate already\r\n");
        f_close(&Fil);
    }
    else
        printf("file open error\r\n");
}

