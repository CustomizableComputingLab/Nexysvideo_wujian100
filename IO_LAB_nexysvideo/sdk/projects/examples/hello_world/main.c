/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     main.c
 * @brief    hello world
 * @version  V1.0
 * @date     17. Jan 2018
 ******************************************************************************/

#include <stdio.h>
#include"key.h"
#include"led.h"
#include "oled128_32.h"
#include "ff.h"		/* Declarations of FatFs API */

FATFS FatFs;		/* FatFs work area needed for each volume */
FIL Fil;			/* File object needed for each open file */

extern void mdelay(uint32_t ms);
void sd_test();

int main(void)
{
    printf("Hello World!\n");
    key_gpio_intr(PA8);
    LED_Init();
    OLED_SHOW();
    sd_test();
    while(1)
    {
        LED_ON();
        mdelay(500);
        LED_OFF();
        mdelay(500);
    }
    return 0;
}

void sd_test()
{
	UINT bw;
	FRESULT fr;


	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */

	fr = f_open(&Fil, "newfile.txt", FA_WRITE | FA_CREATE_ALWAYS);	/* Create a file */
	if (fr == FR_OK) {
		f_write(&Fil, "It works!\r\n", 11, &bw);	/* Write data to the file */
		fr = f_close(&Fil);							/* Close the file */
		if (fr == FR_OK && bw == 11) {		
			printf("sd card success\r\n");
		}
	}
}