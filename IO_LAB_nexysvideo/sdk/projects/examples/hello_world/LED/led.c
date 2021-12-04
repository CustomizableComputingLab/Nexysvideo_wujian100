#include "stdio.h"
#include "pin_name.h"
#include "soc.h"
#include "drv_gpio.h"

/*-----------------------------------------------------------------------*/
/* Transmit bytes to the card (bitbanging)                               */
/*-----------------------------------------------------------------------*/
gpio_pin_handle_t led1_pin_handle_t = NULL;		//led1_pin_handle_t			PA0
gpio_pin_handle_t led2_pin_handle_t = NULL;		//led2_pin_handle_t			PA1
gpio_pin_handle_t led3_pin_handle_t = NULL;		//led3_pin_handle_t	        PA2

extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}

void LED_Init()
{	
	int32_t ret;		
																					
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(led1_pin_handle_t, GPIO_DIRECTION_OUTPUT);

    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(led2_pin_handle_t, GPIO_DIRECTION_OUTPUT);

    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
}

void LED_ON()
{
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    csi_gpio_pin_write(led2_pin_handle_t,1);	
    csi_gpio_pin_write(led3_pin_handle_t,1);	
}

void LED_OFF()
{
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    csi_gpio_pin_write(led2_pin_handle_t,0);	
    csi_gpio_pin_write(led3_pin_handle_t,0);	
}