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
#include <rtthread.h>
void func_test1_thread()
{
	int i=0;
    while(1)
    {
    printf("test thread1 %d -----------\r\n",i++);
//    mdelay(100);
	rt_thread_mdelay(100);
    }
}

void func_test2_thread()
{
	int i=0;
    while(1)
    {
    printf("test thread2 %d \r\n",i++);
    mdelay(200);
    }
}
void func_test3_thread()
{
	int i=0;
    while(1)
    {
    printf("test thread3 %d \r\n",i++);
    mdelay(200);
    }
}

	static struct rt_thread test1_thread;
	static struct rt_thread test2_thread;
	static struct rt_thread test3_thread;
	ALIGN(RT_ALIGN_SIZE)
	static rt_uint8_t rt_test1_thread_stack[1024];
	static rt_uint8_t rt_test2_thread_stack[1024];
	static rt_uint8_t rt_test3_thread_stack[1024];
int main(void)
{	

	   rt_thread_init(&test1_thread,
                    "test1",
                    func_test1_thread,
                    RT_NULL,
                    &rt_test1_thread_stack[0],
                    sizeof(rt_test1_thread_stack),
                   3,
                    1);

    rt_thread_init(&test2_thread,
                    "test2",
                    func_test2_thread,
                    RT_NULL,
                    &rt_test2_thread_stack[0],
                    sizeof(rt_test2_thread_stack),
                    5,
                    50);
	rt_thread_init(&test3_thread,
                    "test3",
                    func_test3_thread,
                    RT_NULL,
                    &rt_test3_thread_stack[0],
                    sizeof(rt_test3_thread_stack),
                    5,
                    10);

    rt_thread_startup(&test1_thread); 
    rt_thread_startup(&test2_thread);
	rt_thread_startup(&test3_thread);
	while(1){
		printf("Hello World!\n");
		//rt_hw_console_getchar();
		//rt_hw_console_getchar();
		rt_thread_mdelay(1000);
	}
    return 0;
}
