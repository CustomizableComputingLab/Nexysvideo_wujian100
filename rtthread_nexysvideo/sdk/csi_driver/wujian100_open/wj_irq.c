/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     wj_irq.c
 * @brief    CSI Source File for IRQ Driver
 * @version  V1.0
 * @date     1. otc 2019
 ******************************************************************************/

#include <stdint.h>
#include <csi_core.h>
#include <csi_config.h>

extern void Default_Handler(void);
extern void (*g_irqvector[])(void);

/**
  \brief       enable irq.
  \param[in]   irq_num Number of IRQ.
  \return      None.
*/
void drv_irq_enable(uint32_t irq_num)
{
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}

/**
  \brief       disable irq.
  \param[in]   irq_num Number of IRQ.
  \return      None.
*/
void drv_irq_disable(uint32_t irq_num)
{
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_disable_sirq(irq_num);
#else
    csi_vic_disable_irq(irq_num);
#endif
}

/**
  \brief       register irq handler.
  \param[in]   irq_num Number of IRQ.
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
}

/**
  \brief       unregister irq handler.
  \param[in]   irq_num Number of IRQ.
  \return      None.
*/
void drv_irq_unregister(uint32_t irq_num)
{
    g_irqvector[irq_num] = (void *)Default_Handler;
}
