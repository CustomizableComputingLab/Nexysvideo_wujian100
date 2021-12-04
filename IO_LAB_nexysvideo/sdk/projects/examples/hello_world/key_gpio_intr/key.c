/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_gpio.c
 * @brief    the main function for the GPIO driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <stdio.h>
#include "soc.h"
#include "drv_gpio.h"
#include "key.h"

gpio_pin_handle_t pin = NULL;
static void gpio_interrupt_handler(int32_t idx)
{
    printf("gpio interrupt is triggled\n");
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 0);
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
}

void example_pin_gpio_init(void)
{
    drv_pinmux_config(EXAMPLE_GPIO_PIN, EXAMPLE_GPIO_PIN_FUNC);
}

void gpio_falling_edge_interrupt(pin_name_e gpio_pin)
{
    

    example_pin_gpio_init();

    printf("press the center button will triggle the gpio interrupt \n");
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
}

/*****************************************************************************
test_gpio: main function of the gpio test

INPUT: NULL

RETURN: NULL

*****************************************************************************/
int key_gpio_intr(pin_name_e gpio_pin)
{
    gpio_falling_edge_interrupt(gpio_pin);
    return 0;
}

