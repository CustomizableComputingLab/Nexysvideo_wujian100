
#include <stdint.h>
#include <rthw.h>
#include <rtthread.h>
#include "drv_timer.h"
#include "stdio.h"
#include "soc.h"
#include "drv_usi_usart.h"
#include "wj_usi.h"
void SysTick_Handler(void)
{
    /* enter interrupt */
   rt_interrupt_enter();

    rt_tick_increase();

    /* leave interrupt */
    rt_interrupt_leave();
}

static void timer_event_cb_fun(int32_t idx, timer_event_e event)
{
//	printf("%d int event\n",idx);
	SysTick_Handler();

}
static timer_handle_t _SysTick_Config(rt_uint32_t ticks)
{
	timer_handle_t timer1_handle;
	timer1_handle=csi_timer_initialize(1,timer_event_cb_fun);
	csi_timer_config(timer1_handle,TIMER_MODE_RELOAD);
	csi_timer_set_timeout(timer1_handle,1000000/ticks);
	csi_timer_start(timer1_handle);
	return timer1_handle;
}

#if defined(RT_USING_USER_MAIN) && defined(RT_USING_HEAP)
#define RT_HEAP_SIZE 1024
static uint32_t rt_heap[RT_HEAP_SIZE];     // heap default size: 4K(1024 * 4)
RT_WEAK void *rt_heap_begin_get(void)
{
    return rt_heap;
}

RT_WEAK void *rt_heap_end_get(void)
{
    return rt_heap + RT_HEAP_SIZE;
}
#endif

/**
 * This function will initial your board.
 */
 extern usart_handle_t console_handle;
extern volatile rt_uint8_t rt_interrupt_nest;
void rt_hw_board_init()
{
	uint32_t value;
    timer_handle_t timer1_handle=_SysTick_Config( RT_TICK_PER_SECOND);
	printf("board int success\n");

#ifdef RT_USING_COMPONENTS_INIT
    rt_components_board_init();
#endif

#if defined(RT_USING_USER_MAIN) && defined(RT_USING_HEAP)
    rt_system_heap_init(rt_heap_begin_get(), rt_heap_end_get());
#endif
}


static uint8_t buff[100];
static uint32_t buff_addr=0;
void uart_cb(int32_t idx, usart_event_e event)
{
	uint32_t i=0;
	wj_usi_reg_t *addr = (wj_usi_reg_t *)WJ_USI0_BASE;
	buff[i] = addr->USI_TX_RX_FIFO;
	i++;
	while(1)
	{
		
		drv_usi_usart_getchar(console_handle,&buff[i]);
		buff_addr=i;
		
		if(buff[i]=='\n'||i>=100)
			break;
		i++;
	}
}
static uint32_t buff_i=0;
char rt_hw_console_getchar(void){
	if(buff_addr==0)
	{
		buff_i=0;
		rt_thread_mdelay(10);
	}
	else if(buff_i<=buff_addr)
	{
		buff_i++;
		return buff[buff_i-1];
		
	}
	else
	{
		buff_addr=0;
		rt_thread_mdelay(10);
	}
	
}