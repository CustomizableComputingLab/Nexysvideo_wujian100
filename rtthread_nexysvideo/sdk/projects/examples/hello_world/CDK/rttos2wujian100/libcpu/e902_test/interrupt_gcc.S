#include "cpuport.h"


#define MSTATUS_PRV1 0x1880


/******************************************************************************
 * Functions:
 *     void Default_IRQHandler(void);
 * novic default irq entry
 ******************************************************************************/
.globl rt_thread_switch_interrupt_flag
.globl rt_interrupt_from_thread
.globl rt_interrupt_to_thread
.global Default_IRQHandler
.type   Default_IRQHandler, %function
Default_IRQHandler:

    addi sp, sp, -16 * 4

    sw x1,   1 * 4(sp)
    li t0, 0x80
    sw t0,   2 * 4(sp)

    sw x4,   4 * 4(sp)
    sw x5,   5 * 4(sp)
    sw x6,   6 * 4(sp)
    sw x7,   7 * 4(sp)
    sw x8,   8 * 4(sp)
    sw x9,   9 * 4(sp)
    sw x10, 10 * 4(sp)
    sw x11, 11 * 4(sp)
    sw x12, 12 * 4(sp)
    sw x13, 13 * 4(sp)
    sw x14, 14 * 4(sp)
    sw x15, 15 * 4(sp)

    csrr    t0, mepc
    sw      t0, 0 * 4(sp)

	/*
    //la      a0, pxCurrentTCB
    //lw      a0, (a0)
    //sw      sp, (a0)

	//switch to interrupt stack and interrupt handles
	*/
    mv      s0,sp
    la      sp, g_top_irqstack
	
    /*push    s0                  //preserve s0
	*/

    call rt_interrupt_enter

    csrr    a0, mcause
    andi    a0, a0, 0x3FF
    slli    a0, a0, 2

    la      a1, g_irqvector
    add     a1, a1, a0
    lw      a2, (a1)
    jalr    a2

    call rt_interrupt_leave
    /*switch to from thread stack*/
    /*pop     s0                  //recursive s0*/
    mv      sp,s0

	/* need to switch new thread*/
    la   s0, rt_thread_switch_interrupt_flag
    lw   a0, (s0)
    beqz a0, spurious_interrupt
    sw   x0, (s0)

    csrr a0, mepc
    sw a0,  0 * 4(sp)

    la   s0, rt_interrupt_from_thread
    lw   s1, 0(s0)
    sw   sp, 0(s1)

    la   s0, rt_interrupt_to_thread
    lw   s1, 0(s0)
    lw   sp, 0(s1)

    lw  a0,  0 * 4(sp)
    csrw mepc, a0

spurious_interrupt:
    lw x1,   1 * 4(sp)
    
    /* Remain in M-mode after mret */
    li t0, 0x00001800
    csrs mstatus, t0
    lw t0,   2 * 4(sp)
    csrs mstatus, t0 
    
    lw x4,   4 * 4(sp)
    lw x5,   5 * 4(sp)
    lw x6,   6 * 4(sp)
    lw x7,   7 * 4(sp)
    lw x8,   8 * 4(sp)
    lw x9,   9 * 4(sp)
    lw x10, 10 * 4(sp)
    lw x11, 11 * 4(sp)
    lw x12, 12 * 4(sp)
    lw x13, 13 * 4(sp)
    lw x14, 14 * 4(sp)
    lw x15, 15 * 4(sp)

    addi sp, sp, 16 * 4
    mret

.weak handle_trap
handle_trap:
1:
    j 1b

