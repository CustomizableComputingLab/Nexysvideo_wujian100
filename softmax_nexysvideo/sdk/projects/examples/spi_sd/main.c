/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     main.c
 * @brief    hello world
 * @version  V1.0
 * @date     17. Jan 2018
 ******************************************************************************/
#define sd_clk_freq     1000000
#include <stdio.h>
#include "pin_name.h"
#include "soc.h"
#include "drv_spi.h"
#include "drv_gpio.h"
#include "vs1053.h"
#include "oled128_32.h"
#include "softmax.h"

extern void mdelay(uint32_t ms);
static void spi_event_cb_fun(int32_t idx, spi_event_e event);
static void gpio_interrupt_handler(int32_t idx);

// int main(void)
// {
//     printf("Hello World!\n");
//     //int i;
//     int32_t ret;
//     spi_handle_t spi_handle_t;
//     gpio_pin_handle_t pin = NULL; 
//     gpio_pin_handle_t rst_pin = NULL; 

//     pin = csi_gpio_pin_initialize(PA19, gpio_interrupt_handler);        //gpio PA28 
//     csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
//     csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_OUTPUT);

//     rst_pin = csi_gpio_pin_initialize(PA20, gpio_interrupt_handler);        //gpio PA28 
//     csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
//     csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_OUTPUT);


//     spi_handle_t = csi_spi_initialize(2, spi_event_cb_fun);             //test usi 1   
//     if (spi_handle_t == NULL) {
//         printf(" csi_spi_initialize failed\n");
//         return -1;
//     }
//     ret = csi_spi_config(spi_handle_t, sd_clk_freq, SPI_MODE_MASTER,
//                          SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB,
//                          SPI_SS_MASTER_SW, 8);

//     if (ret != 0) {
//         printf("%s(), %d spi config error, %d\n", __func__, __LINE__, ret);
//         return -1;
//     }

//     while(1)
//     {   
//         // int i = 0;
//         // uint8_t buf[26]={0};
//         // uint8_t rx_buf[26] = {0};
//         // for(i=0;i<26;i++)
//         //     buf[i] = 0xff;
//         csi_gpio_pin_write(pin,0);
//         csi_gpio_pin_write(rst_pin,0);
//         mdelay(2);
//         // //csi_spi_send(spi_handle_t,"abcdefghijklmnopqrstuvwxyz",26);
//         // // csi_spi_transfer(spi_handle_t,buf,rx_buf,26,26);
//         // for(i=0;i<26;i++)
//         //     csi_spi_transfer(spi_handle_t,buf,rx_buf,1,1);
//         // mdelay(1);
//         // csi_spi_transfer(spi_handle_t,buf,rx_buf,26,26);
//     	uint8_t rx_buff[100]={0};
//         uint8_t tx_buff[100];
//         uint32_t i = 0;
//         for(i=0;i<100;i++)
//             tx_buff[i] = 0xff;
//         csi_spi_transfer(spi_handle_t,tx_buff,rx_buff,100,100);
//         mdelay(2);
//         csi_gpio_pin_write(pin,1);
//         csi_gpio_pin_write(rst_pin,1);
//         mdelay(2);
//     }

//     return 0;
// }

// static void gpio_interrupt_handler(int32_t idx)
// {

// }

// static void spi_event_cb_fun(int32_t idx, spi_event_e event)
// {
//     //printf("\nspi_event_cb_fun:%d\n",event);
// }

extern void VS_SPI_TEST();
extern void DQ_PIN_TEST();
#include "ff.h"		/* Declarations of FatFs API */

FATFS FatFs;		/* FatFs work area needed for each volume */
FIL Fil;			/* File object needed for each open file */


// OLED_TEST();
// VS_SPI_TEST();													 
// DQ_PIN_TEST();
// ret = VS_Ram_Test();
// printf("%d\r\n",ret);
// if(ret == 0X83FF)
//     printf("vs spi success\r\n");
// else   
//     printf("error\r\n");
int main (void)
{
	UINT bw;
    UINT br;
    // char buf[2048]={0};
    char buf[32]={0};
	FRESULT fr;
    int i;
    uint16_t ret = 0;
    
    printf("cpu runs \r\n");
//	while(1);
//     test_softmax_512_0();
    sd_softmax_cal();
    while(1);
    VS_Init();
    VS_Sine_Test();

  

    /*softmax test*/
    test_512_0();


    /*file system runs*/
	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */

    // fr = f_open(&Fil,"love_you.wav",FA_READ);
    fr = f_open(&Fil,"love_you.mp3",FA_READ);
    if(fr == FR_OK)
    {
        printf("start to play the song\r\n");
    	VS_Restart_Play();  					//重启播放 
		VS_Set_All();        					//设置音量等信息 			 
		VS_Reset_DecodeTime();					//复位解码时间 	

        // while((fr == FR_OK) || br > 0)
        while(fr == FR_OK)      
        {
            fr = f_read(&Fil,buf,2048,&br);
            // for(i=0;i<512;i++)
            //     printf("%x ",buf[i]);
            for(i=0;i<64;i++)
            {
                while(VS_Send_MusicData(buf + 32*i) == 1);       //return 0 if send data valid...
                // br -= 32;
            }
            // if((fr != FR_OK) && (br!=0))
            // break;
        }
        fr = f_close(&Fil);
        printf("the song is played over\r\n");
    }
    else
        printf("can't open file successfully\r\n");


    // if (fr == FR_OK && bw == 512)
    // {
    //     printf("file read success\r\n");
    // }
    // for(i=0;i<512;i++)
    //     printf("%x ",buf[i]);

	// fr = f_open(&Fil, "newfile.txt", FA_WRITE | FA_CREATE_ALWAYS);	/* Create a file */
	// if (fr == FR_OK) {
	// 	f_write(&Fil, "It works!\r\n", 11, &bw);	/* Write data to the file */
	// 	fr = f_close(&Fil);							/* Close the file */
	// 	if (fr == FR_OK && bw == 11) {		/* Lights green LED if data written well */
	// 		//DDRB |= 0x10; PORTB |= 0x10;	/* Set PB4 high */
    //         printf("sd card success\r\n");
	// 	}
	// }
	while(1);
}




// int main()
// {
//     // test_512_0();
//     // printf("first output\r\n");
//     // test_512_0();
//     // printf("second output\r\n");
//     data_mcu_pre_deal_test();
//     data_mcu_pre_deal_test();           //test for at least two times to ensure it works
//     while(1);
//     return 0;
// }





// #include "ff.h"

// extern void rcvr_mmc (
// 	BYTE *buff,	/* Pointer to read buffer */
// 	UINT bc		/* Number of bytes to receive */
// );
// extern void xmit_mmc (
// 	const BYTE* buff,	/* Data to be sent */
// 	UINT bc				/* Number of bytes to send */
// );

// extern void spi_test();
// int main(void)
// {
//     //test_softmax_512_0();
//     spi_test();
//     uint8_t rx_buff[100]={0};

//     soft_spi_init();
//     while(1)
//     {   
//         mdelay(2);    
//         xmit_mmc("abcdefghijklmnopqrstuvwxyz",26);
//         rcvr_mmc(rx_buff,100);  
//     }
// }