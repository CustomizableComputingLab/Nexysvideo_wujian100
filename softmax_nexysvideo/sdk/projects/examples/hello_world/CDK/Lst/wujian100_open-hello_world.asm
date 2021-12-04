
.//Obj/wujian100_open-hello_world.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
.option push
.option norelax
    la      gp, __global_pointer$
       0:	20000197          	auipc	gp,0x20000
       4:	4e818193          	addi	gp,gp,1256 # 200004e8 <_impure_ptr>
.option pop
    la      a0, Default_Handler
       8:	00000517          	auipc	a0,0x0
       c:	1b850513          	addi	a0,a0,440 # 1c0 <Default_Handler>
    ori     a0, a0, 3
      10:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
      14:	30551073          	csrw	mtvec,a0

    la      a0, __Vectors
      18:	b1818513          	addi	a0,gp,-1256 # 20000000 <__Vectors>
    csrw    mtvt, a0
      1c:	30751073          	csrw	mtvt,a0

    la      sp, g_top_irqstack
      20:	20001117          	auipc	sp,0x20001
      24:	4f410113          	addi	sp,sp,1268 # 20001514 <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00006517          	auipc	a0,0x6
      2c:	8f050513          	addi	a0,a0,-1808 # 5918 <__ctor_end__>
    la      a1, __data_start__
      30:	b1818593          	addi	a1,gp,-1256 # 20000000 <__Vectors>
    la      a2, __data_end__
      34:	00818613          	addi	a2,gp,8 # 200004f0 <errno>
    bgeu    a1, a2, 2f
      38:	00c5fa63          	bgeu	a1,a2,4c <Reset_Handler+0x4c>
1:
    lw      t0, (a0)
      3c:	00052283          	lw	t0,0(a0)
    sw      t0, (a1)
      40:	0055a023          	sw	t0,0(a1)
    addi    a0, a0, 4
      44:	0511                	addi	a0,a0,4
    addi    a1, a1, 4
      46:	0591                	addi	a1,a1,4
    bltu    a1, a2, 1b
      48:	fec5eae3          	bltu	a1,a2,3c <Reset_Handler+0x3c>
2:

    /* Clear bss section */
    la      a0, __bss_start__
      4c:	00818513          	addi	a0,gp,8 # 200004f0 <errno>
    la      a1, __bss_end__
      50:	20002597          	auipc	a1,0x20002
      54:	ca458593          	addi	a1,a1,-860 # 20001cf4 <__bss_end__>
    bgeu    a0, a1, 2f
      58:	00b57763          	bgeu	a0,a1,66 <Reset_Handler+0x66>
1:
    sw      zero, (a0)
      5c:	00052023          	sw	zero,0(a0)
    addi    a0, a0, 4
      60:	0511                	addi	a0,a0,4
    bltu    a0, a1, 1b
      62:	feb56de3          	bltu	a0,a1,5c <Reset_Handler+0x5c>
2:

#ifndef __NO_SYSTEM_INIT
    jal     SystemInit
      66:	159030ef          	jal	ra,39be <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	3c5020ef          	jal	ra,2c2e <board_init>
#endif

    jal     main
      6e:	475030ef          	jal	ra,3ce2 <main>

00000072 <__exit>:

    .size   Reset_Handler, . - Reset_Handler

__exit:
    j      __exit
      72:	a001                	j	72 <__exit>
	...

00000080 <Default_IRQHandler>:
    .align  2
    .global Default_IRQHandler
    .weak   Default_IRQHandler
    .type   Default_IRQHandler, %function
Default_IRQHandler:
    addi    sp, sp, -48
      80:	7179                	addi	sp,sp,-48
    sw      t0, 4(sp)
      82:	c216                	sw	t0,4(sp)
    sw      t1, 8(sp)
      84:	c41a                	sw	t1,8(sp)
    csrr    t0, mepc
      86:	341022f3          	csrr	t0,mepc
    csrr    t1, mcause
      8a:	34202373          	csrr	t1,mcause
    sw      t1, 40(sp)
      8e:	d41a                	sw	t1,40(sp)
    sw      t0, 44(sp)
      90:	d616                	sw	t0,44(sp)
    csrs    mstatus, 8
      92:	30046073          	csrsi	mstatus,8

    sw      ra, 0(sp)
      96:	c006                	sw	ra,0(sp)
    sw      t2, 12(sp)
      98:	c61e                	sw	t2,12(sp)
    sw      a0, 16(sp)
      9a:	c82a                	sw	a0,16(sp)
    sw      a1, 20(sp)
      9c:	ca2e                	sw	a1,20(sp)
    sw      a2, 24(sp)
      9e:	cc32                	sw	a2,24(sp)
    sw      a3, 28(sp)
      a0:	ce36                	sw	a3,28(sp)
    sw      a4, 32(sp)
      a2:	d03a                	sw	a4,32(sp)
    sw      a5, 36(sp)
      a4:	d23e                	sw	a5,36(sp)

    andi    t1, t1, 0x3FF
      a6:	3ff37313          	andi	t1,t1,1023
    slli    t1, t1, 2
      aa:	030a                	slli	t1,t1,0x2

    la      t0, g_irqvector
      ac:	20002297          	auipc	t0,0x20002
      b0:	a4028293          	addi	t0,t0,-1472 # 20001aec <g_irqvector>
    add     t0, t0, t1
      b4:	929a                	add	t0,t0,t1
    lw      t2, (t0)
      b6:	0002a383          	lw	t2,0(t0)
    jalr    t2
      ba:	9382                	jalr	t2

    csrc    mstatus, 8
      bc:	30047073          	csrci	mstatus,8

    lw      a1, 40(sp)
      c0:	55a2                	lw	a1,40(sp)
    andi    a0, a1, 0x3FF
      c2:	3ff5f513          	andi	a0,a1,1023

    /* clear pending */
    li      a2, 0xE000E100
      c6:	e000e637          	lui	a2,0xe000e
      ca:	10060613          	addi	a2,a2,256 # e000e100 <__heap_end+0xbffde100>
    add     a2, a2, a0
      ce:	962a                	add	a2,a2,a0
    lb      a3, 0(a2)
      d0:	00060683          	lb	a3,0(a2)
    li      a4, 1
      d4:	4705                	li	a4,1
    not     a4, a4
      d6:	fff74713          	not	a4,a4
    and     a5, a4, a3
      da:	00d777b3          	and	a5,a4,a3
    sb      a5, 0(a2)
      de:	00f60023          	sb	a5,0(a2)

    li      t0, MSTATUS_PRV1
      e2:	6289                	lui	t0,0x2
      e4:	88028293          	addi	t0,t0,-1920 # 1880 <__muldf3+0x25c>
    csrs    mstatus, t0
      e8:	3002a073          	csrs	mstatus,t0
    csrw    mcause, a1
      ec:	34259073          	csrw	mcause,a1
    lw      t0, 44(sp)
      f0:	52b2                	lw	t0,44(sp)
    csrw    mepc, t0
      f2:	34129073          	csrw	mepc,t0
    lw      ra, 0(sp)
      f6:	4082                	lw	ra,0(sp)
    lw      t0, 4(sp)
      f8:	4292                	lw	t0,4(sp)
    lw      t1, 8(sp)
      fa:	4322                	lw	t1,8(sp)
    lw      t2, 12(sp)
      fc:	43b2                	lw	t2,12(sp)
    lw      a0, 16(sp)
      fe:	4542                	lw	a0,16(sp)
    lw      a1, 20(sp)
     100:	45d2                	lw	a1,20(sp)
    lw      a2, 24(sp)
     102:	4662                	lw	a2,24(sp)
    lw      a3, 28(sp)
     104:	46f2                	lw	a3,28(sp)
    lw      a4, 32(sp)
     106:	5702                	lw	a4,32(sp)
    lw      a5, 36(sp)
     108:	5792                	lw	a5,36(sp)

    addi    sp, sp, 48
     10a:	6145                	addi	sp,sp,48
    mret
     10c:	30200073          	mret

00000110 <trap>:
    .align  2
    .global trap
    .type   trap, %function
trap:
    /* Check for interrupt */
    addi    sp, sp, -4
     110:	1171                	addi	sp,sp,-4
    sw      t0, 0x0(sp)
     112:	c016                	sw	t0,0(sp)
    csrr    t0, mcause
     114:	342022f3          	csrr	t0,mcause

    blt     t0, x0, .Lirq
     118:	0602c463          	bltz	t0,180 <trap+0x70>

    addi    sp, sp, 4
     11c:	0111                	addi	sp,sp,4

    la      t0, g_trap_sp
     11e:	20001297          	auipc	t0,0x20001
     122:	5f628293          	addi	t0,t0,1526 # 20001714 <g_trap_sp>
    addi    t0, t0, -68
     126:	fbc28293          	addi	t0,t0,-68
    sw      x1, 0(t0)
     12a:	0012a023          	sw	ra,0(t0)
    sw      x2, 4(t0)
     12e:	0022a223          	sw	sp,4(t0)
    sw      x3, 8(t0)
     132:	0032a423          	sw	gp,8(t0)
    sw      x4, 12(t0)
     136:	0042a623          	sw	tp,12(t0)
    sw      x6, 20(t0)
     13a:	0062aa23          	sw	t1,20(t0)
    sw      x7, 24(t0)
     13e:	0072ac23          	sw	t2,24(t0)
    sw      x8, 28(t0)
     142:	0082ae23          	sw	s0,28(t0)
    sw      x9, 32(t0)
     146:	0292a023          	sw	s1,32(t0)
    sw      x10, 36(t0)
     14a:	02a2a223          	sw	a0,36(t0)
    sw      x11, 40(t0)
     14e:	02b2a423          	sw	a1,40(t0)
    sw      x12, 44(t0)
     152:	02c2a623          	sw	a2,44(t0)
    sw      x13, 48(t0)
     156:	02d2a823          	sw	a3,48(t0)
    sw      x14, 52(t0)
     15a:	02e2aa23          	sw	a4,52(t0)
    sw      x15, 56(t0)
     15e:	02f2ac23          	sw	a5,56(t0)
    csrr    a0, mepc
     162:	34102573          	csrr	a0,mepc
    sw      a0, 60(t0)
     166:	02a2ae23          	sw	a0,60(t0)
    csrr    a0, mstatus
     16a:	30002573          	csrr	a0,mstatus
    sw      a0, 64(t0)
     16e:	04a2a023          	sw	a0,64(t0)

    mv      a0, t0
     172:	8516                	mv	a0,t0
    lw      t0, -4(sp)
     174:	ffc12283          	lw	t0,-4(sp)
    mv      sp, a0
     178:	812a                	mv	sp,a0
    sw      t0, 16(sp)
     17a:	c816                	sw	t0,16(sp)

    jal     trap_c
     17c:	0a1030ef          	jal	ra,3a1c <trap_c>


.Lirq:
    lw      t0, 0x0(sp)
     180:	4282                	lw	t0,0(sp)
    addi    sp, sp, 4
     182:	0111                	addi	sp,sp,4
    j       Default_IRQHandler
     184:	efdff06f          	j	80 <Default_IRQHandler>
     188:	00000013          	nop
     18c:	00000013          	nop
     190:	00000013          	nop
     194:	00000013          	nop
     198:	00000013          	nop
     19c:	00000013          	nop
     1a0:	00000013          	nop
     1a4:	00000013          	nop
     1a8:	00000013          	nop
     1ac:	00000013          	nop
     1b0:	00000013          	nop
     1b4:	00000013          	nop
     1b8:	00000013          	nop
     1bc:	00000013          	nop

000001c0 <Default_Handler>:
    .align  6
    .weak   Default_Handler
    .global Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    j      trap
     1c0:	bf81                	j	110 <trap>
	...

000001f6 <__udivdi3>:
     1f6:	1161                	addi	sp,sp,-8
     1f8:	c222                	sw	s0,4(sp)
     1fa:	c026                	sw	s1,0(sp)
     1fc:	82aa                	mv	t0,a0
     1fe:	87ae                	mv	a5,a1
     200:	20069e63          	bnez	a3,41c <__udivdi3+0x226>
     204:	85b6                	mv	a1,a3
     206:	8332                	mv	t1,a2
     208:	83aa                	mv	t2,a0
     20a:	00005697          	auipc	a3,0x5
     20e:	a2e68693          	addi	a3,a3,-1490 # 4c38 <__clz_tab>
     212:	0cc7f263          	bgeu	a5,a2,2d6 <__udivdi3+0xe0>
     216:	6741                	lui	a4,0x10
     218:	853e                	mv	a0,a5
     21a:	0ae67763          	bgeu	a2,a4,2c8 <__udivdi3+0xd2>
     21e:	0ff00713          	li	a4,255
     222:	00c73733          	sltu	a4,a4,a2
     226:	070e                	slli	a4,a4,0x3
     228:	00e655b3          	srl	a1,a2,a4
     22c:	96ae                	add	a3,a3,a1
     22e:	0006c683          	lbu	a3,0(a3)
     232:	9736                	add	a4,a4,a3
     234:	02000693          	li	a3,32
     238:	40e68433          	sub	s0,a3,a4
     23c:	00e68c63          	beq	a3,a4,254 <__udivdi3+0x5e>
     240:	008796b3          	sll	a3,a5,s0
     244:	00e2d733          	srl	a4,t0,a4
     248:	00861333          	sll	t1,a2,s0
     24c:	00d76533          	or	a0,a4,a3
     250:	008293b3          	sll	t2,t0,s0
     254:	01035593          	srli	a1,t1,0x10
     258:	02b556b3          	divu	a3,a0,a1
     25c:	01031613          	slli	a2,t1,0x10
     260:	8241                	srli	a2,a2,0x10
     262:	0103d793          	srli	a5,t2,0x10
     266:	02b57733          	remu	a4,a0,a1
     26a:	8536                	mv	a0,a3
     26c:	02d602b3          	mul	t0,a2,a3
     270:	0742                	slli	a4,a4,0x10
     272:	8fd9                	or	a5,a5,a4
     274:	0057fc63          	bgeu	a5,t0,28c <__udivdi3+0x96>
     278:	979a                	add	a5,a5,t1
     27a:	fff68513          	addi	a0,a3,-1
     27e:	0067e763          	bltu	a5,t1,28c <__udivdi3+0x96>
     282:	0057f563          	bgeu	a5,t0,28c <__udivdi3+0x96>
     286:	ffe68513          	addi	a0,a3,-2
     28a:	979a                	add	a5,a5,t1
     28c:	405787b3          	sub	a5,a5,t0
     290:	02b7f733          	remu	a4,a5,a1
     294:	03c2                	slli	t2,t2,0x10
     296:	0103d393          	srli	t2,t2,0x10
     29a:	02b7d7b3          	divu	a5,a5,a1
     29e:	0742                	slli	a4,a4,0x10
     2a0:	007763b3          	or	t2,a4,t2
     2a4:	02f60633          	mul	a2,a2,a5
     2a8:	873e                	mv	a4,a5
     2aa:	00c3fb63          	bgeu	t2,a2,2c0 <__udivdi3+0xca>
     2ae:	939a                	add	t2,t2,t1
     2b0:	fff78713          	addi	a4,a5,-1
     2b4:	0063e663          	bltu	t2,t1,2c0 <__udivdi3+0xca>
     2b8:	00c3f463          	bgeu	t2,a2,2c0 <__udivdi3+0xca>
     2bc:	ffe78713          	addi	a4,a5,-2
     2c0:	0542                	slli	a0,a0,0x10
     2c2:	8d59                	or	a0,a0,a4
     2c4:	4581                	li	a1,0
     2c6:	a855                	j	37a <__udivdi3+0x184>
     2c8:	010005b7          	lui	a1,0x1000
     2cc:	4741                	li	a4,16
     2ce:	f4b66de3          	bltu	a2,a1,228 <__udivdi3+0x32>
     2d2:	4761                	li	a4,24
     2d4:	bf91                	j	228 <__udivdi3+0x32>
     2d6:	e601                	bnez	a2,2de <__udivdi3+0xe8>
     2d8:	4705                	li	a4,1
     2da:	02c75333          	divu	t1,a4,a2
     2de:	6741                	lui	a4,0x10
     2e0:	0ae37163          	bgeu	t1,a4,382 <__udivdi3+0x18c>
     2e4:	0ff00713          	li	a4,255
     2e8:	00677363          	bgeu	a4,t1,2ee <__udivdi3+0xf8>
     2ec:	45a1                	li	a1,8
     2ee:	00b35733          	srl	a4,t1,a1
     2f2:	96ba                	add	a3,a3,a4
     2f4:	0006c703          	lbu	a4,0(a3)
     2f8:	02000693          	li	a3,32
     2fc:	972e                	add	a4,a4,a1
     2fe:	40e68533          	sub	a0,a3,a4
     302:	08e69763          	bne	a3,a4,390 <__udivdi3+0x19a>
     306:	406787b3          	sub	a5,a5,t1
     30a:	4585                	li	a1,1
     30c:	01035293          	srli	t0,t1,0x10
     310:	01031613          	slli	a2,t1,0x10
     314:	8241                	srli	a2,a2,0x10
     316:	0103d713          	srli	a4,t2,0x10
     31a:	0257f6b3          	remu	a3,a5,t0
     31e:	0257d7b3          	divu	a5,a5,t0
     322:	06c2                	slli	a3,a3,0x10
     324:	8f55                	or	a4,a4,a3
     326:	02f60433          	mul	s0,a2,a5
     32a:	853e                	mv	a0,a5
     32c:	00877c63          	bgeu	a4,s0,344 <__udivdi3+0x14e>
     330:	971a                	add	a4,a4,t1
     332:	fff78513          	addi	a0,a5,-1
     336:	00676763          	bltu	a4,t1,344 <__udivdi3+0x14e>
     33a:	00877563          	bgeu	a4,s0,344 <__udivdi3+0x14e>
     33e:	ffe78513          	addi	a0,a5,-2
     342:	971a                	add	a4,a4,t1
     344:	8f01                	sub	a4,a4,s0
     346:	025777b3          	remu	a5,a4,t0
     34a:	03c2                	slli	t2,t2,0x10
     34c:	0103d393          	srli	t2,t2,0x10
     350:	02575733          	divu	a4,a4,t0
     354:	07c2                	slli	a5,a5,0x10
     356:	0077e3b3          	or	t2,a5,t2
     35a:	02e60633          	mul	a2,a2,a4
     35e:	87ba                	mv	a5,a4
     360:	00c3fb63          	bgeu	t2,a2,376 <__udivdi3+0x180>
     364:	939a                	add	t2,t2,t1
     366:	fff70793          	addi	a5,a4,-1 # ffff <__ctor_end__+0xa6e7>
     36a:	0063e663          	bltu	t2,t1,376 <__udivdi3+0x180>
     36e:	00c3f463          	bgeu	t2,a2,376 <__udivdi3+0x180>
     372:	ffe70793          	addi	a5,a4,-2
     376:	0542                	slli	a0,a0,0x10
     378:	8d5d                	or	a0,a0,a5
     37a:	4412                	lw	s0,4(sp)
     37c:	4482                	lw	s1,0(sp)
     37e:	0121                	addi	sp,sp,8
     380:	8082                	ret
     382:	01000737          	lui	a4,0x1000
     386:	45c1                	li	a1,16
     388:	f6e363e3          	bltu	t1,a4,2ee <__udivdi3+0xf8>
     38c:	45e1                	li	a1,24
     38e:	b785                	j	2ee <__udivdi3+0xf8>
     390:	00a31333          	sll	t1,t1,a0
     394:	00e7d6b3          	srl	a3,a5,a4
     398:	00a293b3          	sll	t2,t0,a0
     39c:	00a797b3          	sll	a5,a5,a0
     3a0:	01035513          	srli	a0,t1,0x10
     3a4:	00e2d733          	srl	a4,t0,a4
     3a8:	02a6d2b3          	divu	t0,a3,a0
     3ac:	00f76633          	or	a2,a4,a5
     3b0:	01031793          	slli	a5,t1,0x10
     3b4:	83c1                	srli	a5,a5,0x10
     3b6:	01065593          	srli	a1,a2,0x10
     3ba:	02a6f733          	remu	a4,a3,a0
     3be:	025786b3          	mul	a3,a5,t0
     3c2:	0742                	slli	a4,a4,0x10
     3c4:	8f4d                	or	a4,a4,a1
     3c6:	8596                	mv	a1,t0
     3c8:	00d77c63          	bgeu	a4,a3,3e0 <__udivdi3+0x1ea>
     3cc:	971a                	add	a4,a4,t1
     3ce:	fff28593          	addi	a1,t0,-1
     3d2:	00676763          	bltu	a4,t1,3e0 <__udivdi3+0x1ea>
     3d6:	00d77563          	bgeu	a4,a3,3e0 <__udivdi3+0x1ea>
     3da:	ffe28593          	addi	a1,t0,-2
     3de:	971a                	add	a4,a4,t1
     3e0:	40d706b3          	sub	a3,a4,a3
     3e4:	02a6f733          	remu	a4,a3,a0
     3e8:	02a6d6b3          	divu	a3,a3,a0
     3ec:	0742                	slli	a4,a4,0x10
     3ee:	02d78533          	mul	a0,a5,a3
     3f2:	01061793          	slli	a5,a2,0x10
     3f6:	83c1                	srli	a5,a5,0x10
     3f8:	8fd9                	or	a5,a5,a4
     3fa:	8736                	mv	a4,a3
     3fc:	00a7fc63          	bgeu	a5,a0,414 <__udivdi3+0x21e>
     400:	979a                	add	a5,a5,t1
     402:	fff68713          	addi	a4,a3,-1
     406:	0067e763          	bltu	a5,t1,414 <__udivdi3+0x21e>
     40a:	00a7f563          	bgeu	a5,a0,414 <__udivdi3+0x21e>
     40e:	ffe68713          	addi	a4,a3,-2
     412:	979a                	add	a5,a5,t1
     414:	05c2                	slli	a1,a1,0x10
     416:	8f89                	sub	a5,a5,a0
     418:	8dd9                	or	a1,a1,a4
     41a:	bdcd                	j	30c <__udivdi3+0x116>
     41c:	12d5ef63          	bltu	a1,a3,55a <__udivdi3+0x364>
     420:	6741                	lui	a4,0x10
     422:	02e6ff63          	bgeu	a3,a4,460 <__udivdi3+0x26a>
     426:	0ff00713          	li	a4,255
     42a:	00d73733          	sltu	a4,a4,a3
     42e:	070e                	slli	a4,a4,0x3
     430:	00e6d533          	srl	a0,a3,a4
     434:	00005597          	auipc	a1,0x5
     438:	80458593          	addi	a1,a1,-2044 # 4c38 <__clz_tab>
     43c:	95aa                	add	a1,a1,a0
     43e:	0005c583          	lbu	a1,0(a1)
     442:	02000513          	li	a0,32
     446:	972e                	add	a4,a4,a1
     448:	40e505b3          	sub	a1,a0,a4
     44c:	02e51163          	bne	a0,a4,46e <__udivdi3+0x278>
     450:	4505                	li	a0,1
     452:	f2f6e4e3          	bltu	a3,a5,37a <__udivdi3+0x184>
     456:	00c2b633          	sltu	a2,t0,a2
     45a:	00164513          	xori	a0,a2,1
     45e:	bf31                	j	37a <__udivdi3+0x184>
     460:	010005b7          	lui	a1,0x1000
     464:	4741                	li	a4,16
     466:	fcb6e5e3          	bltu	a3,a1,430 <__udivdi3+0x23a>
     46a:	4761                	li	a4,24
     46c:	b7d1                	j	430 <__udivdi3+0x23a>
     46e:	00e65333          	srl	t1,a2,a4
     472:	00b696b3          	sll	a3,a3,a1
     476:	00d36333          	or	t1,t1,a3
     47a:	00e7d3b3          	srl	t2,a5,a4
     47e:	01035413          	srli	s0,t1,0x10
     482:	0283f6b3          	remu	a3,t2,s0
     486:	01031513          	slli	a0,t1,0x10
     48a:	8141                	srli	a0,a0,0x10
     48c:	00e2d733          	srl	a4,t0,a4
     490:	00b797b3          	sll	a5,a5,a1
     494:	8fd9                	or	a5,a5,a4
     496:	0107d713          	srli	a4,a5,0x10
     49a:	00b61633          	sll	a2,a2,a1
     49e:	0283d3b3          	divu	t2,t2,s0
     4a2:	06c2                	slli	a3,a3,0x10
     4a4:	8ed9                	or	a3,a3,a4
     4a6:	027504b3          	mul	s1,a0,t2
     4aa:	871e                	mv	a4,t2
     4ac:	0096fc63          	bgeu	a3,s1,4c4 <__udivdi3+0x2ce>
     4b0:	969a                	add	a3,a3,t1
     4b2:	fff38713          	addi	a4,t2,-1
     4b6:	0066e763          	bltu	a3,t1,4c4 <__udivdi3+0x2ce>
     4ba:	0096f563          	bgeu	a3,s1,4c4 <__udivdi3+0x2ce>
     4be:	ffe38713          	addi	a4,t2,-2
     4c2:	969a                	add	a3,a3,t1
     4c4:	8e85                	sub	a3,a3,s1
     4c6:	0286f3b3          	remu	t2,a3,s0
     4ca:	07c2                	slli	a5,a5,0x10
     4cc:	83c1                	srli	a5,a5,0x10
     4ce:	0286d6b3          	divu	a3,a3,s0
     4d2:	03c2                	slli	t2,t2,0x10
     4d4:	00f3e7b3          	or	a5,t2,a5
     4d8:	02d50533          	mul	a0,a0,a3
     4dc:	83b6                	mv	t2,a3
     4de:	00a7fc63          	bgeu	a5,a0,4f6 <__udivdi3+0x300>
     4e2:	979a                	add	a5,a5,t1
     4e4:	fff68393          	addi	t2,a3,-1
     4e8:	0067e763          	bltu	a5,t1,4f6 <__udivdi3+0x300>
     4ec:	00a7f563          	bgeu	a5,a0,4f6 <__udivdi3+0x300>
     4f0:	ffe68393          	addi	t2,a3,-2
     4f4:	979a                	add	a5,a5,t1
     4f6:	8f89                	sub	a5,a5,a0
     4f8:	6441                	lui	s0,0x10
     4fa:	01071513          	slli	a0,a4,0x10
     4fe:	00756533          	or	a0,a0,t2
     502:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0xa6e7>
     506:	00e573b3          	and	t2,a0,a4
     50a:	01055693          	srli	a3,a0,0x10
     50e:	8f71                	and	a4,a4,a2
     510:	8241                	srli	a2,a2,0x10
     512:	02e38333          	mul	t1,t2,a4
     516:	02e68733          	mul	a4,a3,a4
     51a:	02c383b3          	mul	t2,t2,a2
     51e:	02c686b3          	mul	a3,a3,a2
     522:	93ba                	add	t2,t2,a4
     524:	01035613          	srli	a2,t1,0x10
     528:	961e                	add	a2,a2,t2
     52a:	00e67363          	bgeu	a2,a4,530 <__udivdi3+0x33a>
     52e:	96a2                	add	a3,a3,s0
     530:	01065713          	srli	a4,a2,0x10
     534:	96ba                	add	a3,a3,a4
     536:	02d7e063          	bltu	a5,a3,556 <__udivdi3+0x360>
     53a:	d8d795e3          	bne	a5,a3,2c4 <__udivdi3+0xce>
     53e:	67c1                	lui	a5,0x10
     540:	17fd                	addi	a5,a5,-1
     542:	8e7d                	and	a2,a2,a5
     544:	0642                	slli	a2,a2,0x10
     546:	00f37333          	and	t1,t1,a5
     54a:	00b292b3          	sll	t0,t0,a1
     54e:	961a                	add	a2,a2,t1
     550:	4581                	li	a1,0
     552:	e2c2f4e3          	bgeu	t0,a2,37a <__udivdi3+0x184>
     556:	157d                	addi	a0,a0,-1
     558:	b3b5                	j	2c4 <__udivdi3+0xce>
     55a:	4581                	li	a1,0
     55c:	4501                	li	a0,0
     55e:	bd31                	j	37a <__udivdi3+0x184>

00000560 <__umoddi3>:
     560:	1151                	addi	sp,sp,-12
     562:	c422                	sw	s0,8(sp)
     564:	c226                	sw	s1,4(sp)
     566:	87aa                	mv	a5,a0
     568:	872e                	mv	a4,a1
     56a:	1c069a63          	bnez	a3,73e <__umoddi3+0x1de>
     56e:	8336                	mv	t1,a3
     570:	8432                	mv	s0,a2
     572:	00004697          	auipc	a3,0x4
     576:	6c668693          	addi	a3,a3,1734 # 4c38 <__clz_tab>
     57a:	0ac5fa63          	bgeu	a1,a2,62e <__umoddi3+0xce>
     57e:	62c1                	lui	t0,0x10
     580:	0a567063          	bgeu	a2,t0,620 <__umoddi3+0xc0>
     584:	0ff00293          	li	t0,255
     588:	00c2f363          	bgeu	t0,a2,58e <__umoddi3+0x2e>
     58c:	4321                	li	t1,8
     58e:	006652b3          	srl	t0,a2,t1
     592:	9696                	add	a3,a3,t0
     594:	0006c683          	lbu	a3,0(a3)
     598:	9336                	add	t1,t1,a3
     59a:	02000693          	li	a3,32
     59e:	406682b3          	sub	t0,a3,t1
     5a2:	00668c63          	beq	a3,t1,5ba <__umoddi3+0x5a>
     5a6:	005595b3          	sll	a1,a1,t0
     5aa:	00655333          	srl	t1,a0,t1
     5ae:	00561433          	sll	s0,a2,t0
     5b2:	00b36733          	or	a4,t1,a1
     5b6:	005517b3          	sll	a5,a0,t0
     5ba:	01045393          	srli	t2,s0,0x10
     5be:	02777633          	remu	a2,a4,t2
     5c2:	01041513          	slli	a0,s0,0x10
     5c6:	8141                	srli	a0,a0,0x10
     5c8:	0107d693          	srli	a3,a5,0x10
     5cc:	02775733          	divu	a4,a4,t2
     5d0:	0642                	slli	a2,a2,0x10
     5d2:	8ed1                	or	a3,a3,a2
     5d4:	02e50733          	mul	a4,a0,a4
     5d8:	00e6f863          	bgeu	a3,a4,5e8 <__umoddi3+0x88>
     5dc:	96a2                	add	a3,a3,s0
     5de:	0086e563          	bltu	a3,s0,5e8 <__umoddi3+0x88>
     5e2:	00e6f363          	bgeu	a3,a4,5e8 <__umoddi3+0x88>
     5e6:	96a2                	add	a3,a3,s0
     5e8:	8e99                	sub	a3,a3,a4
     5ea:	0276f733          	remu	a4,a3,t2
     5ee:	07c2                	slli	a5,a5,0x10
     5f0:	83c1                	srli	a5,a5,0x10
     5f2:	0276d6b3          	divu	a3,a3,t2
     5f6:	02d506b3          	mul	a3,a0,a3
     5fa:	01071513          	slli	a0,a4,0x10
     5fe:	8fc9                	or	a5,a5,a0
     600:	00d7f863          	bgeu	a5,a3,610 <__umoddi3+0xb0>
     604:	97a2                	add	a5,a5,s0
     606:	0087e563          	bltu	a5,s0,610 <__umoddi3+0xb0>
     60a:	00d7f363          	bgeu	a5,a3,610 <__umoddi3+0xb0>
     60e:	97a2                	add	a5,a5,s0
     610:	8f95                	sub	a5,a5,a3
     612:	0057d533          	srl	a0,a5,t0
     616:	4581                	li	a1,0
     618:	4422                	lw	s0,8(sp)
     61a:	4492                	lw	s1,4(sp)
     61c:	0131                	addi	sp,sp,12
     61e:	8082                	ret
     620:	010002b7          	lui	t0,0x1000
     624:	4341                	li	t1,16
     626:	f65664e3          	bltu	a2,t0,58e <__umoddi3+0x2e>
     62a:	4361                	li	t1,24
     62c:	b78d                	j	58e <__umoddi3+0x2e>
     62e:	e601                	bnez	a2,636 <__umoddi3+0xd6>
     630:	4705                	li	a4,1
     632:	02c75433          	divu	s0,a4,a2
     636:	6741                	lui	a4,0x10
     638:	08e47163          	bgeu	s0,a4,6ba <__umoddi3+0x15a>
     63c:	0ff00713          	li	a4,255
     640:	00877363          	bgeu	a4,s0,646 <__umoddi3+0xe6>
     644:	4321                	li	t1,8
     646:	00645733          	srl	a4,s0,t1
     64a:	96ba                	add	a3,a3,a4
     64c:	0006c603          	lbu	a2,0(a3)
     650:	02000713          	li	a4,32
     654:	9332                	add	t1,t1,a2
     656:	406702b3          	sub	t0,a4,t1
     65a:	06671763          	bne	a4,t1,6c8 <__umoddi3+0x168>
     65e:	8d81                	sub	a1,a1,s0
     660:	01045693          	srli	a3,s0,0x10
     664:	01041513          	slli	a0,s0,0x10
     668:	8141                	srli	a0,a0,0x10
     66a:	0107d613          	srli	a2,a5,0x10
     66e:	02d5f733          	remu	a4,a1,a3
     672:	02d5d5b3          	divu	a1,a1,a3
     676:	0742                	slli	a4,a4,0x10
     678:	8f51                	or	a4,a4,a2
     67a:	02b505b3          	mul	a1,a0,a1
     67e:	00b77863          	bgeu	a4,a1,68e <__umoddi3+0x12e>
     682:	9722                	add	a4,a4,s0
     684:	00876563          	bltu	a4,s0,68e <__umoddi3+0x12e>
     688:	00b77363          	bgeu	a4,a1,68e <__umoddi3+0x12e>
     68c:	9722                	add	a4,a4,s0
     68e:	40b705b3          	sub	a1,a4,a1
     692:	02d5f733          	remu	a4,a1,a3
     696:	07c2                	slli	a5,a5,0x10
     698:	83c1                	srli	a5,a5,0x10
     69a:	02d5d5b3          	divu	a1,a1,a3
     69e:	0742                	slli	a4,a4,0x10
     6a0:	8fd9                	or	a5,a5,a4
     6a2:	02b50533          	mul	a0,a0,a1
     6a6:	00a7f863          	bgeu	a5,a0,6b6 <__umoddi3+0x156>
     6aa:	97a2                	add	a5,a5,s0
     6ac:	0087e563          	bltu	a5,s0,6b6 <__umoddi3+0x156>
     6b0:	00a7f363          	bgeu	a5,a0,6b6 <__umoddi3+0x156>
     6b4:	97a2                	add	a5,a5,s0
     6b6:	8f89                	sub	a5,a5,a0
     6b8:	bfa9                	j	612 <__umoddi3+0xb2>
     6ba:	01000737          	lui	a4,0x1000
     6be:	4341                	li	t1,16
     6c0:	f8e463e3          	bltu	s0,a4,646 <__umoddi3+0xe6>
     6c4:	4361                	li	t1,24
     6c6:	b741                	j	646 <__umoddi3+0xe6>
     6c8:	00541433          	sll	s0,s0,t0
     6cc:	0065d6b3          	srl	a3,a1,t1
     6d0:	005517b3          	sll	a5,a0,t0
     6d4:	00655333          	srl	t1,a0,t1
     6d8:	01045513          	srli	a0,s0,0x10
     6dc:	02a6f733          	remu	a4,a3,a0
     6e0:	005595b3          	sll	a1,a1,t0
     6e4:	00b36633          	or	a2,t1,a1
     6e8:	01041593          	slli	a1,s0,0x10
     6ec:	81c1                	srli	a1,a1,0x10
     6ee:	01065313          	srli	t1,a2,0x10
     6f2:	02a6d6b3          	divu	a3,a3,a0
     6f6:	0742                	slli	a4,a4,0x10
     6f8:	00676733          	or	a4,a4,t1
     6fc:	02d586b3          	mul	a3,a1,a3
     700:	00d77863          	bgeu	a4,a3,710 <__umoddi3+0x1b0>
     704:	9722                	add	a4,a4,s0
     706:	00876563          	bltu	a4,s0,710 <__umoddi3+0x1b0>
     70a:	00d77363          	bgeu	a4,a3,710 <__umoddi3+0x1b0>
     70e:	9722                	add	a4,a4,s0
     710:	40d706b3          	sub	a3,a4,a3
     714:	02a6f733          	remu	a4,a3,a0
     718:	02a6d6b3          	divu	a3,a3,a0
     71c:	0742                	slli	a4,a4,0x10
     71e:	02d586b3          	mul	a3,a1,a3
     722:	01061593          	slli	a1,a2,0x10
     726:	81c1                	srli	a1,a1,0x10
     728:	8dd9                	or	a1,a1,a4
     72a:	00d5f863          	bgeu	a1,a3,73a <__umoddi3+0x1da>
     72e:	95a2                	add	a1,a1,s0
     730:	0085e563          	bltu	a1,s0,73a <__umoddi3+0x1da>
     734:	00d5f363          	bgeu	a1,a3,73a <__umoddi3+0x1da>
     738:	95a2                	add	a1,a1,s0
     73a:	8d95                	sub	a1,a1,a3
     73c:	b715                	j	660 <__umoddi3+0x100>
     73e:	ecd5ede3          	bltu	a1,a3,618 <__umoddi3+0xb8>
     742:	6341                	lui	t1,0x10
     744:	0466f563          	bgeu	a3,t1,78e <__umoddi3+0x22e>
     748:	0ff00293          	li	t0,255
     74c:	00d2b333          	sltu	t1,t0,a3
     750:	030e                	slli	t1,t1,0x3
     752:	0066d3b3          	srl	t2,a3,t1
     756:	00004297          	auipc	t0,0x4
     75a:	4e228293          	addi	t0,t0,1250 # 4c38 <__clz_tab>
     75e:	929e                	add	t0,t0,t2
     760:	0002c283          	lbu	t0,0(t0)
     764:	929a                	add	t0,t0,t1
     766:	02000313          	li	t1,32
     76a:	405303b3          	sub	t2,t1,t0
     76e:	02531763          	bne	t1,t0,79c <__umoddi3+0x23c>
     772:	00b6e463          	bltu	a3,a1,77a <__umoddi3+0x21a>
     776:	00c56963          	bltu	a0,a2,788 <__umoddi3+0x228>
     77a:	40c507b3          	sub	a5,a0,a2
     77e:	8d95                	sub	a1,a1,a3
     780:	00f53533          	sltu	a0,a0,a5
     784:	40a58733          	sub	a4,a1,a0
     788:	853e                	mv	a0,a5
     78a:	85ba                	mv	a1,a4
     78c:	b571                	j	618 <__umoddi3+0xb8>
     78e:	010002b7          	lui	t0,0x1000
     792:	4341                	li	t1,16
     794:	fa56efe3          	bltu	a3,t0,752 <__umoddi3+0x1f2>
     798:	4361                	li	t1,24
     79a:	bf65                	j	752 <__umoddi3+0x1f2>
     79c:	007696b3          	sll	a3,a3,t2
     7a0:	00565333          	srl	t1,a2,t0
     7a4:	00d36333          	or	t1,t1,a3
     7a8:	0055d4b3          	srl	s1,a1,t0
     7ac:	01035413          	srli	s0,t1,0x10
     7b0:	00555733          	srl	a4,a0,t0
     7b4:	007517b3          	sll	a5,a0,t2
     7b8:	0284d533          	divu	a0,s1,s0
     7bc:	c03e                	sw	a5,0(sp)
     7be:	007595b3          	sll	a1,a1,t2
     7c2:	8dd9                	or	a1,a1,a4
     7c4:	01031713          	slli	a4,t1,0x10
     7c8:	8341                	srli	a4,a4,0x10
     7ca:	00761633          	sll	a2,a2,t2
     7ce:	0284f7b3          	remu	a5,s1,s0
     7d2:	02a704b3          	mul	s1,a4,a0
     7d6:	01079693          	slli	a3,a5,0x10
     7da:	0105d793          	srli	a5,a1,0x10
     7de:	8fd5                	or	a5,a5,a3
     7e0:	86aa                	mv	a3,a0
     7e2:	0097fc63          	bgeu	a5,s1,7fa <__umoddi3+0x29a>
     7e6:	979a                	add	a5,a5,t1
     7e8:	fff50693          	addi	a3,a0,-1
     7ec:	0067e763          	bltu	a5,t1,7fa <__umoddi3+0x29a>
     7f0:	0097f563          	bgeu	a5,s1,7fa <__umoddi3+0x29a>
     7f4:	ffe50693          	addi	a3,a0,-2
     7f8:	979a                	add	a5,a5,t1
     7fa:	8f85                	sub	a5,a5,s1
     7fc:	0287f533          	remu	a0,a5,s0
     800:	05c2                	slli	a1,a1,0x10
     802:	81c1                	srli	a1,a1,0x10
     804:	0287d433          	divu	s0,a5,s0
     808:	0542                	slli	a0,a0,0x10
     80a:	8dc9                	or	a1,a1,a0
     80c:	02870733          	mul	a4,a4,s0
     810:	87a2                	mv	a5,s0
     812:	00e5fc63          	bgeu	a1,a4,82a <__umoddi3+0x2ca>
     816:	959a                	add	a1,a1,t1
     818:	fff40793          	addi	a5,s0,-1
     81c:	0065e763          	bltu	a1,t1,82a <__umoddi3+0x2ca>
     820:	00e5f563          	bgeu	a1,a4,82a <__umoddi3+0x2ca>
     824:	ffe40793          	addi	a5,s0,-2
     828:	959a                	add	a1,a1,t1
     82a:	06c2                	slli	a3,a3,0x10
     82c:	6441                	lui	s0,0x10
     82e:	8edd                	or	a3,a3,a5
     830:	40e58733          	sub	a4,a1,a4
     834:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0xa6e7>
     838:	00b6f7b3          	and	a5,a3,a1
     83c:	01065493          	srli	s1,a2,0x10
     840:	82c1                	srli	a3,a3,0x10
     842:	8df1                	and	a1,a1,a2
     844:	02b78533          	mul	a0,a5,a1
     848:	02b685b3          	mul	a1,a3,a1
     84c:	029787b3          	mul	a5,a5,s1
     850:	029686b3          	mul	a3,a3,s1
     854:	97ae                	add	a5,a5,a1
     856:	01055493          	srli	s1,a0,0x10
     85a:	97a6                	add	a5,a5,s1
     85c:	00b7f363          	bgeu	a5,a1,862 <__umoddi3+0x302>
     860:	96a2                	add	a3,a3,s0
     862:	0107d593          	srli	a1,a5,0x10
     866:	96ae                	add	a3,a3,a1
     868:	65c1                	lui	a1,0x10
     86a:	15fd                	addi	a1,a1,-1
     86c:	8fed                	and	a5,a5,a1
     86e:	07c2                	slli	a5,a5,0x10
     870:	8d6d                	and	a0,a0,a1
     872:	953e                	add	a0,a0,a5
     874:	00d76763          	bltu	a4,a3,882 <__umoddi3+0x322>
     878:	00d71d63          	bne	a4,a3,892 <__umoddi3+0x332>
     87c:	4782                	lw	a5,0(sp)
     87e:	00a7fa63          	bgeu	a5,a0,892 <__umoddi3+0x332>
     882:	40c50633          	sub	a2,a0,a2
     886:	00c53533          	sltu	a0,a0,a2
     88a:	932a                	add	t1,t1,a0
     88c:	406686b3          	sub	a3,a3,t1
     890:	8532                	mv	a0,a2
     892:	4782                	lw	a5,0(sp)
     894:	40d706b3          	sub	a3,a4,a3
     898:	40a78533          	sub	a0,a5,a0
     89c:	00a7b5b3          	sltu	a1,a5,a0
     8a0:	40b685b3          	sub	a1,a3,a1
     8a4:	005597b3          	sll	a5,a1,t0
     8a8:	00755533          	srl	a0,a0,t2
     8ac:	8d5d                	or	a0,a0,a5
     8ae:	0075d5b3          	srl	a1,a1,t2
     8b2:	b39d                	j	618 <__umoddi3+0xb8>

000008b4 <__adddf3>:
     8b4:	00100337          	lui	t1,0x100
     8b8:	137d                	addi	t1,t1,-1
     8ba:	1131                	addi	sp,sp,-20
     8bc:	00b377b3          	and	a5,t1,a1
     8c0:	0145d713          	srli	a4,a1,0x14
     8c4:	c426                	sw	s1,8(sp)
     8c6:	078e                	slli	a5,a5,0x3
     8c8:	7ff77493          	andi	s1,a4,2047
     8cc:	01d55713          	srli	a4,a0,0x1d
     8d0:	8fd9                	or	a5,a5,a4
     8d2:	00d37733          	and	a4,t1,a3
     8d6:	0146d313          	srli	t1,a3,0x14
     8da:	c622                	sw	s0,12(sp)
     8dc:	7ff37313          	andi	t1,t1,2047
     8e0:	01f5d413          	srli	s0,a1,0x1f
     8e4:	070e                	slli	a4,a4,0x3
     8e6:	01f6d593          	srli	a1,a3,0x1f
     8ea:	c806                	sw	ra,16(sp)
     8ec:	01d65693          	srli	a3,a2,0x1d
     8f0:	8f55                	or	a4,a4,a3
     8f2:	050e                	slli	a0,a0,0x3
     8f4:	060e                	slli	a2,a2,0x3
     8f6:	406486b3          	sub	a3,s1,t1
     8fa:	22b41463          	bne	s0,a1,b22 <__adddf3+0x26e>
     8fe:	0ed05263          	blez	a3,9e2 <__adddf3+0x12e>
     902:	02031863          	bnez	t1,932 <__adddf3+0x7e>
     906:	00c765b3          	or	a1,a4,a2
     90a:	20058a63          	beqz	a1,b1e <__adddf3+0x26a>
     90e:	fff68593          	addi	a1,a3,-1
     912:	e989                	bnez	a1,924 <__adddf3+0x70>
     914:	962a                	add	a2,a2,a0
     916:	00a63533          	sltu	a0,a2,a0
     91a:	97ba                	add	a5,a5,a4
     91c:	97aa                	add	a5,a5,a0
     91e:	8532                	mv	a0,a2
     920:	4485                	li	s1,1
     922:	a8b9                	j	980 <__adddf3+0xcc>
     924:	7ff00313          	li	t1,2047
     928:	00669d63          	bne	a3,t1,942 <__adddf3+0x8e>
     92c:	7ff00493          	li	s1,2047
     930:	aa71                	j	acc <__adddf3+0x218>
     932:	7ff00593          	li	a1,2047
     936:	18b48b63          	beq	s1,a1,acc <__adddf3+0x218>
     93a:	008005b7          	lui	a1,0x800
     93e:	8f4d                	or	a4,a4,a1
     940:	85b6                	mv	a1,a3
     942:	03800693          	li	a3,56
     946:	08b6ca63          	blt	a3,a1,9da <__adddf3+0x126>
     94a:	46fd                	li	a3,31
     94c:	06b6c163          	blt	a3,a1,9ae <__adddf3+0xfa>
     950:	02000313          	li	t1,32
     954:	40b30333          	sub	t1,t1,a1
     958:	006716b3          	sll	a3,a4,t1
     95c:	00b652b3          	srl	t0,a2,a1
     960:	00661633          	sll	a2,a2,t1
     964:	0056e6b3          	or	a3,a3,t0
     968:	00c03633          	snez	a2,a2
     96c:	8e55                	or	a2,a2,a3
     96e:	00b75733          	srl	a4,a4,a1
     972:	962a                	add	a2,a2,a0
     974:	00a63533          	sltu	a0,a2,a0
     978:	973e                	add	a4,a4,a5
     97a:	00a707b3          	add	a5,a4,a0
     97e:	8532                	mv	a0,a2
     980:	00800737          	lui	a4,0x800
     984:	8f7d                	and	a4,a4,a5
     986:	14070363          	beqz	a4,acc <__adddf3+0x218>
     98a:	0485                	addi	s1,s1,1
     98c:	7ff00713          	li	a4,2047
     990:	48e48b63          	beq	s1,a4,e26 <__adddf3+0x572>
     994:	ff800737          	lui	a4,0xff800
     998:	177d                	addi	a4,a4,-1
     99a:	8ff9                	and	a5,a5,a4
     99c:	00155713          	srli	a4,a0,0x1
     9a0:	8905                	andi	a0,a0,1
     9a2:	8d59                	or	a0,a0,a4
     9a4:	01f79713          	slli	a4,a5,0x1f
     9a8:	8d59                	or	a0,a0,a4
     9aa:	8385                	srli	a5,a5,0x1
     9ac:	a205                	j	acc <__adddf3+0x218>
     9ae:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
     9b2:	02000293          	li	t0,32
     9b6:	00d756b3          	srl	a3,a4,a3
     9ba:	4301                	li	t1,0
     9bc:	00558863          	beq	a1,t0,9cc <__adddf3+0x118>
     9c0:	04000313          	li	t1,64
     9c4:	40b305b3          	sub	a1,t1,a1
     9c8:	00b71333          	sll	t1,a4,a1
     9cc:	00c36633          	or	a2,t1,a2
     9d0:	00c03633          	snez	a2,a2
     9d4:	8e55                	or	a2,a2,a3
     9d6:	4701                	li	a4,0
     9d8:	bf69                	j	972 <__adddf3+0xbe>
     9da:	8e59                	or	a2,a2,a4
     9dc:	00c03633          	snez	a2,a2
     9e0:	bfdd                	j	9d6 <__adddf3+0x122>
     9e2:	cacd                	beqz	a3,a94 <__adddf3+0x1e0>
     9e4:	409305b3          	sub	a1,t1,s1
     9e8:	e48d                	bnez	s1,a12 <__adddf3+0x15e>
     9ea:	00a7e6b3          	or	a3,a5,a0
     9ee:	42068363          	beqz	a3,e14 <__adddf3+0x560>
     9f2:	fff58693          	addi	a3,a1,-1
     9f6:	e699                	bnez	a3,a04 <__adddf3+0x150>
     9f8:	9532                	add	a0,a0,a2
     9fa:	97ba                	add	a5,a5,a4
     9fc:	00c53633          	sltu	a2,a0,a2
     a00:	97b2                	add	a5,a5,a2
     a02:	bf39                	j	920 <__adddf3+0x6c>
     a04:	7ff00293          	li	t0,2047
     a08:	00559d63          	bne	a1,t0,a22 <__adddf3+0x16e>
     a0c:	87ba                	mv	a5,a4
     a0e:	8532                	mv	a0,a2
     a10:	bf31                	j	92c <__adddf3+0x78>
     a12:	7ff00693          	li	a3,2047
     a16:	fed30be3          	beq	t1,a3,a0c <__adddf3+0x158>
     a1a:	008006b7          	lui	a3,0x800
     a1e:	8fd5                	or	a5,a5,a3
     a20:	86ae                	mv	a3,a1
     a22:	03800593          	li	a1,56
     a26:	06d5c363          	blt	a1,a3,a8c <__adddf3+0x1d8>
     a2a:	45fd                	li	a1,31
     a2c:	02d5ca63          	blt	a1,a3,a60 <__adddf3+0x1ac>
     a30:	02000293          	li	t0,32
     a34:	40d282b3          	sub	t0,t0,a3
     a38:	005795b3          	sll	a1,a5,t0
     a3c:	00d553b3          	srl	t2,a0,a3
     a40:	00551533          	sll	a0,a0,t0
     a44:	0075e5b3          	or	a1,a1,t2
     a48:	00a03533          	snez	a0,a0
     a4c:	8d4d                	or	a0,a0,a1
     a4e:	00d7d7b3          	srl	a5,a5,a3
     a52:	9532                	add	a0,a0,a2
     a54:	97ba                	add	a5,a5,a4
     a56:	00c53633          	sltu	a2,a0,a2
     a5a:	97b2                	add	a5,a5,a2
     a5c:	849a                	mv	s1,t1
     a5e:	b70d                	j	980 <__adddf3+0xcc>
     a60:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
     a64:	02000393          	li	t2,32
     a68:	00b7d5b3          	srl	a1,a5,a1
     a6c:	4281                	li	t0,0
     a6e:	00768863          	beq	a3,t2,a7e <__adddf3+0x1ca>
     a72:	04000293          	li	t0,64
     a76:	40d286b3          	sub	a3,t0,a3
     a7a:	00d792b3          	sll	t0,a5,a3
     a7e:	00a2e533          	or	a0,t0,a0
     a82:	00a03533          	snez	a0,a0
     a86:	8d4d                	or	a0,a0,a1
     a88:	4781                	li	a5,0
     a8a:	b7e1                	j	a52 <__adddf3+0x19e>
     a8c:	8d5d                	or	a0,a0,a5
     a8e:	00a03533          	snez	a0,a0
     a92:	bfdd                	j	a88 <__adddf3+0x1d4>
     a94:	00148693          	addi	a3,s1,1
     a98:	7fe6f593          	andi	a1,a3,2046
     a9c:	e1bd                	bnez	a1,b02 <__adddf3+0x24e>
     a9e:	00a7e6b3          	or	a3,a5,a0
     aa2:	e4a9                	bnez	s1,aec <__adddf3+0x238>
     aa4:	36068c63          	beqz	a3,e1c <__adddf3+0x568>
     aa8:	00c766b3          	or	a3,a4,a2
     aac:	c285                	beqz	a3,acc <__adddf3+0x218>
     aae:	962a                	add	a2,a2,a0
     ab0:	97ba                	add	a5,a5,a4
     ab2:	00a63533          	sltu	a0,a2,a0
     ab6:	97aa                	add	a5,a5,a0
     ab8:	00800737          	lui	a4,0x800
     abc:	8f7d                	and	a4,a4,a5
     abe:	8532                	mv	a0,a2
     ac0:	c711                	beqz	a4,acc <__adddf3+0x218>
     ac2:	ff800737          	lui	a4,0xff800
     ac6:	177d                	addi	a4,a4,-1
     ac8:	8ff9                	and	a5,a5,a4
     aca:	4485                	li	s1,1
     acc:	00757713          	andi	a4,a0,7
     ad0:	34070d63          	beqz	a4,e2a <__adddf3+0x576>
     ad4:	00f57713          	andi	a4,a0,15
     ad8:	4691                	li	a3,4
     ada:	34d70863          	beq	a4,a3,e2a <__adddf3+0x576>
     ade:	00450713          	addi	a4,a0,4
     ae2:	00a73533          	sltu	a0,a4,a0
     ae6:	97aa                	add	a5,a5,a0
     ae8:	853a                	mv	a0,a4
     aea:	a681                	j	e2a <__adddf3+0x576>
     aec:	d285                	beqz	a3,a0c <__adddf3+0x158>
     aee:	8e59                	or	a2,a2,a4
     af0:	e2060ee3          	beqz	a2,92c <__adddf3+0x78>
     af4:	4401                	li	s0,0
     af6:	004007b7          	lui	a5,0x400
     afa:	4501                	li	a0,0
     afc:	7ff00493          	li	s1,2047
     b00:	a62d                	j	e2a <__adddf3+0x576>
     b02:	7ff00593          	li	a1,2047
     b06:	30b68e63          	beq	a3,a1,e22 <__adddf3+0x56e>
     b0a:	962a                	add	a2,a2,a0
     b0c:	00a63533          	sltu	a0,a2,a0
     b10:	97ba                	add	a5,a5,a4
     b12:	97aa                	add	a5,a5,a0
     b14:	01f79513          	slli	a0,a5,0x1f
     b18:	8205                	srli	a2,a2,0x1
     b1a:	8d51                	or	a0,a0,a2
     b1c:	8385                	srli	a5,a5,0x1
     b1e:	84b6                	mv	s1,a3
     b20:	b775                	j	acc <__adddf3+0x218>
     b22:	0cd05463          	blez	a3,bea <__adddf3+0x336>
     b26:	06031f63          	bnez	t1,ba4 <__adddf3+0x2f0>
     b2a:	00c765b3          	or	a1,a4,a2
     b2e:	d9e5                	beqz	a1,b1e <__adddf3+0x26a>
     b30:	fff68593          	addi	a1,a3,-1
     b34:	e991                	bnez	a1,b48 <__adddf3+0x294>
     b36:	40c50633          	sub	a2,a0,a2
     b3a:	00c53533          	sltu	a0,a0,a2
     b3e:	8f99                	sub	a5,a5,a4
     b40:	8f89                	sub	a5,a5,a0
     b42:	8532                	mv	a0,a2
     b44:	4485                	li	s1,1
     b46:	a0b1                	j	b92 <__adddf3+0x2de>
     b48:	7ff00313          	li	t1,2047
     b4c:	de6680e3          	beq	a3,t1,92c <__adddf3+0x78>
     b50:	03800693          	li	a3,56
     b54:	08b6c763          	blt	a3,a1,be2 <__adddf3+0x32e>
     b58:	46fd                	li	a3,31
     b5a:	04b6ce63          	blt	a3,a1,bb6 <__adddf3+0x302>
     b5e:	02000313          	li	t1,32
     b62:	40b30333          	sub	t1,t1,a1
     b66:	006716b3          	sll	a3,a4,t1
     b6a:	00b652b3          	srl	t0,a2,a1
     b6e:	00661633          	sll	a2,a2,t1
     b72:	0056e6b3          	or	a3,a3,t0
     b76:	00c03633          	snez	a2,a2
     b7a:	8e55                	or	a2,a2,a3
     b7c:	00b75733          	srl	a4,a4,a1
     b80:	40c50633          	sub	a2,a0,a2
     b84:	00c53533          	sltu	a0,a0,a2
     b88:	40e78733          	sub	a4,a5,a4
     b8c:	40a707b3          	sub	a5,a4,a0
     b90:	8532                	mv	a0,a2
     b92:	008006b7          	lui	a3,0x800
     b96:	00d7f733          	and	a4,a5,a3
     b9a:	db0d                	beqz	a4,acc <__adddf3+0x218>
     b9c:	16fd                	addi	a3,a3,-1
     b9e:	8efd                	and	a3,a3,a5
     ba0:	832a                	mv	t1,a0
     ba2:	aa55                	j	d56 <__adddf3+0x4a2>
     ba4:	7ff00593          	li	a1,2047
     ba8:	f2b482e3          	beq	s1,a1,acc <__adddf3+0x218>
     bac:	008005b7          	lui	a1,0x800
     bb0:	8f4d                	or	a4,a4,a1
     bb2:	85b6                	mv	a1,a3
     bb4:	bf71                	j	b50 <__adddf3+0x29c>
     bb6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
     bba:	02000293          	li	t0,32
     bbe:	00d756b3          	srl	a3,a4,a3
     bc2:	4301                	li	t1,0
     bc4:	00558863          	beq	a1,t0,bd4 <__adddf3+0x320>
     bc8:	04000313          	li	t1,64
     bcc:	40b305b3          	sub	a1,t1,a1
     bd0:	00b71333          	sll	t1,a4,a1
     bd4:	00c36633          	or	a2,t1,a2
     bd8:	00c03633          	snez	a2,a2
     bdc:	8e55                	or	a2,a2,a3
     bde:	4701                	li	a4,0
     be0:	b745                	j	b80 <__adddf3+0x2cc>
     be2:	8e59                	or	a2,a2,a4
     be4:	00c03633          	snez	a2,a2
     be8:	bfdd                	j	bde <__adddf3+0x32a>
     bea:	c2f9                	beqz	a3,cb0 <__adddf3+0x3fc>
     bec:	409302b3          	sub	t0,t1,s1
     bf0:	e895                	bnez	s1,c24 <__adddf3+0x370>
     bf2:	00a7e6b3          	or	a3,a5,a0
     bf6:	28068863          	beqz	a3,e86 <__adddf3+0x5d2>
     bfa:	fff28693          	addi	a3,t0,-1 # ffffff <__min_heap_size+0xfdffff>
     bfe:	ea91                	bnez	a3,c12 <__adddf3+0x35e>
     c00:	40a60533          	sub	a0,a2,a0
     c04:	40f707b3          	sub	a5,a4,a5
     c08:	00a63633          	sltu	a2,a2,a0
     c0c:	8f91                	sub	a5,a5,a2
     c0e:	842e                	mv	s0,a1
     c10:	bf15                	j	b44 <__adddf3+0x290>
     c12:	7ff00393          	li	t2,2047
     c16:	00729f63          	bne	t0,t2,c34 <__adddf3+0x380>
     c1a:	87ba                	mv	a5,a4
     c1c:	8532                	mv	a0,a2
     c1e:	7ff00493          	li	s1,2047
     c22:	a07d                	j	cd0 <__adddf3+0x41c>
     c24:	7ff00693          	li	a3,2047
     c28:	fed309e3          	beq	t1,a3,c1a <__adddf3+0x366>
     c2c:	008006b7          	lui	a3,0x800
     c30:	8fd5                	or	a5,a5,a3
     c32:	8696                	mv	a3,t0
     c34:	03800293          	li	t0,56
     c38:	06d2c863          	blt	t0,a3,ca8 <__adddf3+0x3f4>
     c3c:	42fd                	li	t0,31
     c3e:	02d2ce63          	blt	t0,a3,c7a <__adddf3+0x3c6>
     c42:	02000393          	li	t2,32
     c46:	40d383b3          	sub	t2,t2,a3
     c4a:	007792b3          	sll	t0,a5,t2
     c4e:	00d55433          	srl	s0,a0,a3
     c52:	00751533          	sll	a0,a0,t2
     c56:	0082e2b3          	or	t0,t0,s0
     c5a:	00a03533          	snez	a0,a0
     c5e:	00a2e533          	or	a0,t0,a0
     c62:	00d7d7b3          	srl	a5,a5,a3
     c66:	40a60533          	sub	a0,a2,a0
     c6a:	40f707b3          	sub	a5,a4,a5
     c6e:	00a63633          	sltu	a2,a2,a0
     c72:	8f91                	sub	a5,a5,a2
     c74:	849a                	mv	s1,t1
     c76:	842e                	mv	s0,a1
     c78:	bf29                	j	b92 <__adddf3+0x2de>
     c7a:	fe068293          	addi	t0,a3,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
     c7e:	02000413          	li	s0,32
     c82:	0057d2b3          	srl	t0,a5,t0
     c86:	4381                	li	t2,0
     c88:	00868863          	beq	a3,s0,c98 <__adddf3+0x3e4>
     c8c:	04000393          	li	t2,64
     c90:	40d386b3          	sub	a3,t2,a3
     c94:	00d793b3          	sll	t2,a5,a3
     c98:	00a3e533          	or	a0,t2,a0
     c9c:	00a03533          	snez	a0,a0
     ca0:	00a2e533          	or	a0,t0,a0
     ca4:	4781                	li	a5,0
     ca6:	b7c1                	j	c66 <__adddf3+0x3b2>
     ca8:	8d5d                	or	a0,a0,a5
     caa:	00a03533          	snez	a0,a0
     cae:	bfdd                	j	ca4 <__adddf3+0x3f0>
     cb0:	00148693          	addi	a3,s1,1
     cb4:	7fe6f693          	andi	a3,a3,2046
     cb8:	eaa5                	bnez	a3,d28 <__adddf3+0x474>
     cba:	00a7e333          	or	t1,a5,a0
     cbe:	00c766b3          	or	a3,a4,a2
     cc2:	e8a1                	bnez	s1,d12 <__adddf3+0x45e>
     cc4:	00031863          	bnez	t1,cd4 <__adddf3+0x420>
     cc8:	1c068363          	beqz	a3,e8e <__adddf3+0x5da>
     ccc:	87ba                	mv	a5,a4
     cce:	8532                	mv	a0,a2
     cd0:	842e                	mv	s0,a1
     cd2:	bbed                	j	acc <__adddf3+0x218>
     cd4:	de068ce3          	beqz	a3,acc <__adddf3+0x218>
     cd8:	40c50333          	sub	t1,a0,a2
     cdc:	006532b3          	sltu	t0,a0,t1
     ce0:	40e786b3          	sub	a3,a5,a4
     ce4:	405686b3          	sub	a3,a3,t0
     ce8:	008002b7          	lui	t0,0x800
     cec:	0056f2b3          	and	t0,a3,t0
     cf0:	00028a63          	beqz	t0,d04 <__adddf3+0x450>
     cf4:	40a60533          	sub	a0,a2,a0
     cf8:	40f707b3          	sub	a5,a4,a5
     cfc:	00a63633          	sltu	a2,a2,a0
     d00:	8f91                	sub	a5,a5,a2
     d02:	b7f9                	j	cd0 <__adddf3+0x41c>
     d04:	00d36533          	or	a0,t1,a3
     d08:	18050763          	beqz	a0,e96 <__adddf3+0x5e2>
     d0c:	87b6                	mv	a5,a3
     d0e:	851a                	mv	a0,t1
     d10:	bb75                	j	acc <__adddf3+0x218>
     d12:	00031863          	bnez	t1,d22 <__adddf3+0x46e>
     d16:	18068263          	beqz	a3,e9a <__adddf3+0x5e6>
     d1a:	87ba                	mv	a5,a4
     d1c:	8532                	mv	a0,a2
     d1e:	842e                	mv	s0,a1
     d20:	b131                	j	92c <__adddf3+0x78>
     d22:	c00685e3          	beqz	a3,92c <__adddf3+0x78>
     d26:	b3f9                	j	af4 <__adddf3+0x240>
     d28:	40c50333          	sub	t1,a0,a2
     d2c:	006532b3          	sltu	t0,a0,t1
     d30:	40e786b3          	sub	a3,a5,a4
     d34:	405686b3          	sub	a3,a3,t0
     d38:	008002b7          	lui	t0,0x800
     d3c:	0056f2b3          	and	t0,a3,t0
     d40:	06028b63          	beqz	t0,db6 <__adddf3+0x502>
     d44:	40a60333          	sub	t1,a2,a0
     d48:	40f707b3          	sub	a5,a4,a5
     d4c:	00663633          	sltu	a2,a2,t1
     d50:	40c786b3          	sub	a3,a5,a2
     d54:	842e                	mv	s0,a1
     d56:	c6b5                	beqz	a3,dc2 <__adddf3+0x50e>
     d58:	8536                	mv	a0,a3
     d5a:	c21a                	sw	t1,4(sp)
     d5c:	c036                	sw	a3,0(sp)
     d5e:	424010ef          	jal	ra,2182 <__clzsi2>
     d62:	4682                	lw	a3,0(sp)
     d64:	4312                	lw	t1,4(sp)
     d66:	ff850713          	addi	a4,a0,-8
     d6a:	47fd                	li	a5,31
     d6c:	06e7c563          	blt	a5,a4,dd6 <__adddf3+0x522>
     d70:	02000793          	li	a5,32
     d74:	8f99                	sub	a5,a5,a4
     d76:	00e696b3          	sll	a3,a3,a4
     d7a:	00f357b3          	srl	a5,t1,a5
     d7e:	8fd5                	or	a5,a5,a3
     d80:	00e31533          	sll	a0,t1,a4
     d84:	08974263          	blt	a4,s1,e08 <__adddf3+0x554>
     d88:	8f05                	sub	a4,a4,s1
     d8a:	00170613          	addi	a2,a4,1 # ff800001 <__heap_end+0xdf7d0001>
     d8e:	46fd                	li	a3,31
     d90:	04c6c963          	blt	a3,a2,de2 <__adddf3+0x52e>
     d94:	02000713          	li	a4,32
     d98:	8f11                	sub	a4,a4,a2
     d9a:	00e796b3          	sll	a3,a5,a4
     d9e:	00c555b3          	srl	a1,a0,a2
     da2:	00e51533          	sll	a0,a0,a4
     da6:	8ecd                	or	a3,a3,a1
     da8:	00a03533          	snez	a0,a0
     dac:	8d55                	or	a0,a0,a3
     dae:	00c7d7b3          	srl	a5,a5,a2
     db2:	4481                	li	s1,0
     db4:	bb21                	j	acc <__adddf3+0x218>
     db6:	00d36533          	or	a0,t1,a3
     dba:	fd51                	bnez	a0,d56 <__adddf3+0x4a2>
     dbc:	4781                	li	a5,0
     dbe:	4481                	li	s1,0
     dc0:	a8c9                	j	e92 <__adddf3+0x5de>
     dc2:	851a                	mv	a0,t1
     dc4:	c236                	sw	a3,4(sp)
     dc6:	c01a                	sw	t1,0(sp)
     dc8:	3ba010ef          	jal	ra,2182 <__clzsi2>
     dcc:	4692                	lw	a3,4(sp)
     dce:	4302                	lw	t1,0(sp)
     dd0:	02050513          	addi	a0,a0,32
     dd4:	bf49                	j	d66 <__adddf3+0x4b2>
     dd6:	fd850793          	addi	a5,a0,-40
     dda:	00f317b3          	sll	a5,t1,a5
     dde:	4501                	li	a0,0
     de0:	b755                	j	d84 <__adddf3+0x4d0>
     de2:	1705                	addi	a4,a4,-31
     de4:	02000593          	li	a1,32
     de8:	00e7d733          	srl	a4,a5,a4
     dec:	4681                	li	a3,0
     dee:	00b60763          	beq	a2,a1,dfc <__adddf3+0x548>
     df2:	04000693          	li	a3,64
     df6:	8e91                	sub	a3,a3,a2
     df8:	00d796b3          	sll	a3,a5,a3
     dfc:	8d55                	or	a0,a0,a3
     dfe:	00a03533          	snez	a0,a0
     e02:	8d59                	or	a0,a0,a4
     e04:	4781                	li	a5,0
     e06:	b775                	j	db2 <__adddf3+0x4fe>
     e08:	8c99                	sub	s1,s1,a4
     e0a:	ff800737          	lui	a4,0xff800
     e0e:	177d                	addi	a4,a4,-1
     e10:	8ff9                	and	a5,a5,a4
     e12:	b96d                	j	acc <__adddf3+0x218>
     e14:	87ba                	mv	a5,a4
     e16:	8532                	mv	a0,a2
     e18:	84ae                	mv	s1,a1
     e1a:	b94d                	j	acc <__adddf3+0x218>
     e1c:	87ba                	mv	a5,a4
     e1e:	8532                	mv	a0,a2
     e20:	b175                	j	acc <__adddf3+0x218>
     e22:	7ff00493          	li	s1,2047
     e26:	4781                	li	a5,0
     e28:	4501                	li	a0,0
     e2a:	00800737          	lui	a4,0x800
     e2e:	8f7d                	and	a4,a4,a5
     e30:	cb11                	beqz	a4,e44 <__adddf3+0x590>
     e32:	0485                	addi	s1,s1,1
     e34:	7ff00713          	li	a4,2047
     e38:	06e48663          	beq	s1,a4,ea4 <__adddf3+0x5f0>
     e3c:	ff800737          	lui	a4,0xff800
     e40:	177d                	addi	a4,a4,-1
     e42:	8ff9                	and	a5,a5,a4
     e44:	01d79713          	slli	a4,a5,0x1d
     e48:	810d                	srli	a0,a0,0x3
     e4a:	8d59                	or	a0,a0,a4
     e4c:	7ff00713          	li	a4,2047
     e50:	838d                	srli	a5,a5,0x3
     e52:	00e49963          	bne	s1,a4,e64 <__adddf3+0x5b0>
     e56:	8d5d                	or	a0,a0,a5
     e58:	4781                	li	a5,0
     e5a:	c509                	beqz	a0,e64 <__adddf3+0x5b0>
     e5c:	000807b7          	lui	a5,0x80
     e60:	4501                	li	a0,0
     e62:	4401                	li	s0,0
     e64:	01449713          	slli	a4,s1,0x14
     e68:	7ff006b7          	lui	a3,0x7ff00
     e6c:	07b2                	slli	a5,a5,0xc
     e6e:	8f75                	and	a4,a4,a3
     e70:	83b1                	srli	a5,a5,0xc
     e72:	047e                	slli	s0,s0,0x1f
     e74:	8fd9                	or	a5,a5,a4
     e76:	40c2                	lw	ra,16(sp)
     e78:	0087e733          	or	a4,a5,s0
     e7c:	4432                	lw	s0,12(sp)
     e7e:	44a2                	lw	s1,8(sp)
     e80:	85ba                	mv	a1,a4
     e82:	0151                	addi	sp,sp,20
     e84:	8082                	ret
     e86:	87ba                	mv	a5,a4
     e88:	8532                	mv	a0,a2
     e8a:	8496                	mv	s1,t0
     e8c:	b591                	j	cd0 <__adddf3+0x41c>
     e8e:	4781                	li	a5,0
     e90:	4501                	li	a0,0
     e92:	4401                	li	s0,0
     e94:	bf59                	j	e2a <__adddf3+0x576>
     e96:	4781                	li	a5,0
     e98:	bfed                	j	e92 <__adddf3+0x5de>
     e9a:	4501                	li	a0,0
     e9c:	4401                	li	s0,0
     e9e:	004007b7          	lui	a5,0x400
     ea2:	b9a9                	j	afc <__adddf3+0x248>
     ea4:	4781                	li	a5,0
     ea6:	4501                	li	a0,0
     ea8:	bf71                	j	e44 <__adddf3+0x590>

00000eaa <__divdf3>:
     eaa:	fdc10113          	addi	sp,sp,-36
     eae:	cc26                	sw	s1,24(sp)
     eb0:	872a                	mv	a4,a0
     eb2:	84b2                	mv	s1,a2
     eb4:	87aa                	mv	a5,a0
     eb6:	01f5d613          	srli	a2,a1,0x1f
     eba:	0145d513          	srli	a0,a1,0x14
     ebe:	00c59313          	slli	t1,a1,0xc
     ec2:	d006                	sw	ra,32(sp)
     ec4:	ce22                	sw	s0,28(sp)
     ec6:	7ff57513          	andi	a0,a0,2047
     eca:	c432                	sw	a2,8(sp)
     ecc:	00c35313          	srli	t1,t1,0xc
     ed0:	c551                	beqz	a0,f5c <__divdf3+0xb2>
     ed2:	7ff00593          	li	a1,2047
     ed6:	0eb50863          	beq	a0,a1,fc6 <__divdf3+0x11c>
     eda:	01d75413          	srli	s0,a4,0x1d
     ede:	030e                	slli	t1,t1,0x3
     ee0:	008007b7          	lui	a5,0x800
     ee4:	00646433          	or	s0,s0,t1
     ee8:	8c5d                	or	s0,s0,a5
     eea:	c0150613          	addi	a2,a0,-1023
     eee:	00371793          	slli	a5,a4,0x3
     ef2:	4301                	li	t1,0
     ef4:	0146d513          	srli	a0,a3,0x14
     ef8:	01f6d713          	srli	a4,a3,0x1f
     efc:	00c69393          	slli	t2,a3,0xc
     f00:	7ff57513          	andi	a0,a0,2047
     f04:	c63a                	sw	a4,12(sp)
     f06:	00c3d393          	srli	t2,t2,0xc
     f0a:	cd79                	beqz	a0,fe8 <__divdf3+0x13e>
     f0c:	7ff00713          	li	a4,2047
     f10:	14e50763          	beq	a0,a4,105e <__divdf3+0x1b4>
     f14:	01d4d713          	srli	a4,s1,0x1d
     f18:	038e                	slli	t2,t2,0x3
     f1a:	007763b3          	or	t2,a4,t2
     f1e:	008006b7          	lui	a3,0x800
     f22:	00d3e3b3          	or	t2,t2,a3
     f26:	00349713          	slli	a4,s1,0x3
     f2a:	c0150513          	addi	a0,a0,-1023
     f2e:	4681                	li	a3,0
     f30:	45a2                	lw	a1,8(sp)
     f32:	44b2                	lw	s1,12(sp)
     f34:	8e09                	sub	a2,a2,a0
     f36:	c232                	sw	a2,4(sp)
     f38:	00231613          	slli	a2,t1,0x2
     f3c:	8da5                	xor	a1,a1,s1
     f3e:	8e55                	or	a2,a2,a3
     f40:	c02e                	sw	a1,0(sp)
     f42:	167d                	addi	a2,a2,-1
     f44:	45b9                	li	a1,14
     f46:	12c5ed63          	bltu	a1,a2,1080 <__divdf3+0x1d6>
     f4a:	00004597          	auipc	a1,0x4
     f4e:	c7658593          	addi	a1,a1,-906 # 4bc0 <__srodata>
     f52:	060a                	slli	a2,a2,0x2
     f54:	962e                	add	a2,a2,a1
     f56:	4210                	lw	a2,0(a2)
     f58:	962e                	add	a2,a2,a1
     f5a:	8602                	jr	a2
     f5c:	00e36433          	or	s0,t1,a4
     f60:	c83d                	beqz	s0,fd6 <__divdf3+0x12c>
     f62:	c636                	sw	a3,12(sp)
     f64:	04030063          	beqz	t1,fa4 <__divdf3+0xfa>
     f68:	851a                	mv	a0,t1
     f6a:	c23a                	sw	a4,4(sp)
     f6c:	c01a                	sw	t1,0(sp)
     f6e:	214010ef          	jal	ra,2182 <__clzsi2>
     f72:	4302                	lw	t1,0(sp)
     f74:	4712                	lw	a4,4(sp)
     f76:	46b2                	lw	a3,12(sp)
     f78:	ff550593          	addi	a1,a0,-11
     f7c:	47f1                	li	a5,28
     f7e:	02b7ce63          	blt	a5,a1,fba <__divdf3+0x110>
     f82:	4475                	li	s0,29
     f84:	ff850793          	addi	a5,a0,-8
     f88:	8c0d                	sub	s0,s0,a1
     f8a:	00f31333          	sll	t1,t1,a5
     f8e:	00875433          	srl	s0,a4,s0
     f92:	00646433          	or	s0,s0,t1
     f96:	00f717b3          	sll	a5,a4,a5
     f9a:	c0d00593          	li	a1,-1011
     f9e:	40a58633          	sub	a2,a1,a0
     fa2:	bf81                	j	ef2 <__divdf3+0x48>
     fa4:	853a                	mv	a0,a4
     fa6:	c21a                	sw	t1,4(sp)
     fa8:	c03a                	sw	a4,0(sp)
     faa:	1d8010ef          	jal	ra,2182 <__clzsi2>
     fae:	46b2                	lw	a3,12(sp)
     fb0:	4312                	lw	t1,4(sp)
     fb2:	4702                	lw	a4,0(sp)
     fb4:	02050513          	addi	a0,a0,32
     fb8:	b7c1                	j	f78 <__divdf3+0xce>
     fba:	fd850413          	addi	s0,a0,-40
     fbe:	00871433          	sll	s0,a4,s0
     fc2:	4781                	li	a5,0
     fc4:	bfd9                	j	f9a <__divdf3+0xf0>
     fc6:	00e36433          	or	s0,t1,a4
     fca:	c811                	beqz	s0,fde <__divdf3+0x134>
     fcc:	841a                	mv	s0,t1
     fce:	7ff00613          	li	a2,2047
     fd2:	430d                	li	t1,3
     fd4:	b705                	j	ef4 <__divdf3+0x4a>
     fd6:	4781                	li	a5,0
     fd8:	4601                	li	a2,0
     fda:	4305                	li	t1,1
     fdc:	bf21                	j	ef4 <__divdf3+0x4a>
     fde:	4781                	li	a5,0
     fe0:	7ff00613          	li	a2,2047
     fe4:	4309                	li	t1,2
     fe6:	b739                	j	ef4 <__divdf3+0x4a>
     fe8:	0093e733          	or	a4,t2,s1
     fec:	c349                	beqz	a4,106e <__divdf3+0x1c4>
     fee:	04038463          	beqz	t2,1036 <__divdf3+0x18c>
     ff2:	851e                	mv	a0,t2
     ff4:	ca1a                	sw	t1,20(sp)
     ff6:	c832                	sw	a2,16(sp)
     ff8:	c23e                	sw	a5,4(sp)
     ffa:	c01e                	sw	t2,0(sp)
     ffc:	186010ef          	jal	ra,2182 <__clzsi2>
    1000:	4382                	lw	t2,0(sp)
    1002:	4792                	lw	a5,4(sp)
    1004:	4642                	lw	a2,16(sp)
    1006:	4352                	lw	t1,20(sp)
    1008:	ff550293          	addi	t0,a0,-11
    100c:	4771                	li	a4,28
    100e:	04574263          	blt	a4,t0,1052 <__divdf3+0x1a8>
    1012:	46f5                	li	a3,29
    1014:	ff850713          	addi	a4,a0,-8
    1018:	405686b3          	sub	a3,a3,t0
    101c:	00e393b3          	sll	t2,t2,a4
    1020:	00d4d6b3          	srl	a3,s1,a3
    1024:	0076e3b3          	or	t2,a3,t2
    1028:	00e49733          	sll	a4,s1,a4
    102c:	c0d00693          	li	a3,-1011
    1030:	40a68533          	sub	a0,a3,a0
    1034:	bded                	j	f2e <__divdf3+0x84>
    1036:	8526                	mv	a0,s1
    1038:	ca1e                	sw	t2,20(sp)
    103a:	c81a                	sw	t1,16(sp)
    103c:	c232                	sw	a2,4(sp)
    103e:	c03e                	sw	a5,0(sp)
    1040:	142010ef          	jal	ra,2182 <__clzsi2>
    1044:	43d2                	lw	t2,20(sp)
    1046:	4342                	lw	t1,16(sp)
    1048:	4612                	lw	a2,4(sp)
    104a:	4782                	lw	a5,0(sp)
    104c:	02050513          	addi	a0,a0,32
    1050:	bf65                	j	1008 <__divdf3+0x15e>
    1052:	fd850393          	addi	t2,a0,-40
    1056:	007493b3          	sll	t2,s1,t2
    105a:	4701                	li	a4,0
    105c:	bfc1                	j	102c <__divdf3+0x182>
    105e:	0093e733          	or	a4,t2,s1
    1062:	cb11                	beqz	a4,1076 <__divdf3+0x1cc>
    1064:	8726                	mv	a4,s1
    1066:	7ff00513          	li	a0,2047
    106a:	468d                	li	a3,3
    106c:	b5d1                	j	f30 <__divdf3+0x86>
    106e:	4381                	li	t2,0
    1070:	4501                	li	a0,0
    1072:	4685                	li	a3,1
    1074:	bd75                	j	f30 <__divdf3+0x86>
    1076:	4381                	li	t2,0
    1078:	7ff00513          	li	a0,2047
    107c:	4689                	li	a3,2
    107e:	bd4d                	j	f30 <__divdf3+0x86>
    1080:	0083e663          	bltu	t2,s0,108c <__divdf3+0x1e2>
    1084:	2c741263          	bne	s0,t2,1348 <__divdf3+0x49e>
    1088:	2ce7e063          	bltu	a5,a4,1348 <__divdf3+0x49e>
    108c:	01f41613          	slli	a2,s0,0x1f
    1090:	0017d693          	srli	a3,a5,0x1
    1094:	01f79513          	slli	a0,a5,0x1f
    1098:	8005                	srli	s0,s0,0x1
    109a:	00d667b3          	or	a5,a2,a3
    109e:	03a2                	slli	t2,t2,0x8
    10a0:	0103d493          	srli	s1,t2,0x10
    10a4:	02945333          	divu	t1,s0,s1
    10a8:	01875613          	srli	a2,a4,0x18
    10ac:	00766633          	or	a2,a2,t2
    10b0:	00871593          	slli	a1,a4,0x8
    10b4:	01061713          	slli	a4,a2,0x10
    10b8:	8341                	srli	a4,a4,0x10
    10ba:	c43a                	sw	a4,8(sp)
    10bc:	0107d693          	srli	a3,a5,0x10
    10c0:	02947433          	remu	s0,s0,s1
    10c4:	02670733          	mul	a4,a4,t1
    10c8:	0442                	slli	s0,s0,0x10
    10ca:	8c55                	or	s0,s0,a3
    10cc:	869a                	mv	a3,t1
    10ce:	00e47c63          	bgeu	s0,a4,10e6 <__divdf3+0x23c>
    10d2:	9432                	add	s0,s0,a2
    10d4:	fff30693          	addi	a3,t1,-1 # fffff <__min_heap_size+0xdffff>
    10d8:	00c46763          	bltu	s0,a2,10e6 <__divdf3+0x23c>
    10dc:	00e47563          	bgeu	s0,a4,10e6 <__divdf3+0x23c>
    10e0:	ffe30693          	addi	a3,t1,-2
    10e4:	9432                	add	s0,s0,a2
    10e6:	8c19                	sub	s0,s0,a4
    10e8:	029452b3          	divu	t0,s0,s1
    10ec:	01061713          	slli	a4,a2,0x10
    10f0:	8341                	srli	a4,a4,0x10
    10f2:	07c2                	slli	a5,a5,0x10
    10f4:	83c1                	srli	a5,a5,0x10
    10f6:	02947433          	remu	s0,s0,s1
    10fa:	8396                	mv	t2,t0
    10fc:	02570333          	mul	t1,a4,t0
    1100:	0442                	slli	s0,s0,0x10
    1102:	8fc1                	or	a5,a5,s0
    1104:	0067fc63          	bgeu	a5,t1,111c <__divdf3+0x272>
    1108:	97b2                	add	a5,a5,a2
    110a:	fff28393          	addi	t2,t0,-1 # 7fffff <__min_heap_size+0x7dffff>
    110e:	00c7e763          	bltu	a5,a2,111c <__divdf3+0x272>
    1112:	0067f563          	bgeu	a5,t1,111c <__divdf3+0x272>
    1116:	ffe28393          	addi	t2,t0,-2
    111a:	97b2                	add	a5,a5,a2
    111c:	06c2                	slli	a3,a3,0x10
    111e:	6441                	lui	s0,0x10
    1120:	0076e6b3          	or	a3,a3,t2
    1124:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0xa6e7>
    1128:	00e6f2b3          	and	t0,a3,a4
    112c:	406787b3          	sub	a5,a5,t1
    1130:	8f6d                	and	a4,a4,a1
    1132:	0106d313          	srli	t1,a3,0x10
    1136:	025703b3          	mul	t2,a4,t0
    113a:	c43a                	sw	a4,8(sp)
    113c:	02e30733          	mul	a4,t1,a4
    1140:	c63a                	sw	a4,12(sp)
    1142:	0105d713          	srli	a4,a1,0x10
    1146:	025702b3          	mul	t0,a4,t0
    114a:	02e30333          	mul	t1,t1,a4
    114e:	4732                	lw	a4,12(sp)
    1150:	92ba                	add	t0,t0,a4
    1152:	0103d713          	srli	a4,t2,0x10
    1156:	9716                	add	a4,a4,t0
    1158:	42b2                	lw	t0,12(sp)
    115a:	00577363          	bgeu	a4,t0,1160 <__divdf3+0x2b6>
    115e:	9322                	add	t1,t1,s0
    1160:	6441                	lui	s0,0x10
    1162:	147d                	addi	s0,s0,-1
    1164:	01075293          	srli	t0,a4,0x10
    1168:	8f61                	and	a4,a4,s0
    116a:	0742                	slli	a4,a4,0x10
    116c:	0083f3b3          	and	t2,t2,s0
    1170:	9316                	add	t1,t1,t0
    1172:	971e                	add	a4,a4,t2
    1174:	0067e763          	bltu	a5,t1,1182 <__divdf3+0x2d8>
    1178:	83b6                	mv	t2,a3
    117a:	02679e63          	bne	a5,t1,11b6 <__divdf3+0x30c>
    117e:	02e57c63          	bgeu	a0,a4,11b6 <__divdf3+0x30c>
    1182:	952e                	add	a0,a0,a1
    1184:	00b532b3          	sltu	t0,a0,a1
    1188:	92b2                	add	t0,t0,a2
    118a:	9796                	add	a5,a5,t0
    118c:	fff68393          	addi	t2,a3,-1 # 7fffff <__min_heap_size+0x7dffff>
    1190:	00f66663          	bltu	a2,a5,119c <__divdf3+0x2f2>
    1194:	02f61163          	bne	a2,a5,11b6 <__divdf3+0x30c>
    1198:	00b56f63          	bltu	a0,a1,11b6 <__divdf3+0x30c>
    119c:	0067e663          	bltu	a5,t1,11a8 <__divdf3+0x2fe>
    11a0:	00f31b63          	bne	t1,a5,11b6 <__divdf3+0x30c>
    11a4:	00e57963          	bgeu	a0,a4,11b6 <__divdf3+0x30c>
    11a8:	952e                	add	a0,a0,a1
    11aa:	ffe68393          	addi	t2,a3,-2
    11ae:	00b536b3          	sltu	a3,a0,a1
    11b2:	96b2                	add	a3,a3,a2
    11b4:	97b6                	add	a5,a5,a3
    11b6:	40e502b3          	sub	t0,a0,a4
    11ba:	40678333          	sub	t1,a5,t1
    11be:	00553533          	sltu	a0,a0,t0
    11c2:	40a30333          	sub	t1,t1,a0
    11c6:	577d                	li	a4,-1
    11c8:	10660063          	beq	a2,t1,12c8 <__divdf3+0x41e>
    11cc:	02935433          	divu	s0,t1,s1
    11d0:	01061793          	slli	a5,a2,0x10
    11d4:	83c1                	srli	a5,a5,0x10
    11d6:	0102d693          	srli	a3,t0,0x10
    11da:	02878733          	mul	a4,a5,s0
    11de:	029377b3          	remu	a5,t1,s1
    11e2:	07c2                	slli	a5,a5,0x10
    11e4:	8fd5                	or	a5,a5,a3
    11e6:	86a2                	mv	a3,s0
    11e8:	00e7fc63          	bgeu	a5,a4,1200 <__divdf3+0x356>
    11ec:	97b2                	add	a5,a5,a2
    11ee:	fff40693          	addi	a3,s0,-1 # ffff <__ctor_end__+0xa6e7>
    11f2:	00c7e763          	bltu	a5,a2,1200 <__divdf3+0x356>
    11f6:	00e7f563          	bgeu	a5,a4,1200 <__divdf3+0x356>
    11fa:	ffe40693          	addi	a3,s0,-2
    11fe:	97b2                	add	a5,a5,a2
    1200:	40e78733          	sub	a4,a5,a4
    1204:	02975333          	divu	t1,a4,s1
    1208:	01061793          	slli	a5,a2,0x10
    120c:	83c1                	srli	a5,a5,0x10
    120e:	02678533          	mul	a0,a5,t1
    1212:	841a                	mv	s0,t1
    1214:	029777b3          	remu	a5,a4,s1
    1218:	01029713          	slli	a4,t0,0x10
    121c:	8341                	srli	a4,a4,0x10
    121e:	07c2                	slli	a5,a5,0x10
    1220:	8fd9                	or	a5,a5,a4
    1222:	00a7fc63          	bgeu	a5,a0,123a <__divdf3+0x390>
    1226:	97b2                	add	a5,a5,a2
    1228:	fff30413          	addi	s0,t1,-1
    122c:	00c7e763          	bltu	a5,a2,123a <__divdf3+0x390>
    1230:	00a7f563          	bgeu	a5,a0,123a <__divdf3+0x390>
    1234:	ffe30413          	addi	s0,t1,-2
    1238:	97b2                	add	a5,a5,a2
    123a:	06c2                	slli	a3,a3,0x10
    123c:	8ec1                	or	a3,a3,s0
    123e:	4422                	lw	s0,8(sp)
    1240:	8f89                	sub	a5,a5,a0
    1242:	4522                	lw	a0,8(sp)
    1244:	0106d293          	srli	t0,a3,0x10
    1248:	01069713          	slli	a4,a3,0x10
    124c:	02828333          	mul	t1,t0,s0
    1250:	8341                	srli	a4,a4,0x10
    1252:	0105d413          	srli	s0,a1,0x10
    1256:	02a70533          	mul	a0,a4,a0
    125a:	02e40733          	mul	a4,s0,a4
    125e:	025402b3          	mul	t0,s0,t0
    1262:	971a                	add	a4,a4,t1
    1264:	01055413          	srli	s0,a0,0x10
    1268:	9722                	add	a4,a4,s0
    126a:	00677463          	bgeu	a4,t1,1272 <__divdf3+0x3c8>
    126e:	6341                	lui	t1,0x10
    1270:	929a                	add	t0,t0,t1
    1272:	01075313          	srli	t1,a4,0x10
    1276:	929a                	add	t0,t0,t1
    1278:	6341                	lui	t1,0x10
    127a:	137d                	addi	t1,t1,-1
    127c:	00677733          	and	a4,a4,t1
    1280:	0742                	slli	a4,a4,0x10
    1282:	00657533          	and	a0,a0,t1
    1286:	953a                	add	a0,a0,a4
    1288:	0057e663          	bltu	a5,t0,1294 <__divdf3+0x3ea>
    128c:	1a579663          	bne	a5,t0,1438 <__divdf3+0x58e>
    1290:	8736                	mv	a4,a3
    1292:	c91d                	beqz	a0,12c8 <__divdf3+0x41e>
    1294:	97b2                	add	a5,a5,a2
    1296:	fff68713          	addi	a4,a3,-1
    129a:	02c7e163          	bltu	a5,a2,12bc <__divdf3+0x412>
    129e:	0057e663          	bltu	a5,t0,12aa <__divdf3+0x400>
    12a2:	18579a63          	bne	a5,t0,1436 <__divdf3+0x58c>
    12a6:	00a5fd63          	bgeu	a1,a0,12c0 <__divdf3+0x416>
    12aa:	ffe68713          	addi	a4,a3,-2
    12ae:	00159693          	slli	a3,a1,0x1
    12b2:	00b6b5b3          	sltu	a1,a3,a1
    12b6:	962e                	add	a2,a2,a1
    12b8:	97b2                	add	a5,a5,a2
    12ba:	85b6                	mv	a1,a3
    12bc:	00579463          	bne	a5,t0,12c4 <__divdf3+0x41a>
    12c0:	00b50463          	beq	a0,a1,12c8 <__divdf3+0x41e>
    12c4:	00176713          	ori	a4,a4,1
    12c8:	4792                	lw	a5,4(sp)
    12ca:	3ff78793          	addi	a5,a5,1023 # 8003ff <__min_heap_size+0x7e03ff>
    12ce:	0af05e63          	blez	a5,138a <__divdf3+0x4e0>
    12d2:	00777693          	andi	a3,a4,7
    12d6:	ce81                	beqz	a3,12ee <__divdf3+0x444>
    12d8:	00f77693          	andi	a3,a4,15
    12dc:	4611                	li	a2,4
    12de:	00c68863          	beq	a3,a2,12ee <__divdf3+0x444>
    12e2:	00470693          	addi	a3,a4,4 # ff800004 <__heap_end+0xdf7d0004>
    12e6:	00e6b733          	sltu	a4,a3,a4
    12ea:	93ba                	add	t2,t2,a4
    12ec:	8736                	mv	a4,a3
    12ee:	010006b7          	lui	a3,0x1000
    12f2:	00d3f6b3          	and	a3,t2,a3
    12f6:	ca89                	beqz	a3,1308 <__divdf3+0x45e>
    12f8:	ff0007b7          	lui	a5,0xff000
    12fc:	17fd                	addi	a5,a5,-1
    12fe:	00f3f3b3          	and	t2,t2,a5
    1302:	4792                	lw	a5,4(sp)
    1304:	40078793          	addi	a5,a5,1024 # ff000400 <__heap_end+0xdefd0400>
    1308:	7fe00693          	li	a3,2046
    130c:	06f6c163          	blt	a3,a5,136e <__divdf3+0x4c4>
    1310:	01d39693          	slli	a3,t2,0x1d
    1314:	830d                	srli	a4,a4,0x3
    1316:	8f55                	or	a4,a4,a3
    1318:	0033d393          	srli	t2,t2,0x3
    131c:	7ff006b7          	lui	a3,0x7ff00
    1320:	07d2                	slli	a5,a5,0x14
    1322:	8ff5                	and	a5,a5,a3
    1324:	4682                	lw	a3,0(sp)
    1326:	03b2                	slli	t2,t2,0xc
    1328:	5082                	lw	ra,32(sp)
    132a:	4472                	lw	s0,28(sp)
    132c:	00c3d393          	srli	t2,t2,0xc
    1330:	01f69593          	slli	a1,a3,0x1f
    1334:	0077e7b3          	or	a5,a5,t2
    1338:	00b7e6b3          	or	a3,a5,a1
    133c:	44e2                	lw	s1,24(sp)
    133e:	853a                	mv	a0,a4
    1340:	85b6                	mv	a1,a3
    1342:	02410113          	addi	sp,sp,36
    1346:	8082                	ret
    1348:	4692                	lw	a3,4(sp)
    134a:	4501                	li	a0,0
    134c:	16fd                	addi	a3,a3,-1
    134e:	c236                	sw	a3,4(sp)
    1350:	b3b9                	j	109e <__divdf3+0x1f4>
    1352:	4722                	lw	a4,8(sp)
    1354:	83a2                	mv	t2,s0
    1356:	869a                	mv	a3,t1
    1358:	c03a                	sw	a4,0(sp)
    135a:	873e                	mv	a4,a5
    135c:	478d                	li	a5,3
    135e:	0af68e63          	beq	a3,a5,141a <__divdf3+0x570>
    1362:	4785                	li	a5,1
    1364:	0cf68263          	beq	a3,a5,1428 <__divdf3+0x57e>
    1368:	4789                	li	a5,2
    136a:	f4f69fe3          	bne	a3,a5,12c8 <__divdf3+0x41e>
    136e:	4381                	li	t2,0
    1370:	4701                	li	a4,0
    1372:	7ff00793          	li	a5,2047
    1376:	b75d                	j	131c <__divdf3+0x472>
    1378:	47b2                	lw	a5,12(sp)
    137a:	c03e                	sw	a5,0(sp)
    137c:	b7c5                	j	135c <__divdf3+0x4b2>
    137e:	000803b7          	lui	t2,0x80
    1382:	4701                	li	a4,0
    1384:	c002                	sw	zero,0(sp)
    1386:	468d                	li	a3,3
    1388:	bfd1                	j	135c <__divdf3+0x4b2>
    138a:	4685                	li	a3,1
    138c:	8e9d                	sub	a3,a3,a5
    138e:	03800613          	li	a2,56
    1392:	08d64b63          	blt	a2,a3,1428 <__divdf3+0x57e>
    1396:	467d                	li	a2,31
    1398:	04d64c63          	blt	a2,a3,13f0 <__divdf3+0x546>
    139c:	4792                	lw	a5,4(sp)
    139e:	00d75633          	srl	a2,a4,a3
    13a2:	41e78593          	addi	a1,a5,1054
    13a6:	00b397b3          	sll	a5,t2,a1
    13aa:	00b71733          	sll	a4,a4,a1
    13ae:	8fd1                	or	a5,a5,a2
    13b0:	00e03733          	snez	a4,a4
    13b4:	8f5d                	or	a4,a4,a5
    13b6:	00d3d3b3          	srl	t2,t2,a3
    13ba:	00777793          	andi	a5,a4,7
    13be:	cf81                	beqz	a5,13d6 <__divdf3+0x52c>
    13c0:	00f77793          	andi	a5,a4,15
    13c4:	4691                	li	a3,4
    13c6:	00d78863          	beq	a5,a3,13d6 <__divdf3+0x52c>
    13ca:	00470693          	addi	a3,a4,4
    13ce:	00e6b733          	sltu	a4,a3,a4
    13d2:	93ba                	add	t2,t2,a4
    13d4:	8736                	mv	a4,a3
    13d6:	008007b7          	lui	a5,0x800
    13da:	00f3f7b3          	and	a5,t2,a5
    13de:	eba1                	bnez	a5,142e <__divdf3+0x584>
    13e0:	01d39793          	slli	a5,t2,0x1d
    13e4:	830d                	srli	a4,a4,0x3
    13e6:	8f5d                	or	a4,a4,a5
    13e8:	0033d393          	srli	t2,t2,0x3
    13ec:	4781                	li	a5,0
    13ee:	b73d                	j	131c <__divdf3+0x472>
    13f0:	5605                	li	a2,-31
    13f2:	40f607b3          	sub	a5,a2,a5
    13f6:	02000613          	li	a2,32
    13fa:	00f3d7b3          	srl	a5,t2,a5
    13fe:	4581                	li	a1,0
    1400:	00c68763          	beq	a3,a2,140e <__divdf3+0x564>
    1404:	4692                	lw	a3,4(sp)
    1406:	43e68593          	addi	a1,a3,1086 # 7ff0043e <__heap_end+0x5fed043e>
    140a:	00b395b3          	sll	a1,t2,a1
    140e:	8f4d                	or	a4,a4,a1
    1410:	00e03733          	snez	a4,a4
    1414:	8f5d                	or	a4,a4,a5
    1416:	4381                	li	t2,0
    1418:	b74d                	j	13ba <__divdf3+0x510>
    141a:	000803b7          	lui	t2,0x80
    141e:	4701                	li	a4,0
    1420:	7ff00793          	li	a5,2047
    1424:	c002                	sw	zero,0(sp)
    1426:	bddd                	j	131c <__divdf3+0x472>
    1428:	4381                	li	t2,0
    142a:	4701                	li	a4,0
    142c:	b7c1                	j	13ec <__divdf3+0x542>
    142e:	4381                	li	t2,0
    1430:	4701                	li	a4,0
    1432:	4785                	li	a5,1
    1434:	b5e5                	j	131c <__divdf3+0x472>
    1436:	86ba                	mv	a3,a4
    1438:	8736                	mv	a4,a3
    143a:	b569                	j	12c4 <__divdf3+0x41a>

0000143c <__eqdf2>:
    143c:	001007b7          	lui	a5,0x100
    1440:	17fd                	addi	a5,a5,-1
    1442:	1151                	addi	sp,sp,-12
    1444:	00b7f2b3          	and	t0,a5,a1
    1448:	0145d713          	srli	a4,a1,0x14
    144c:	81fd                	srli	a1,a1,0x1f
    144e:	c422                	sw	s0,8(sp)
    1450:	c226                	sw	s1,4(sp)
    1452:	832a                	mv	t1,a0
    1454:	842a                	mv	s0,a0
    1456:	c02e                	sw	a1,0(sp)
    1458:	7ff77713          	andi	a4,a4,2047
    145c:	0146d593          	srli	a1,a3,0x14
    1460:	7ff00513          	li	a0,2047
    1464:	8ff5                	and	a5,a5,a3
    1466:	84b2                	mv	s1,a2
    1468:	7ff5f593          	andi	a1,a1,2047
    146c:	82fd                	srli	a3,a3,0x1f
    146e:	00a71a63          	bne	a4,a0,1482 <__eqdf2+0x46>
    1472:	0062e3b3          	or	t2,t0,t1
    1476:	4505                	li	a0,1
    1478:	02039a63          	bnez	t2,14ac <__eqdf2+0x70>
    147c:	02e59863          	bne	a1,a4,14ac <__eqdf2+0x70>
    1480:	a019                	j	1486 <__eqdf2+0x4a>
    1482:	00a59563          	bne	a1,a0,148c <__eqdf2+0x50>
    1486:	8e5d                	or	a2,a2,a5
    1488:	4505                	li	a0,1
    148a:	e20d                	bnez	a2,14ac <__eqdf2+0x70>
    148c:	4505                	li	a0,1
    148e:	00b71f63          	bne	a4,a1,14ac <__eqdf2+0x70>
    1492:	00f29d63          	bne	t0,a5,14ac <__eqdf2+0x70>
    1496:	00941b63          	bne	s0,s1,14ac <__eqdf2+0x70>
    149a:	4782                	lw	a5,0(sp)
    149c:	00d78c63          	beq	a5,a3,14b4 <__eqdf2+0x78>
    14a0:	00071663          	bnez	a4,14ac <__eqdf2+0x70>
    14a4:	0062e533          	or	a0,t0,t1
    14a8:	00a03533          	snez	a0,a0
    14ac:	4422                	lw	s0,8(sp)
    14ae:	4492                	lw	s1,4(sp)
    14b0:	0131                	addi	sp,sp,12
    14b2:	8082                	ret
    14b4:	4501                	li	a0,0
    14b6:	bfdd                	j	14ac <__eqdf2+0x70>

000014b8 <__gedf2>:
    14b8:	00100737          	lui	a4,0x100
    14bc:	1161                	addi	sp,sp,-8
    14be:	177d                	addi	a4,a4,-1
    14c0:	0145d313          	srli	t1,a1,0x14
    14c4:	00b772b3          	and	t0,a4,a1
    14c8:	c222                	sw	s0,4(sp)
    14ca:	c026                	sw	s1,0(sp)
    14cc:	87aa                	mv	a5,a0
    14ce:	83aa                	mv	t2,a0
    14d0:	7ff37313          	andi	t1,t1,2047
    14d4:	01f5d513          	srli	a0,a1,0x1f
    14d8:	7ff00493          	li	s1,2047
    14dc:	0146d593          	srli	a1,a3,0x14
    14e0:	8f75                	and	a4,a4,a3
    14e2:	8432                	mv	s0,a2
    14e4:	7ff5f593          	andi	a1,a1,2047
    14e8:	82fd                	srli	a3,a3,0x1f
    14ea:	00931763          	bne	t1,s1,14f8 <__gedf2+0x40>
    14ee:	00f2e4b3          	or	s1,t0,a5
    14f2:	c8a5                	beqz	s1,1562 <__gedf2+0xaa>
    14f4:	5579                	li	a0,-2
    14f6:	a825                	j	152e <__gedf2+0x76>
    14f8:	00959563          	bne	a1,s1,1502 <__gedf2+0x4a>
    14fc:	00c764b3          	or	s1,a4,a2
    1500:	f8f5                	bnez	s1,14f4 <__gedf2+0x3c>
    1502:	06031263          	bnez	t1,1566 <__gedf2+0xae>
    1506:	00f2e7b3          	or	a5,t0,a5
    150a:	0017b793          	seqz	a5,a5
    150e:	e199                	bnez	a1,1514 <__gedf2+0x5c>
    1510:	8e59                	or	a2,a2,a4
    1512:	c239                	beqz	a2,1558 <__gedf2+0xa0>
    1514:	00079a63          	bnez	a5,1528 <__gedf2+0x70>
    1518:	00d51463          	bne	a0,a3,1520 <__gedf2+0x68>
    151c:	0065dd63          	bge	a1,t1,1536 <__gedf2+0x7e>
    1520:	02050a63          	beqz	a0,1554 <__gedf2+0x9c>
    1524:	557d                	li	a0,-1
    1526:	a021                	j	152e <__gedf2+0x76>
    1528:	557d                	li	a0,-1
    152a:	c291                	beqz	a3,152e <__gedf2+0x76>
    152c:	8536                	mv	a0,a3
    152e:	4412                	lw	s0,4(sp)
    1530:	4482                	lw	s1,0(sp)
    1532:	0121                	addi	sp,sp,8
    1534:	8082                	ret
    1536:	00b35563          	bge	t1,a1,1540 <__gedf2+0x88>
    153a:	fe051ae3          	bnez	a0,152e <__gedf2+0x76>
    153e:	b7dd                	j	1524 <__gedf2+0x6c>
    1540:	fe5760e3          	bltu	a4,t0,1520 <__gedf2+0x68>
    1544:	00e29c63          	bne	t0,a4,155c <__gedf2+0xa4>
    1548:	fc746ce3          	bltu	s0,t2,1520 <__gedf2+0x68>
    154c:	fe83e7e3          	bltu	t2,s0,153a <__gedf2+0x82>
    1550:	4501                	li	a0,0
    1552:	bff1                	j	152e <__gedf2+0x76>
    1554:	4505                	li	a0,1
    1556:	bfe1                	j	152e <__gedf2+0x76>
    1558:	ffe5                	bnez	a5,1550 <__gedf2+0x98>
    155a:	b7d9                	j	1520 <__gedf2+0x68>
    155c:	fce2efe3          	bltu	t0,a4,153a <__gedf2+0x82>
    1560:	bfc5                	j	1550 <__gedf2+0x98>
    1562:	f8658de3          	beq	a1,t1,14fc <__gedf2+0x44>
    1566:	fa0599e3          	bnez	a1,1518 <__gedf2+0x60>
    156a:	4781                	li	a5,0
    156c:	b755                	j	1510 <__gedf2+0x58>

0000156e <__ledf2>:
    156e:	00100737          	lui	a4,0x100
    1572:	1161                	addi	sp,sp,-8
    1574:	177d                	addi	a4,a4,-1
    1576:	0145d313          	srli	t1,a1,0x14
    157a:	00b772b3          	and	t0,a4,a1
    157e:	c222                	sw	s0,4(sp)
    1580:	c026                	sw	s1,0(sp)
    1582:	87aa                	mv	a5,a0
    1584:	83aa                	mv	t2,a0
    1586:	7ff37313          	andi	t1,t1,2047
    158a:	01f5d513          	srli	a0,a1,0x1f
    158e:	7ff00493          	li	s1,2047
    1592:	0146d593          	srli	a1,a3,0x14
    1596:	8f75                	and	a4,a4,a3
    1598:	8432                	mv	s0,a2
    159a:	7ff5f593          	andi	a1,a1,2047
    159e:	82fd                	srli	a3,a3,0x1f
    15a0:	00931763          	bne	t1,s1,15ae <__ledf2+0x40>
    15a4:	00f2e4b3          	or	s1,t0,a5
    15a8:	c8a5                	beqz	s1,1618 <__ledf2+0xaa>
    15aa:	4509                	li	a0,2
    15ac:	a825                	j	15e4 <__ledf2+0x76>
    15ae:	00959563          	bne	a1,s1,15b8 <__ledf2+0x4a>
    15b2:	00c764b3          	or	s1,a4,a2
    15b6:	f8f5                	bnez	s1,15aa <__ledf2+0x3c>
    15b8:	06031263          	bnez	t1,161c <__ledf2+0xae>
    15bc:	00f2e7b3          	or	a5,t0,a5
    15c0:	0017b793          	seqz	a5,a5
    15c4:	e199                	bnez	a1,15ca <__ledf2+0x5c>
    15c6:	8e59                	or	a2,a2,a4
    15c8:	c239                	beqz	a2,160e <__ledf2+0xa0>
    15ca:	00079a63          	bnez	a5,15de <__ledf2+0x70>
    15ce:	00d51463          	bne	a0,a3,15d6 <__ledf2+0x68>
    15d2:	0065dd63          	bge	a1,t1,15ec <__ledf2+0x7e>
    15d6:	02050a63          	beqz	a0,160a <__ledf2+0x9c>
    15da:	557d                	li	a0,-1
    15dc:	a021                	j	15e4 <__ledf2+0x76>
    15de:	557d                	li	a0,-1
    15e0:	c291                	beqz	a3,15e4 <__ledf2+0x76>
    15e2:	8536                	mv	a0,a3
    15e4:	4412                	lw	s0,4(sp)
    15e6:	4482                	lw	s1,0(sp)
    15e8:	0121                	addi	sp,sp,8
    15ea:	8082                	ret
    15ec:	00b35563          	bge	t1,a1,15f6 <__ledf2+0x88>
    15f0:	fe051ae3          	bnez	a0,15e4 <__ledf2+0x76>
    15f4:	b7dd                	j	15da <__ledf2+0x6c>
    15f6:	fe5760e3          	bltu	a4,t0,15d6 <__ledf2+0x68>
    15fa:	00e29c63          	bne	t0,a4,1612 <__ledf2+0xa4>
    15fe:	fc746ce3          	bltu	s0,t2,15d6 <__ledf2+0x68>
    1602:	fe83e7e3          	bltu	t2,s0,15f0 <__ledf2+0x82>
    1606:	4501                	li	a0,0
    1608:	bff1                	j	15e4 <__ledf2+0x76>
    160a:	4505                	li	a0,1
    160c:	bfe1                	j	15e4 <__ledf2+0x76>
    160e:	ffe5                	bnez	a5,1606 <__ledf2+0x98>
    1610:	b7d9                	j	15d6 <__ledf2+0x68>
    1612:	fce2efe3          	bltu	t0,a4,15f0 <__ledf2+0x82>
    1616:	bfc5                	j	1606 <__ledf2+0x98>
    1618:	f8658de3          	beq	a1,t1,15b2 <__ledf2+0x44>
    161c:	fa0599e3          	bnez	a1,15ce <__ledf2+0x60>
    1620:	4781                	li	a5,0
    1622:	b755                	j	15c6 <__ledf2+0x58>

00001624 <__muldf3>:
    1624:	fd810113          	addi	sp,sp,-40
    1628:	0145d293          	srli	t0,a1,0x14
    162c:	01f5d793          	srli	a5,a1,0x1f
    1630:	d022                	sw	s0,32(sp)
    1632:	00c59313          	slli	t1,a1,0xc
    1636:	d206                	sw	ra,36(sp)
    1638:	ce26                	sw	s1,28(sp)
    163a:	7ff2f293          	andi	t0,t0,2047
    163e:	c43e                	sw	a5,8(sp)
    1640:	842a                	mv	s0,a0
    1642:	00c35313          	srli	t1,t1,0xc
    1646:	08028863          	beqz	t0,16d6 <__muldf3+0xb2>
    164a:	7ff00793          	li	a5,2047
    164e:	0ef28763          	beq	t0,a5,173c <__muldf3+0x118>
    1652:	01d55793          	srli	a5,a0,0x1d
    1656:	030e                	slli	t1,t1,0x3
    1658:	0067e333          	or	t1,a5,t1
    165c:	008007b7          	lui	a5,0x800
    1660:	00f36333          	or	t1,t1,a5
    1664:	00351593          	slli	a1,a0,0x3
    1668:	c0128293          	addi	t0,t0,-1023
    166c:	4481                	li	s1,0
    166e:	0146d513          	srli	a0,a3,0x14
    1672:	01f6d793          	srli	a5,a3,0x1f
    1676:	00c69413          	slli	s0,a3,0xc
    167a:	7ff57513          	andi	a0,a0,2047
    167e:	c63e                	sw	a5,12(sp)
    1680:	8031                	srli	s0,s0,0xc
    1682:	cd71                	beqz	a0,175e <__muldf3+0x13a>
    1684:	7ff00793          	li	a5,2047
    1688:	14f50463          	beq	a0,a5,17d0 <__muldf3+0x1ac>
    168c:	01d65793          	srli	a5,a2,0x1d
    1690:	040e                	slli	s0,s0,0x3
    1692:	8c5d                	or	s0,s0,a5
    1694:	008007b7          	lui	a5,0x800
    1698:	8c5d                	or	s0,s0,a5
    169a:	00361713          	slli	a4,a2,0x3
    169e:	c0150513          	addi	a0,a0,-1023
    16a2:	4781                	li	a5,0
    16a4:	4632                	lw	a2,12(sp)
    16a6:	46a2                	lw	a3,8(sp)
    16a8:	8eb1                	xor	a3,a3,a2
    16aa:	c036                	sw	a3,0(sp)
    16ac:	00a286b3          	add	a3,t0,a0
    16b0:	c836                	sw	a3,16(sp)
    16b2:	0685                	addi	a3,a3,1
    16b4:	c236                	sw	a3,4(sp)
    16b6:	00249693          	slli	a3,s1,0x2
    16ba:	8edd                	or	a3,a3,a5
    16bc:	16fd                	addi	a3,a3,-1
    16be:	4639                	li	a2,14
    16c0:	12d66963          	bltu	a2,a3,17f2 <__muldf3+0x1ce>
    16c4:	00003617          	auipc	a2,0x3
    16c8:	53860613          	addi	a2,a2,1336 # 4bfc <__srodata+0x3c>
    16cc:	068a                	slli	a3,a3,0x2
    16ce:	96b2                	add	a3,a3,a2
    16d0:	4294                	lw	a3,0(a3)
    16d2:	96b2                	add	a3,a3,a2
    16d4:	8682                	jr	a3
    16d6:	00a365b3          	or	a1,t1,a0
    16da:	c9ad                	beqz	a1,174c <__muldf3+0x128>
    16dc:	c636                	sw	a3,12(sp)
    16de:	c232                	sw	a2,4(sp)
    16e0:	02030f63          	beqz	t1,171e <__muldf3+0xfa>
    16e4:	851a                	mv	a0,t1
    16e6:	c01a                	sw	t1,0(sp)
    16e8:	29b000ef          	jal	ra,2182 <__clzsi2>
    16ec:	4302                	lw	t1,0(sp)
    16ee:	4612                	lw	a2,4(sp)
    16f0:	46b2                	lw	a3,12(sp)
    16f2:	ff550713          	addi	a4,a0,-11
    16f6:	47f1                	li	a5,28
    16f8:	02e7cc63          	blt	a5,a4,1730 <__muldf3+0x10c>
    16fc:	47f5                	li	a5,29
    16fe:	ff850593          	addi	a1,a0,-8
    1702:	8f99                	sub	a5,a5,a4
    1704:	00b31333          	sll	t1,t1,a1
    1708:	00f457b3          	srl	a5,s0,a5
    170c:	0067e333          	or	t1,a5,t1
    1710:	00b415b3          	sll	a1,s0,a1
    1714:	c0d00293          	li	t0,-1011
    1718:	40a282b3          	sub	t0,t0,a0
    171c:	bf81                	j	166c <__muldf3+0x48>
    171e:	c01a                	sw	t1,0(sp)
    1720:	263000ef          	jal	ra,2182 <__clzsi2>
    1724:	46b2                	lw	a3,12(sp)
    1726:	4612                	lw	a2,4(sp)
    1728:	4302                	lw	t1,0(sp)
    172a:	02050513          	addi	a0,a0,32
    172e:	b7d1                	j	16f2 <__muldf3+0xce>
    1730:	fd850313          	addi	t1,a0,-40
    1734:	00641333          	sll	t1,s0,t1
    1738:	4581                	li	a1,0
    173a:	bfe9                	j	1714 <__muldf3+0xf0>
    173c:	00a365b3          	or	a1,t1,a0
    1740:	c991                	beqz	a1,1754 <__muldf3+0x130>
    1742:	85aa                	mv	a1,a0
    1744:	7ff00293          	li	t0,2047
    1748:	448d                	li	s1,3
    174a:	b715                	j	166e <__muldf3+0x4a>
    174c:	4301                	li	t1,0
    174e:	4281                	li	t0,0
    1750:	4485                	li	s1,1
    1752:	bf31                	j	166e <__muldf3+0x4a>
    1754:	4301                	li	t1,0
    1756:	7ff00293          	li	t0,2047
    175a:	4489                	li	s1,2
    175c:	bf09                	j	166e <__muldf3+0x4a>
    175e:	00c46733          	or	a4,s0,a2
    1762:	cf3d                	beqz	a4,17e0 <__muldf3+0x1bc>
    1764:	04040263          	beqz	s0,17a8 <__muldf3+0x184>
    1768:	8522                	mv	a0,s0
    176a:	ca32                	sw	a2,20(sp)
    176c:	c81a                	sw	t1,16(sp)
    176e:	c22e                	sw	a1,4(sp)
    1770:	c016                	sw	t0,0(sp)
    1772:	211000ef          	jal	ra,2182 <__clzsi2>
    1776:	4282                	lw	t0,0(sp)
    1778:	4592                	lw	a1,4(sp)
    177a:	4342                	lw	t1,16(sp)
    177c:	4652                	lw	a2,20(sp)
    177e:	ff550693          	addi	a3,a0,-11
    1782:	47f1                	li	a5,28
    1784:	04d7c063          	blt	a5,a3,17c4 <__muldf3+0x1a0>
    1788:	47f5                	li	a5,29
    178a:	ff850713          	addi	a4,a0,-8
    178e:	8f95                	sub	a5,a5,a3
    1790:	00e41433          	sll	s0,s0,a4
    1794:	00f657b3          	srl	a5,a2,a5
    1798:	8c5d                	or	s0,s0,a5
    179a:	00e61733          	sll	a4,a2,a4
    179e:	c0d00793          	li	a5,-1011
    17a2:	40a78533          	sub	a0,a5,a0
    17a6:	bdf5                	j	16a2 <__muldf3+0x7e>
    17a8:	8532                	mv	a0,a2
    17aa:	ca1a                	sw	t1,20(sp)
    17ac:	c82e                	sw	a1,16(sp)
    17ae:	c216                	sw	t0,4(sp)
    17b0:	c032                	sw	a2,0(sp)
    17b2:	1d1000ef          	jal	ra,2182 <__clzsi2>
    17b6:	4352                	lw	t1,20(sp)
    17b8:	45c2                	lw	a1,16(sp)
    17ba:	4292                	lw	t0,4(sp)
    17bc:	4602                	lw	a2,0(sp)
    17be:	02050513          	addi	a0,a0,32
    17c2:	bf75                	j	177e <__muldf3+0x15a>
    17c4:	fd850413          	addi	s0,a0,-40
    17c8:	00861433          	sll	s0,a2,s0
    17cc:	4701                	li	a4,0
    17ce:	bfc1                	j	179e <__muldf3+0x17a>
    17d0:	00c46733          	or	a4,s0,a2
    17d4:	cb11                	beqz	a4,17e8 <__muldf3+0x1c4>
    17d6:	8732                	mv	a4,a2
    17d8:	7ff00513          	li	a0,2047
    17dc:	478d                	li	a5,3
    17de:	b5d9                	j	16a4 <__muldf3+0x80>
    17e0:	4401                	li	s0,0
    17e2:	4501                	li	a0,0
    17e4:	4785                	li	a5,1
    17e6:	bd7d                	j	16a4 <__muldf3+0x80>
    17e8:	4401                	li	s0,0
    17ea:	7ff00513          	li	a0,2047
    17ee:	4789                	li	a5,2
    17f0:	bd55                	j	16a4 <__muldf3+0x80>
    17f2:	0105d613          	srli	a2,a1,0x10
    17f6:	01075493          	srli	s1,a4,0x10
    17fa:	029606b3          	mul	a3,a2,s1
    17fe:	67c1                	lui	a5,0x10
    1800:	17fd                	addi	a5,a5,-1
    1802:	8dfd                	and	a1,a1,a5
    1804:	8f7d                	and	a4,a4,a5
    1806:	02e603b3          	mul	t2,a2,a4
    180a:	c436                	sw	a3,8(sp)
    180c:	02b486b3          	mul	a3,s1,a1
    1810:	02e58533          	mul	a0,a1,a4
    1814:	969e                	add	a3,a3,t2
    1816:	82b6                	mv	t0,a3
    1818:	01055693          	srli	a3,a0,0x10
    181c:	9696                	add	a3,a3,t0
    181e:	0076f763          	bgeu	a3,t2,182c <__muldf3+0x208>
    1822:	029603b3          	mul	t2,a2,s1
    1826:	62c1                	lui	t0,0x10
    1828:	929e                	add	t0,t0,t2
    182a:	c416                	sw	t0,8(sp)
    182c:	0106d293          	srli	t0,a3,0x10
    1830:	8efd                	and	a3,a3,a5
    1832:	8d7d                	and	a0,a0,a5
    1834:	06c2                	slli	a3,a3,0x10
    1836:	96aa                	add	a3,a3,a0
    1838:	8fe1                	and	a5,a5,s0
    183a:	01045513          	srli	a0,s0,0x10
    183e:	02f603b3          	mul	t2,a2,a5
    1842:	ca36                	sw	a3,20(sp)
    1844:	02f586b3          	mul	a3,a1,a5
    1848:	02b505b3          	mul	a1,a0,a1
    184c:	0106d413          	srli	s0,a3,0x10
    1850:	959e                	add	a1,a1,t2
    1852:	95a2                	add	a1,a1,s0
    1854:	02a60633          	mul	a2,a2,a0
    1858:	0075f463          	bgeu	a1,t2,1860 <__muldf3+0x23c>
    185c:	63c1                	lui	t2,0x10
    185e:	961e                	add	a2,a2,t2
    1860:	0105d393          	srli	t2,a1,0x10
    1864:	961e                	add	a2,a2,t2
    1866:	c632                	sw	a2,12(sp)
    1868:	6641                	lui	a2,0x10
    186a:	fff60393          	addi	t2,a2,-1 # ffff <__ctor_end__+0xa6e7>
    186e:	0075f5b3          	and	a1,a1,t2
    1872:	0076f6b3          	and	a3,a3,t2
    1876:	05c2                	slli	a1,a1,0x10
    1878:	95b6                	add	a1,a1,a3
    187a:	00b286b3          	add	a3,t0,a1
    187e:	01035293          	srli	t0,t1,0x10
    1882:	00737333          	and	t1,t1,t2
    1886:	026703b3          	mul	t2,a4,t1
    188a:	cc36                	sw	a3,24(sp)
    188c:	02e28733          	mul	a4,t0,a4
    1890:	026486b3          	mul	a3,s1,t1
    1894:	02548433          	mul	s0,s1,t0
    1898:	96ba                	add	a3,a3,a4
    189a:	0103d493          	srli	s1,t2,0x10
    189e:	96a6                	add	a3,a3,s1
    18a0:	00e6f363          	bgeu	a3,a4,18a6 <__muldf3+0x282>
    18a4:	9432                	add	s0,s0,a2
    18a6:	0106d613          	srli	a2,a3,0x10
    18aa:	6741                	lui	a4,0x10
    18ac:	9622                	add	a2,a2,s0
    18ae:	fff70413          	addi	s0,a4,-1 # ffff <__ctor_end__+0xa6e7>
    18b2:	026784b3          	mul	s1,a5,t1
    18b6:	8ee1                	and	a3,a3,s0
    18b8:	06c2                	slli	a3,a3,0x10
    18ba:	0083f3b3          	and	t2,t2,s0
    18be:	969e                	add	a3,a3,t2
    18c0:	02f287b3          	mul	a5,t0,a5
    18c4:	02650333          	mul	t1,a0,t1
    18c8:	025502b3          	mul	t0,a0,t0
    18cc:	933e                	add	t1,t1,a5
    18ce:	0104d513          	srli	a0,s1,0x10
    18d2:	932a                	add	t1,t1,a0
    18d4:	00f37363          	bgeu	t1,a5,18da <__muldf3+0x2b6>
    18d8:	92ba                	add	t0,t0,a4
    18da:	4762                	lw	a4,24(sp)
    18dc:	47a2                	lw	a5,8(sp)
    18de:	6541                	lui	a0,0x10
    18e0:	157d                	addi	a0,a0,-1
    18e2:	97ba                	add	a5,a5,a4
    18e4:	00a37733          	and	a4,t1,a0
    18e8:	0742                	slli	a4,a4,0x10
    18ea:	8ce9                	and	s1,s1,a0
    18ec:	94ba                	add	s1,s1,a4
    18ee:	4732                	lw	a4,12(sp)
    18f0:	00b7b5b3          	sltu	a1,a5,a1
    18f4:	97b6                	add	a5,a5,a3
    18f6:	94ba                	add	s1,s1,a4
    18f8:	00b48533          	add	a0,s1,a1
    18fc:	00d7b6b3          	sltu	a3,a5,a3
    1900:	00c50433          	add	s0,a0,a2
    1904:	00d403b3          	add	t2,s0,a3
    1908:	00e4b4b3          	sltu	s1,s1,a4
    190c:	00b535b3          	sltu	a1,a0,a1
    1910:	00d3b6b3          	sltu	a3,t2,a3
    1914:	8dc5                	or	a1,a1,s1
    1916:	01035313          	srli	t1,t1,0x10
    191a:	00c43433          	sltu	s0,s0,a2
    191e:	8c55                	or	s0,s0,a3
    1920:	959a                	add	a1,a1,t1
    1922:	942e                	add	s0,s0,a1
    1924:	46d2                	lw	a3,20(sp)
    1926:	92a2                	add	t0,t0,s0
    1928:	0173d713          	srli	a4,t2,0x17
    192c:	00929413          	slli	s0,t0,0x9
    1930:	8c59                	or	s0,s0,a4
    1932:	00979713          	slli	a4,a5,0x9
    1936:	8f55                	or	a4,a4,a3
    1938:	83dd                	srli	a5,a5,0x17
    193a:	00e03733          	snez	a4,a4
    193e:	8f5d                	or	a4,a4,a5
    1940:	010007b7          	lui	a5,0x1000
    1944:	03a6                	slli	t2,t2,0x9
    1946:	8fe1                	and	a5,a5,s0
    1948:	00776733          	or	a4,a4,t2
    194c:	c7dd                	beqz	a5,19fa <__muldf3+0x3d6>
    194e:	00175793          	srli	a5,a4,0x1
    1952:	8b05                	andi	a4,a4,1
    1954:	8f5d                	or	a4,a4,a5
    1956:	01f41793          	slli	a5,s0,0x1f
    195a:	8f5d                	or	a4,a4,a5
    195c:	8005                	srli	s0,s0,0x1
    195e:	4792                	lw	a5,4(sp)
    1960:	3ff78793          	addi	a5,a5,1023 # 10003ff <__min_heap_size+0xfe03ff>
    1964:	08f05e63          	blez	a5,1a00 <__muldf3+0x3dc>
    1968:	00777693          	andi	a3,a4,7
    196c:	ce81                	beqz	a3,1984 <__muldf3+0x360>
    196e:	00f77693          	andi	a3,a4,15
    1972:	4611                	li	a2,4
    1974:	00c68863          	beq	a3,a2,1984 <__muldf3+0x360>
    1978:	00470693          	addi	a3,a4,4
    197c:	00e6b733          	sltu	a4,a3,a4
    1980:	943a                	add	s0,s0,a4
    1982:	8736                	mv	a4,a3
    1984:	010006b7          	lui	a3,0x1000
    1988:	8ee1                	and	a3,a3,s0
    198a:	ca81                	beqz	a3,199a <__muldf3+0x376>
    198c:	ff0007b7          	lui	a5,0xff000
    1990:	17fd                	addi	a5,a5,-1
    1992:	8c7d                	and	s0,s0,a5
    1994:	4792                	lw	a5,4(sp)
    1996:	40078793          	addi	a5,a5,1024 # ff000400 <__heap_end+0xdefd0400>
    199a:	7fe00693          	li	a3,2046
    199e:	0ef6ce63          	blt	a3,a5,1a9a <__muldf3+0x476>
    19a2:	01d41693          	slli	a3,s0,0x1d
    19a6:	830d                	srli	a4,a4,0x3
    19a8:	8f55                	or	a4,a4,a3
    19aa:	800d                	srli	s0,s0,0x3
    19ac:	7ff006b7          	lui	a3,0x7ff00
    19b0:	07d2                	slli	a5,a5,0x14
    19b2:	0432                	slli	s0,s0,0xc
    19b4:	8ff5                	and	a5,a5,a3
    19b6:	8031                	srli	s0,s0,0xc
    19b8:	8c5d                	or	s0,s0,a5
    19ba:	4782                	lw	a5,0(sp)
    19bc:	5092                	lw	ra,36(sp)
    19be:	44f2                	lw	s1,28(sp)
    19c0:	07fe                	slli	a5,a5,0x1f
    19c2:	00f466b3          	or	a3,s0,a5
    19c6:	5402                	lw	s0,32(sp)
    19c8:	853a                	mv	a0,a4
    19ca:	85b6                	mv	a1,a3
    19cc:	02810113          	addi	sp,sp,40
    19d0:	8082                	ret
    19d2:	47a2                	lw	a5,8(sp)
    19d4:	c03e                	sw	a5,0(sp)
    19d6:	841a                	mv	s0,t1
    19d8:	872e                	mv	a4,a1
    19da:	87a6                	mv	a5,s1
    19dc:	4689                	li	a3,2
    19de:	0ad78e63          	beq	a5,a3,1a9a <__muldf3+0x476>
    19e2:	468d                	li	a3,3
    19e4:	0ad78463          	beq	a5,a3,1a8c <__muldf3+0x468>
    19e8:	4685                	li	a3,1
    19ea:	f6d79ae3          	bne	a5,a3,195e <__muldf3+0x33a>
    19ee:	4401                	li	s0,0
    19f0:	4701                	li	a4,0
    19f2:	a0b5                	j	1a5e <__muldf3+0x43a>
    19f4:	46b2                	lw	a3,12(sp)
    19f6:	c036                	sw	a3,0(sp)
    19f8:	b7d5                	j	19dc <__muldf3+0x3b8>
    19fa:	47c2                	lw	a5,16(sp)
    19fc:	c23e                	sw	a5,4(sp)
    19fe:	b785                	j	195e <__muldf3+0x33a>
    1a00:	4605                	li	a2,1
    1a02:	8e1d                	sub	a2,a2,a5
    1a04:	03800693          	li	a3,56
    1a08:	fec6c3e3          	blt	a3,a2,19ee <__muldf3+0x3ca>
    1a0c:	46fd                	li	a3,31
    1a0e:	04c6ca63          	blt	a3,a2,1a62 <__muldf3+0x43e>
    1a12:	4792                	lw	a5,4(sp)
    1a14:	00c755b3          	srl	a1,a4,a2
    1a18:	41e78793          	addi	a5,a5,1054
    1a1c:	00f416b3          	sll	a3,s0,a5
    1a20:	00f71733          	sll	a4,a4,a5
    1a24:	8ecd                	or	a3,a3,a1
    1a26:	00e03733          	snez	a4,a4
    1a2a:	8f55                	or	a4,a4,a3
    1a2c:	00c45433          	srl	s0,s0,a2
    1a30:	00777793          	andi	a5,a4,7
    1a34:	cf81                	beqz	a5,1a4c <__muldf3+0x428>
    1a36:	00f77793          	andi	a5,a4,15
    1a3a:	4691                	li	a3,4
    1a3c:	00d78863          	beq	a5,a3,1a4c <__muldf3+0x428>
    1a40:	00470793          	addi	a5,a4,4
    1a44:	00e7b733          	sltu	a4,a5,a4
    1a48:	943a                	add	s0,s0,a4
    1a4a:	873e                	mv	a4,a5
    1a4c:	008007b7          	lui	a5,0x800
    1a50:	8fe1                	and	a5,a5,s0
    1a52:	eba9                	bnez	a5,1aa4 <__muldf3+0x480>
    1a54:	01d41793          	slli	a5,s0,0x1d
    1a58:	830d                	srli	a4,a4,0x3
    1a5a:	8f5d                	or	a4,a4,a5
    1a5c:	800d                	srli	s0,s0,0x3
    1a5e:	4781                	li	a5,0
    1a60:	b7b1                	j	19ac <__muldf3+0x388>
    1a62:	5685                	li	a3,-31
    1a64:	40f687b3          	sub	a5,a3,a5
    1a68:	02000593          	li	a1,32
    1a6c:	00f457b3          	srl	a5,s0,a5
    1a70:	4681                	li	a3,0
    1a72:	00b60763          	beq	a2,a1,1a80 <__muldf3+0x45c>
    1a76:	4692                	lw	a3,4(sp)
    1a78:	43e68693          	addi	a3,a3,1086 # 7ff0043e <__heap_end+0x5fed043e>
    1a7c:	00d416b3          	sll	a3,s0,a3
    1a80:	8f55                	or	a4,a4,a3
    1a82:	00e03733          	snez	a4,a4
    1a86:	8f5d                	or	a4,a4,a5
    1a88:	4401                	li	s0,0
    1a8a:	b75d                	j	1a30 <__muldf3+0x40c>
    1a8c:	00080437          	lui	s0,0x80
    1a90:	4701                	li	a4,0
    1a92:	7ff00793          	li	a5,2047
    1a96:	c002                	sw	zero,0(sp)
    1a98:	bf11                	j	19ac <__muldf3+0x388>
    1a9a:	4401                	li	s0,0
    1a9c:	4701                	li	a4,0
    1a9e:	7ff00793          	li	a5,2047
    1aa2:	b729                	j	19ac <__muldf3+0x388>
    1aa4:	4401                	li	s0,0
    1aa6:	4701                	li	a4,0
    1aa8:	4785                	li	a5,1
    1aaa:	b709                	j	19ac <__muldf3+0x388>

00001aac <__subdf3>:
    1aac:	00100337          	lui	t1,0x100
    1ab0:	137d                	addi	t1,t1,-1
    1ab2:	1131                	addi	sp,sp,-20
    1ab4:	00b377b3          	and	a5,t1,a1
    1ab8:	0145d713          	srli	a4,a1,0x14
    1abc:	c426                	sw	s1,8(sp)
    1abe:	078e                	slli	a5,a5,0x3
    1ac0:	7ff77493          	andi	s1,a4,2047
    1ac4:	01d55713          	srli	a4,a0,0x1d
    1ac8:	8fd9                	or	a5,a5,a4
    1aca:	00d37733          	and	a4,t1,a3
    1ace:	c622                	sw	s0,12(sp)
    1ad0:	0146d313          	srli	t1,a3,0x14
    1ad4:	01f5d413          	srli	s0,a1,0x1f
    1ad8:	070e                	slli	a4,a4,0x3
    1ada:	01d65593          	srli	a1,a2,0x1d
    1ade:	8f4d                	or	a4,a4,a1
    1ae0:	c806                	sw	ra,16(sp)
    1ae2:	7ff37313          	andi	t1,t1,2047
    1ae6:	7ff00593          	li	a1,2047
    1aea:	050e                	slli	a0,a0,0x3
    1aec:	82fd                	srli	a3,a3,0x1f
    1aee:	060e                	slli	a2,a2,0x3
    1af0:	00b31563          	bne	t1,a1,1afa <__subdf3+0x4e>
    1af4:	00c765b3          	or	a1,a4,a2
    1af8:	e199                	bnez	a1,1afe <__subdf3+0x52>
    1afa:	0016c693          	xori	a3,a3,1
    1afe:	406482b3          	sub	t0,s1,t1
    1b02:	22869563          	bne	a3,s0,1d2c <__subdf3+0x280>
    1b06:	0e505263          	blez	t0,1bea <__subdf3+0x13e>
    1b0a:	02031863          	bnez	t1,1b3a <__subdf3+0x8e>
    1b0e:	00c766b3          	or	a3,a4,a2
    1b12:	56068f63          	beqz	a3,2090 <__subdf3+0x5e4>
    1b16:	fff28593          	addi	a1,t0,-1 # ffff <__ctor_end__+0xa6e7>
    1b1a:	e989                	bnez	a1,1b2c <__subdf3+0x80>
    1b1c:	962a                	add	a2,a2,a0
    1b1e:	00a63533          	sltu	a0,a2,a0
    1b22:	97ba                	add	a5,a5,a4
    1b24:	97aa                	add	a5,a5,a0
    1b26:	8532                	mv	a0,a2
    1b28:	4485                	li	s1,1
    1b2a:	a8b9                	j	1b88 <__subdf3+0xdc>
    1b2c:	7ff00693          	li	a3,2047
    1b30:	00d29d63          	bne	t0,a3,1b4a <__subdf3+0x9e>
    1b34:	7ff00493          	li	s1,2047
    1b38:	aa79                	j	1cd6 <__subdf3+0x22a>
    1b3a:	7ff00693          	li	a3,2047
    1b3e:	18d48c63          	beq	s1,a3,1cd6 <__subdf3+0x22a>
    1b42:	008006b7          	lui	a3,0x800
    1b46:	8f55                	or	a4,a4,a3
    1b48:	8596                	mv	a1,t0
    1b4a:	03800693          	li	a3,56
    1b4e:	08b6ca63          	blt	a3,a1,1be2 <__subdf3+0x136>
    1b52:	46fd                	li	a3,31
    1b54:	06b6c163          	blt	a3,a1,1bb6 <__subdf3+0x10a>
    1b58:	02000313          	li	t1,32
    1b5c:	40b30333          	sub	t1,t1,a1
    1b60:	006716b3          	sll	a3,a4,t1
    1b64:	00b652b3          	srl	t0,a2,a1
    1b68:	00661633          	sll	a2,a2,t1
    1b6c:	0056e6b3          	or	a3,a3,t0
    1b70:	00c03633          	snez	a2,a2
    1b74:	8e55                	or	a2,a2,a3
    1b76:	00b75733          	srl	a4,a4,a1
    1b7a:	962a                	add	a2,a2,a0
    1b7c:	00a63533          	sltu	a0,a2,a0
    1b80:	973e                	add	a4,a4,a5
    1b82:	00a707b3          	add	a5,a4,a0
    1b86:	8532                	mv	a0,a2
    1b88:	00800737          	lui	a4,0x800
    1b8c:	8f7d                	and	a4,a4,a5
    1b8e:	14070463          	beqz	a4,1cd6 <__subdf3+0x22a>
    1b92:	0485                	addi	s1,s1,1
    1b94:	7ff00713          	li	a4,2047
    1b98:	48e48c63          	beq	s1,a4,2030 <__subdf3+0x584>
    1b9c:	ff800737          	lui	a4,0xff800
    1ba0:	177d                	addi	a4,a4,-1
    1ba2:	8ff9                	and	a5,a5,a4
    1ba4:	00155713          	srli	a4,a0,0x1
    1ba8:	8905                	andi	a0,a0,1
    1baa:	8d59                	or	a0,a0,a4
    1bac:	01f79713          	slli	a4,a5,0x1f
    1bb0:	8d59                	or	a0,a0,a4
    1bb2:	8385                	srli	a5,a5,0x1
    1bb4:	a20d                	j	1cd6 <__subdf3+0x22a>
    1bb6:	fe058693          	addi	a3,a1,-32
    1bba:	02000293          	li	t0,32
    1bbe:	00d756b3          	srl	a3,a4,a3
    1bc2:	4301                	li	t1,0
    1bc4:	00558863          	beq	a1,t0,1bd4 <__subdf3+0x128>
    1bc8:	04000313          	li	t1,64
    1bcc:	40b305b3          	sub	a1,t1,a1
    1bd0:	00b71333          	sll	t1,a4,a1
    1bd4:	00c36633          	or	a2,t1,a2
    1bd8:	00c03633          	snez	a2,a2
    1bdc:	8e55                	or	a2,a2,a3
    1bde:	4701                	li	a4,0
    1be0:	bf69                	j	1b7a <__subdf3+0xce>
    1be2:	8e59                	or	a2,a2,a4
    1be4:	00c03633          	snez	a2,a2
    1be8:	bfdd                	j	1bde <__subdf3+0x132>
    1bea:	0a028a63          	beqz	t0,1c9e <__subdf3+0x1f2>
    1bee:	409305b3          	sub	a1,t1,s1
    1bf2:	e48d                	bnez	s1,1c1c <__subdf3+0x170>
    1bf4:	00a7e6b3          	or	a3,a5,a0
    1bf8:	42068363          	beqz	a3,201e <__subdf3+0x572>
    1bfc:	fff58693          	addi	a3,a1,-1
    1c00:	e699                	bnez	a3,1c0e <__subdf3+0x162>
    1c02:	9532                	add	a0,a0,a2
    1c04:	97ba                	add	a5,a5,a4
    1c06:	00c53633          	sltu	a2,a0,a2
    1c0a:	97b2                	add	a5,a5,a2
    1c0c:	bf31                	j	1b28 <__subdf3+0x7c>
    1c0e:	7ff00293          	li	t0,2047
    1c12:	00559d63          	bne	a1,t0,1c2c <__subdf3+0x180>
    1c16:	87ba                	mv	a5,a4
    1c18:	8532                	mv	a0,a2
    1c1a:	bf29                	j	1b34 <__subdf3+0x88>
    1c1c:	7ff00693          	li	a3,2047
    1c20:	fed30be3          	beq	t1,a3,1c16 <__subdf3+0x16a>
    1c24:	008006b7          	lui	a3,0x800
    1c28:	8fd5                	or	a5,a5,a3
    1c2a:	86ae                	mv	a3,a1
    1c2c:	03800593          	li	a1,56
    1c30:	06d5c363          	blt	a1,a3,1c96 <__subdf3+0x1ea>
    1c34:	45fd                	li	a1,31
    1c36:	02d5ca63          	blt	a1,a3,1c6a <__subdf3+0x1be>
    1c3a:	02000293          	li	t0,32
    1c3e:	40d282b3          	sub	t0,t0,a3
    1c42:	005795b3          	sll	a1,a5,t0
    1c46:	00d553b3          	srl	t2,a0,a3
    1c4a:	00551533          	sll	a0,a0,t0
    1c4e:	0075e5b3          	or	a1,a1,t2
    1c52:	00a03533          	snez	a0,a0
    1c56:	8d4d                	or	a0,a0,a1
    1c58:	00d7d7b3          	srl	a5,a5,a3
    1c5c:	9532                	add	a0,a0,a2
    1c5e:	97ba                	add	a5,a5,a4
    1c60:	00c53633          	sltu	a2,a0,a2
    1c64:	97b2                	add	a5,a5,a2
    1c66:	849a                	mv	s1,t1
    1c68:	b705                	j	1b88 <__subdf3+0xdc>
    1c6a:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
    1c6e:	02000393          	li	t2,32
    1c72:	00b7d5b3          	srl	a1,a5,a1
    1c76:	4281                	li	t0,0
    1c78:	00768863          	beq	a3,t2,1c88 <__subdf3+0x1dc>
    1c7c:	04000293          	li	t0,64
    1c80:	40d286b3          	sub	a3,t0,a3
    1c84:	00d792b3          	sll	t0,a5,a3
    1c88:	00a2e533          	or	a0,t0,a0
    1c8c:	00a03533          	snez	a0,a0
    1c90:	8d4d                	or	a0,a0,a1
    1c92:	4781                	li	a5,0
    1c94:	b7e1                	j	1c5c <__subdf3+0x1b0>
    1c96:	8d5d                	or	a0,a0,a5
    1c98:	00a03533          	snez	a0,a0
    1c9c:	bfdd                	j	1c92 <__subdf3+0x1e6>
    1c9e:	00148693          	addi	a3,s1,1
    1ca2:	7fe6f593          	andi	a1,a3,2046
    1ca6:	e1bd                	bnez	a1,1d0c <__subdf3+0x260>
    1ca8:	00a7e6b3          	or	a3,a5,a0
    1cac:	e4a9                	bnez	s1,1cf6 <__subdf3+0x24a>
    1cae:	36068c63          	beqz	a3,2026 <__subdf3+0x57a>
    1cb2:	00c766b3          	or	a3,a4,a2
    1cb6:	c285                	beqz	a3,1cd6 <__subdf3+0x22a>
    1cb8:	962a                	add	a2,a2,a0
    1cba:	97ba                	add	a5,a5,a4
    1cbc:	00a63533          	sltu	a0,a2,a0
    1cc0:	97aa                	add	a5,a5,a0
    1cc2:	00800737          	lui	a4,0x800
    1cc6:	8f7d                	and	a4,a4,a5
    1cc8:	8532                	mv	a0,a2
    1cca:	c711                	beqz	a4,1cd6 <__subdf3+0x22a>
    1ccc:	ff800737          	lui	a4,0xff800
    1cd0:	177d                	addi	a4,a4,-1
    1cd2:	8ff9                	and	a5,a5,a4
    1cd4:	4485                	li	s1,1
    1cd6:	00757713          	andi	a4,a0,7
    1cda:	34070d63          	beqz	a4,2034 <__subdf3+0x588>
    1cde:	00f57713          	andi	a4,a0,15
    1ce2:	4691                	li	a3,4
    1ce4:	34d70863          	beq	a4,a3,2034 <__subdf3+0x588>
    1ce8:	00450713          	addi	a4,a0,4 # 10004 <__ctor_end__+0xa6ec>
    1cec:	00a73533          	sltu	a0,a4,a0
    1cf0:	97aa                	add	a5,a5,a0
    1cf2:	853a                	mv	a0,a4
    1cf4:	a681                	j	2034 <__subdf3+0x588>
    1cf6:	d285                	beqz	a3,1c16 <__subdf3+0x16a>
    1cf8:	8e59                	or	a2,a2,a4
    1cfa:	e2060de3          	beqz	a2,1b34 <__subdf3+0x88>
    1cfe:	4401                	li	s0,0
    1d00:	004007b7          	lui	a5,0x400
    1d04:	4501                	li	a0,0
    1d06:	7ff00493          	li	s1,2047
    1d0a:	a62d                	j	2034 <__subdf3+0x588>
    1d0c:	7ff00593          	li	a1,2047
    1d10:	30b68e63          	beq	a3,a1,202c <__subdf3+0x580>
    1d14:	962a                	add	a2,a2,a0
    1d16:	00a63533          	sltu	a0,a2,a0
    1d1a:	97ba                	add	a5,a5,a4
    1d1c:	97aa                	add	a5,a5,a0
    1d1e:	01f79513          	slli	a0,a5,0x1f
    1d22:	8205                	srli	a2,a2,0x1
    1d24:	8d51                	or	a0,a0,a2
    1d26:	8385                	srli	a5,a5,0x1
    1d28:	84b6                	mv	s1,a3
    1d2a:	b775                	j	1cd6 <__subdf3+0x22a>
    1d2c:	0c505563          	blez	t0,1df6 <__subdf3+0x34a>
    1d30:	08031063          	bnez	t1,1db0 <__subdf3+0x304>
    1d34:	00c766b3          	or	a3,a4,a2
    1d38:	34068c63          	beqz	a3,2090 <__subdf3+0x5e4>
    1d3c:	fff28593          	addi	a1,t0,-1
    1d40:	e991                	bnez	a1,1d54 <__subdf3+0x2a8>
    1d42:	40c50633          	sub	a2,a0,a2
    1d46:	00c53533          	sltu	a0,a0,a2
    1d4a:	8f99                	sub	a5,a5,a4
    1d4c:	8f89                	sub	a5,a5,a0
    1d4e:	8532                	mv	a0,a2
    1d50:	4485                	li	s1,1
    1d52:	a0b1                	j	1d9e <__subdf3+0x2f2>
    1d54:	7ff00693          	li	a3,2047
    1d58:	dcd28ee3          	beq	t0,a3,1b34 <__subdf3+0x88>
    1d5c:	03800693          	li	a3,56
    1d60:	08b6c763          	blt	a3,a1,1dee <__subdf3+0x342>
    1d64:	46fd                	li	a3,31
    1d66:	04b6ce63          	blt	a3,a1,1dc2 <__subdf3+0x316>
    1d6a:	02000313          	li	t1,32
    1d6e:	40b30333          	sub	t1,t1,a1
    1d72:	006716b3          	sll	a3,a4,t1
    1d76:	00b652b3          	srl	t0,a2,a1
    1d7a:	00661633          	sll	a2,a2,t1
    1d7e:	0056e6b3          	or	a3,a3,t0
    1d82:	00c03633          	snez	a2,a2
    1d86:	8e55                	or	a2,a2,a3
    1d88:	00b75733          	srl	a4,a4,a1
    1d8c:	40c50633          	sub	a2,a0,a2
    1d90:	00c53533          	sltu	a0,a0,a2
    1d94:	40e78733          	sub	a4,a5,a4
    1d98:	40a707b3          	sub	a5,a4,a0
    1d9c:	8532                	mv	a0,a2
    1d9e:	008005b7          	lui	a1,0x800
    1da2:	00b7f733          	and	a4,a5,a1
    1da6:	db05                	beqz	a4,1cd6 <__subdf3+0x22a>
    1da8:	15fd                	addi	a1,a1,-1
    1daa:	8dfd                	and	a1,a1,a5
    1dac:	832a                	mv	t1,a0
    1dae:	aa5d                	j	1f64 <__subdf3+0x4b8>
    1db0:	7ff00693          	li	a3,2047
    1db4:	f2d481e3          	beq	s1,a3,1cd6 <__subdf3+0x22a>
    1db8:	008006b7          	lui	a3,0x800
    1dbc:	8f55                	or	a4,a4,a3
    1dbe:	8596                	mv	a1,t0
    1dc0:	bf71                	j	1d5c <__subdf3+0x2b0>
    1dc2:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
    1dc6:	02000293          	li	t0,32
    1dca:	00d756b3          	srl	a3,a4,a3
    1dce:	4301                	li	t1,0
    1dd0:	00558863          	beq	a1,t0,1de0 <__subdf3+0x334>
    1dd4:	04000313          	li	t1,64
    1dd8:	40b305b3          	sub	a1,t1,a1
    1ddc:	00b71333          	sll	t1,a4,a1
    1de0:	00c36633          	or	a2,t1,a2
    1de4:	00c03633          	snez	a2,a2
    1de8:	8e55                	or	a2,a2,a3
    1dea:	4701                	li	a4,0
    1dec:	b745                	j	1d8c <__subdf3+0x2e0>
    1dee:	8e59                	or	a2,a2,a4
    1df0:	00c03633          	snez	a2,a2
    1df4:	bfdd                	j	1dea <__subdf3+0x33e>
    1df6:	0c028463          	beqz	t0,1ebe <__subdf3+0x412>
    1dfa:	409302b3          	sub	t0,t1,s1
    1dfe:	e895                	bnez	s1,1e32 <__subdf3+0x386>
    1e00:	00a7e5b3          	or	a1,a5,a0
    1e04:	28058863          	beqz	a1,2094 <__subdf3+0x5e8>
    1e08:	fff28593          	addi	a1,t0,-1
    1e0c:	e991                	bnez	a1,1e20 <__subdf3+0x374>
    1e0e:	40a60533          	sub	a0,a2,a0
    1e12:	40f707b3          	sub	a5,a4,a5
    1e16:	00a63633          	sltu	a2,a2,a0
    1e1a:	8f91                	sub	a5,a5,a2
    1e1c:	8436                	mv	s0,a3
    1e1e:	bf0d                	j	1d50 <__subdf3+0x2a4>
    1e20:	7ff00393          	li	t2,2047
    1e24:	00729f63          	bne	t0,t2,1e42 <__subdf3+0x396>
    1e28:	87ba                	mv	a5,a4
    1e2a:	8532                	mv	a0,a2
    1e2c:	7ff00493          	li	s1,2047
    1e30:	a07d                	j	1ede <__subdf3+0x432>
    1e32:	7ff00593          	li	a1,2047
    1e36:	feb309e3          	beq	t1,a1,1e28 <__subdf3+0x37c>
    1e3a:	008005b7          	lui	a1,0x800
    1e3e:	8fcd                	or	a5,a5,a1
    1e40:	8596                	mv	a1,t0
    1e42:	03800293          	li	t0,56
    1e46:	06b2c863          	blt	t0,a1,1eb6 <__subdf3+0x40a>
    1e4a:	42fd                	li	t0,31
    1e4c:	02b2ce63          	blt	t0,a1,1e88 <__subdf3+0x3dc>
    1e50:	02000393          	li	t2,32
    1e54:	40b383b3          	sub	t2,t2,a1
    1e58:	007792b3          	sll	t0,a5,t2
    1e5c:	00b55433          	srl	s0,a0,a1
    1e60:	00751533          	sll	a0,a0,t2
    1e64:	0082e2b3          	or	t0,t0,s0
    1e68:	00a03533          	snez	a0,a0
    1e6c:	00a2e533          	or	a0,t0,a0
    1e70:	00b7d7b3          	srl	a5,a5,a1
    1e74:	40a60533          	sub	a0,a2,a0
    1e78:	40f707b3          	sub	a5,a4,a5
    1e7c:	00a63633          	sltu	a2,a2,a0
    1e80:	8f91                	sub	a5,a5,a2
    1e82:	849a                	mv	s1,t1
    1e84:	8436                	mv	s0,a3
    1e86:	bf21                	j	1d9e <__subdf3+0x2f2>
    1e88:	fe058293          	addi	t0,a1,-32 # 7fffe0 <__min_heap_size+0x7dffe0>
    1e8c:	02000413          	li	s0,32
    1e90:	0057d2b3          	srl	t0,a5,t0
    1e94:	4381                	li	t2,0
    1e96:	00858863          	beq	a1,s0,1ea6 <__subdf3+0x3fa>
    1e9a:	04000393          	li	t2,64
    1e9e:	40b385b3          	sub	a1,t2,a1
    1ea2:	00b793b3          	sll	t2,a5,a1
    1ea6:	00a3e533          	or	a0,t2,a0
    1eaa:	00a03533          	snez	a0,a0
    1eae:	00a2e533          	or	a0,t0,a0
    1eb2:	4781                	li	a5,0
    1eb4:	b7c1                	j	1e74 <__subdf3+0x3c8>
    1eb6:	8d5d                	or	a0,a0,a5
    1eb8:	00a03533          	snez	a0,a0
    1ebc:	bfdd                	j	1eb2 <__subdf3+0x406>
    1ebe:	00148593          	addi	a1,s1,1
    1ec2:	7fe5f593          	andi	a1,a1,2046
    1ec6:	e9a5                	bnez	a1,1f36 <__subdf3+0x48a>
    1ec8:	00a7e333          	or	t1,a5,a0
    1ecc:	00c765b3          	or	a1,a4,a2
    1ed0:	e8a1                	bnez	s1,1f20 <__subdf3+0x474>
    1ed2:	00031863          	bnez	t1,1ee2 <__subdf3+0x436>
    1ed6:	1c058363          	beqz	a1,209c <__subdf3+0x5f0>
    1eda:	87ba                	mv	a5,a4
    1edc:	8532                	mv	a0,a2
    1ede:	8436                	mv	s0,a3
    1ee0:	bbdd                	j	1cd6 <__subdf3+0x22a>
    1ee2:	de058ae3          	beqz	a1,1cd6 <__subdf3+0x22a>
    1ee6:	40c50333          	sub	t1,a0,a2
    1eea:	006532b3          	sltu	t0,a0,t1
    1eee:	40e785b3          	sub	a1,a5,a4
    1ef2:	405585b3          	sub	a1,a1,t0
    1ef6:	008002b7          	lui	t0,0x800
    1efa:	0055f2b3          	and	t0,a1,t0
    1efe:	00028a63          	beqz	t0,1f12 <__subdf3+0x466>
    1f02:	40a60533          	sub	a0,a2,a0
    1f06:	40f707b3          	sub	a5,a4,a5
    1f0a:	00a63633          	sltu	a2,a2,a0
    1f0e:	8f91                	sub	a5,a5,a2
    1f10:	b7f9                	j	1ede <__subdf3+0x432>
    1f12:	00b36533          	or	a0,t1,a1
    1f16:	18050763          	beqz	a0,20a4 <__subdf3+0x5f8>
    1f1a:	87ae                	mv	a5,a1
    1f1c:	851a                	mv	a0,t1
    1f1e:	bb65                	j	1cd6 <__subdf3+0x22a>
    1f20:	00031863          	bnez	t1,1f30 <__subdf3+0x484>
    1f24:	18058263          	beqz	a1,20a8 <__subdf3+0x5fc>
    1f28:	87ba                	mv	a5,a4
    1f2a:	8532                	mv	a0,a2
    1f2c:	8436                	mv	s0,a3
    1f2e:	b119                	j	1b34 <__subdf3+0x88>
    1f30:	c00582e3          	beqz	a1,1b34 <__subdf3+0x88>
    1f34:	b3e9                	j	1cfe <__subdf3+0x252>
    1f36:	40c50333          	sub	t1,a0,a2
    1f3a:	006532b3          	sltu	t0,a0,t1
    1f3e:	40e785b3          	sub	a1,a5,a4
    1f42:	405585b3          	sub	a1,a1,t0
    1f46:	008002b7          	lui	t0,0x800
    1f4a:	0055f2b3          	and	t0,a1,t0
    1f4e:	06028a63          	beqz	t0,1fc2 <__subdf3+0x516>
    1f52:	40a60333          	sub	t1,a2,a0
    1f56:	40f707b3          	sub	a5,a4,a5
    1f5a:	00663633          	sltu	a2,a2,t1
    1f5e:	40c785b3          	sub	a1,a5,a2
    1f62:	8436                	mv	s0,a3
    1f64:	c5ad                	beqz	a1,1fce <__subdf3+0x522>
    1f66:	852e                	mv	a0,a1
    1f68:	c21a                	sw	t1,4(sp)
    1f6a:	c02e                	sw	a1,0(sp)
    1f6c:	2c19                	jal	2182 <__clzsi2>
    1f6e:	4582                	lw	a1,0(sp)
    1f70:	4312                	lw	t1,4(sp)
    1f72:	ff850713          	addi	a4,a0,-8
    1f76:	47fd                	li	a5,31
    1f78:	06e7c463          	blt	a5,a4,1fe0 <__subdf3+0x534>
    1f7c:	02000793          	li	a5,32
    1f80:	8f99                	sub	a5,a5,a4
    1f82:	00e595b3          	sll	a1,a1,a4
    1f86:	00f357b3          	srl	a5,t1,a5
    1f8a:	8fcd                	or	a5,a5,a1
    1f8c:	00e31533          	sll	a0,t1,a4
    1f90:	08974163          	blt	a4,s1,2012 <__subdf3+0x566>
    1f94:	8f05                	sub	a4,a4,s1
    1f96:	00170613          	addi	a2,a4,1 # ff800001 <__heap_end+0xdf7d0001>
    1f9a:	46fd                	li	a3,31
    1f9c:	04c6c863          	blt	a3,a2,1fec <__subdf3+0x540>
    1fa0:	02000713          	li	a4,32
    1fa4:	8f11                	sub	a4,a4,a2
    1fa6:	00e796b3          	sll	a3,a5,a4
    1faa:	00c555b3          	srl	a1,a0,a2
    1fae:	00e51533          	sll	a0,a0,a4
    1fb2:	8ecd                	or	a3,a3,a1
    1fb4:	00a03533          	snez	a0,a0
    1fb8:	8d55                	or	a0,a0,a3
    1fba:	00c7d7b3          	srl	a5,a5,a2
    1fbe:	4481                	li	s1,0
    1fc0:	bb19                	j	1cd6 <__subdf3+0x22a>
    1fc2:	00b36533          	or	a0,t1,a1
    1fc6:	fd59                	bnez	a0,1f64 <__subdf3+0x4b8>
    1fc8:	4781                	li	a5,0
    1fca:	4481                	li	s1,0
    1fcc:	a8d1                	j	20a0 <__subdf3+0x5f4>
    1fce:	851a                	mv	a0,t1
    1fd0:	c22e                	sw	a1,4(sp)
    1fd2:	c01a                	sw	t1,0(sp)
    1fd4:	227d                	jal	2182 <__clzsi2>
    1fd6:	4592                	lw	a1,4(sp)
    1fd8:	4302                	lw	t1,0(sp)
    1fda:	02050513          	addi	a0,a0,32
    1fde:	bf51                	j	1f72 <__subdf3+0x4c6>
    1fe0:	fd850793          	addi	a5,a0,-40
    1fe4:	00f317b3          	sll	a5,t1,a5
    1fe8:	4501                	li	a0,0
    1fea:	b75d                	j	1f90 <__subdf3+0x4e4>
    1fec:	1705                	addi	a4,a4,-31
    1fee:	02000593          	li	a1,32
    1ff2:	00e7d733          	srl	a4,a5,a4
    1ff6:	4681                	li	a3,0
    1ff8:	00b60763          	beq	a2,a1,2006 <__subdf3+0x55a>
    1ffc:	04000693          	li	a3,64
    2000:	8e91                	sub	a3,a3,a2
    2002:	00d796b3          	sll	a3,a5,a3
    2006:	8d55                	or	a0,a0,a3
    2008:	00a03533          	snez	a0,a0
    200c:	8d59                	or	a0,a0,a4
    200e:	4781                	li	a5,0
    2010:	b77d                	j	1fbe <__subdf3+0x512>
    2012:	8c99                	sub	s1,s1,a4
    2014:	ff800737          	lui	a4,0xff800
    2018:	177d                	addi	a4,a4,-1
    201a:	8ff9                	and	a5,a5,a4
    201c:	b96d                	j	1cd6 <__subdf3+0x22a>
    201e:	87ba                	mv	a5,a4
    2020:	8532                	mv	a0,a2
    2022:	84ae                	mv	s1,a1
    2024:	b94d                	j	1cd6 <__subdf3+0x22a>
    2026:	87ba                	mv	a5,a4
    2028:	8532                	mv	a0,a2
    202a:	b175                	j	1cd6 <__subdf3+0x22a>
    202c:	7ff00493          	li	s1,2047
    2030:	4781                	li	a5,0
    2032:	4501                	li	a0,0
    2034:	00800737          	lui	a4,0x800
    2038:	8f7d                	and	a4,a4,a5
    203a:	cb11                	beqz	a4,204e <__subdf3+0x5a2>
    203c:	0485                	addi	s1,s1,1
    203e:	7ff00713          	li	a4,2047
    2042:	06e48863          	beq	s1,a4,20b2 <__subdf3+0x606>
    2046:	ff800737          	lui	a4,0xff800
    204a:	177d                	addi	a4,a4,-1
    204c:	8ff9                	and	a5,a5,a4
    204e:	01d79713          	slli	a4,a5,0x1d
    2052:	810d                	srli	a0,a0,0x3
    2054:	8d59                	or	a0,a0,a4
    2056:	7ff00713          	li	a4,2047
    205a:	838d                	srli	a5,a5,0x3
    205c:	00e49963          	bne	s1,a4,206e <__subdf3+0x5c2>
    2060:	8d5d                	or	a0,a0,a5
    2062:	4781                	li	a5,0
    2064:	c509                	beqz	a0,206e <__subdf3+0x5c2>
    2066:	000807b7          	lui	a5,0x80
    206a:	4501                	li	a0,0
    206c:	4401                	li	s0,0
    206e:	01449713          	slli	a4,s1,0x14
    2072:	7ff006b7          	lui	a3,0x7ff00
    2076:	07b2                	slli	a5,a5,0xc
    2078:	8f75                	and	a4,a4,a3
    207a:	83b1                	srli	a5,a5,0xc
    207c:	047e                	slli	s0,s0,0x1f
    207e:	8fd9                	or	a5,a5,a4
    2080:	40c2                	lw	ra,16(sp)
    2082:	0087e733          	or	a4,a5,s0
    2086:	4432                	lw	s0,12(sp)
    2088:	44a2                	lw	s1,8(sp)
    208a:	85ba                	mv	a1,a4
    208c:	0151                	addi	sp,sp,20
    208e:	8082                	ret
    2090:	8496                	mv	s1,t0
    2092:	b191                	j	1cd6 <__subdf3+0x22a>
    2094:	87ba                	mv	a5,a4
    2096:	8532                	mv	a0,a2
    2098:	8496                	mv	s1,t0
    209a:	b591                	j	1ede <__subdf3+0x432>
    209c:	4781                	li	a5,0
    209e:	4501                	li	a0,0
    20a0:	4401                	li	s0,0
    20a2:	bf49                	j	2034 <__subdf3+0x588>
    20a4:	4781                	li	a5,0
    20a6:	bfed                	j	20a0 <__subdf3+0x5f4>
    20a8:	4501                	li	a0,0
    20aa:	4401                	li	s0,0
    20ac:	004007b7          	lui	a5,0x400
    20b0:	b999                	j	1d06 <__subdf3+0x25a>
    20b2:	4781                	li	a5,0
    20b4:	4501                	li	a0,0
    20b6:	bf61                	j	204e <__subdf3+0x5a2>

000020b8 <__fixdfsi>:
    20b8:	0145d713          	srli	a4,a1,0x14
    20bc:	001006b7          	lui	a3,0x100
    20c0:	fff68793          	addi	a5,a3,-1 # fffff <__min_heap_size+0xdffff>
    20c4:	7ff77713          	andi	a4,a4,2047
    20c8:	3fe00613          	li	a2,1022
    20cc:	8fed                	and	a5,a5,a1
    20ce:	81fd                	srli	a1,a1,0x1f
    20d0:	04e65463          	bge	a2,a4,2118 <__fixdfsi+0x60>
    20d4:	41d00613          	li	a2,1053
    20d8:	00e65863          	bge	a2,a4,20e8 <__fixdfsi+0x30>
    20dc:	80000537          	lui	a0,0x80000
    20e0:	fff54513          	not	a0,a0
    20e4:	952e                	add	a0,a0,a1
    20e6:	8082                	ret
    20e8:	8fd5                	or	a5,a5,a3
    20ea:	43300693          	li	a3,1075
    20ee:	8e99                	sub	a3,a3,a4
    20f0:	467d                	li	a2,31
    20f2:	00d64d63          	blt	a2,a3,210c <__fixdfsi+0x54>
    20f6:	bed70713          	addi	a4,a4,-1043 # ff7ffbed <__heap_end+0xdf7cfbed>
    20fa:	00e797b3          	sll	a5,a5,a4
    20fe:	00d55533          	srl	a0,a0,a3
    2102:	8d5d                	or	a0,a0,a5
    2104:	c999                	beqz	a1,211a <__fixdfsi+0x62>
    2106:	40a00533          	neg	a0,a0
    210a:	8082                	ret
    210c:	41300513          	li	a0,1043
    2110:	8d19                	sub	a0,a0,a4
    2112:	00a7d533          	srl	a0,a5,a0
    2116:	b7fd                	j	2104 <__fixdfsi+0x4c>
    2118:	4501                	li	a0,0
    211a:	8082                	ret

0000211c <__floatsidf>:
    211c:	1151                	addi	sp,sp,-12
    211e:	c406                	sw	ra,8(sp)
    2120:	c222                	sw	s0,4(sp)
    2122:	c026                	sw	s1,0(sp)
    2124:	cd21                	beqz	a0,217c <__floatsidf+0x60>
    2126:	41f55793          	srai	a5,a0,0x1f
    212a:	00a7c433          	xor	s0,a5,a0
    212e:	8c1d                	sub	s0,s0,a5
    2130:	01f55493          	srli	s1,a0,0x1f
    2134:	8522                	mv	a0,s0
    2136:	20b1                	jal	2182 <__clzsi2>
    2138:	41e00713          	li	a4,1054
    213c:	47a9                	li	a5,10
    213e:	8f09                	sub	a4,a4,a0
    2140:	02a7c863          	blt	a5,a0,2170 <__floatsidf+0x54>
    2144:	47ad                	li	a5,11
    2146:	8f89                	sub	a5,a5,a0
    2148:	0555                	addi	a0,a0,21
    214a:	00f457b3          	srl	a5,s0,a5
    214e:	00a41433          	sll	s0,s0,a0
    2152:	8526                	mv	a0,s1
    2154:	07b2                	slli	a5,a5,0xc
    2156:	0752                	slli	a4,a4,0x14
    2158:	83b1                	srli	a5,a5,0xc
    215a:	057e                	slli	a0,a0,0x1f
    215c:	8fd9                	or	a5,a5,a4
    215e:	40a2                	lw	ra,8(sp)
    2160:	00a7e733          	or	a4,a5,a0
    2164:	8522                	mv	a0,s0
    2166:	4412                	lw	s0,4(sp)
    2168:	4482                	lw	s1,0(sp)
    216a:	85ba                	mv	a1,a4
    216c:	0131                	addi	sp,sp,12
    216e:	8082                	ret
    2170:	1555                	addi	a0,a0,-11
    2172:	00a417b3          	sll	a5,s0,a0
    2176:	8526                	mv	a0,s1
    2178:	4401                	li	s0,0
    217a:	bfe9                	j	2154 <__floatsidf+0x38>
    217c:	4701                	li	a4,0
    217e:	4781                	li	a5,0
    2180:	bfe5                	j	2178 <__floatsidf+0x5c>

00002182 <__clzsi2>:
    2182:	67c1                	lui	a5,0x10
    2184:	02f57663          	bgeu	a0,a5,21b0 <__clzsi2+0x2e>
    2188:	0ff00793          	li	a5,255
    218c:	00a7b7b3          	sltu	a5,a5,a0
    2190:	078e                	slli	a5,a5,0x3
    2192:	02000713          	li	a4,32
    2196:	8f1d                	sub	a4,a4,a5
    2198:	00f55533          	srl	a0,a0,a5
    219c:	00003797          	auipc	a5,0x3
    21a0:	a9c78793          	addi	a5,a5,-1380 # 4c38 <__clz_tab>
    21a4:	953e                	add	a0,a0,a5
    21a6:	00054503          	lbu	a0,0(a0) # 80000000 <__heap_end+0x5ffd0000>
    21aa:	40a70533          	sub	a0,a4,a0
    21ae:	8082                	ret
    21b0:	01000737          	lui	a4,0x1000
    21b4:	47c1                	li	a5,16
    21b6:	fce56ee3          	bltu	a0,a4,2192 <__clzsi2+0x10>
    21ba:	47e1                	li	a5,24
    21bc:	bfd9                	j	2192 <__clzsi2+0x10>

000021be <memmove>:
    21be:	02a5f263          	bgeu	a1,a0,21e2 <memmove+0x24>
    21c2:	00c587b3          	add	a5,a1,a2
    21c6:	00f57e63          	bgeu	a0,a5,21e2 <memmove+0x24>
    21ca:	00c50733          	add	a4,a0,a2
    21ce:	c20d                	beqz	a2,21f0 <memmove+0x32>
    21d0:	fff7c683          	lbu	a3,-1(a5)
    21d4:	17fd                	addi	a5,a5,-1
    21d6:	177d                	addi	a4,a4,-1
    21d8:	00d70023          	sb	a3,0(a4) # 1000000 <__min_heap_size+0xfe0000>
    21dc:	fef59ae3          	bne	a1,a5,21d0 <memmove+0x12>
    21e0:	8082                	ret
    21e2:	47bd                	li	a5,15
    21e4:	00c7e763          	bltu	a5,a2,21f2 <memmove+0x34>
    21e8:	87aa                	mv	a5,a0
    21ea:	fff60693          	addi	a3,a2,-1
    21ee:	ea09                	bnez	a2,2200 <memmove+0x42>
    21f0:	8082                	ret
    21f2:	00a5e7b3          	or	a5,a1,a0
    21f6:	8b8d                	andi	a5,a5,3
    21f8:	cf99                	beqz	a5,2216 <memmove+0x58>
    21fa:	fff60693          	addi	a3,a2,-1
    21fe:	87aa                	mv	a5,a0
    2200:	0685                	addi	a3,a3,1
    2202:	96be                	add	a3,a3,a5
    2204:	0005c703          	lbu	a4,0(a1)
    2208:	0785                	addi	a5,a5,1
    220a:	0585                	addi	a1,a1,1
    220c:	fee78fa3          	sb	a4,-1(a5)
    2210:	fed79ae3          	bne	a5,a3,2204 <memmove+0x46>
    2214:	8082                	ret
    2216:	ff060293          	addi	t0,a2,-16
    221a:	ff02f293          	andi	t0,t0,-16
    221e:	02c1                	addi	t0,t0,16
    2220:	00550333          	add	t1,a0,t0
    2224:	872e                	mv	a4,a1
    2226:	87aa                	mv	a5,a0
    2228:	4314                	lw	a3,0(a4)
    222a:	0741                	addi	a4,a4,16
    222c:	07c1                	addi	a5,a5,16
    222e:	fed7a823          	sw	a3,-16(a5)
    2232:	ff472683          	lw	a3,-12(a4)
    2236:	fed7aa23          	sw	a3,-12(a5)
    223a:	ff872683          	lw	a3,-8(a4)
    223e:	fed7ac23          	sw	a3,-8(a5)
    2242:	ffc72683          	lw	a3,-4(a4)
    2246:	fed7ae23          	sw	a3,-4(a5)
    224a:	fcf31fe3          	bne	t1,a5,2228 <memmove+0x6a>
    224e:	00c67713          	andi	a4,a2,12
    2252:	9596                	add	a1,a1,t0
    2254:	00f67313          	andi	t1,a2,15
    2258:	cb21                	beqz	a4,22a8 <memmove+0xea>
    225a:	1171                	addi	sp,sp,-4
    225c:	c022                	sw	s0,0(sp)
    225e:	872e                	mv	a4,a1
    2260:	82be                	mv	t0,a5
    2262:	440d                	li	s0,3
    2264:	00072383          	lw	t2,0(a4)
    2268:	0711                	addi	a4,a4,4
    226a:	40e306b3          	sub	a3,t1,a4
    226e:	0072a023          	sw	t2,0(t0) # 800000 <__min_heap_size+0x7e0000>
    2272:	96ae                	add	a3,a3,a1
    2274:	0291                	addi	t0,t0,4
    2276:	fed467e3          	bltu	s0,a3,2264 <memmove+0xa6>
    227a:	ffc30713          	addi	a4,t1,-4 # ffffc <__min_heap_size+0xdfffc>
    227e:	9b71                	andi	a4,a4,-4
    2280:	8a0d                	andi	a2,a2,3
    2282:	0711                	addi	a4,a4,4
    2284:	fff60693          	addi	a3,a2,-1
    2288:	97ba                	add	a5,a5,a4
    228a:	0685                	addi	a3,a3,1
    228c:	95ba                	add	a1,a1,a4
    228e:	96be                	add	a3,a3,a5
    2290:	ca09                	beqz	a2,22a2 <memmove+0xe4>
    2292:	0005c703          	lbu	a4,0(a1)
    2296:	0785                	addi	a5,a5,1
    2298:	0585                	addi	a1,a1,1
    229a:	fee78fa3          	sb	a4,-1(a5)
    229e:	fed79ae3          	bne	a5,a3,2292 <memmove+0xd4>
    22a2:	4402                	lw	s0,0(sp)
    22a4:	0111                	addi	sp,sp,4
    22a6:	8082                	ret
    22a8:	861a                	mv	a2,t1
    22aa:	b781                	j	21ea <memmove+0x2c>

000022ac <memset>:
    22ac:	433d                	li	t1,15
    22ae:	872a                	mv	a4,a0
    22b0:	02c37563          	bgeu	t1,a2,22da <memset+0x2e>
    22b4:	00f77793          	andi	a5,a4,15
    22b8:	e3c9                	bnez	a5,233a <memset+0x8e>
    22ba:	06059763          	bnez	a1,2328 <memset+0x7c>
    22be:	ff067693          	andi	a3,a2,-16
    22c2:	8a3d                	andi	a2,a2,15
    22c4:	96ba                	add	a3,a3,a4
    22c6:	c30c                	sw	a1,0(a4)
    22c8:	c34c                	sw	a1,4(a4)
    22ca:	c70c                	sw	a1,8(a4)
    22cc:	c74c                	sw	a1,12(a4)
    22ce:	0741                	addi	a4,a4,16
    22d0:	fed76be3          	bltu	a4,a3,22c6 <memset+0x1a>
    22d4:	00061363          	bnez	a2,22da <memset+0x2e>
    22d8:	8082                	ret
    22da:	40c306b3          	sub	a3,t1,a2
    22de:	068a                	slli	a3,a3,0x2
    22e0:	00000297          	auipc	t0,0x0
    22e4:	9696                	add	a3,a3,t0
    22e6:	00a68067          	jr	10(a3)
    22ea:	00b70723          	sb	a1,14(a4)
    22ee:	00b706a3          	sb	a1,13(a4)
    22f2:	00b70623          	sb	a1,12(a4)
    22f6:	00b705a3          	sb	a1,11(a4)
    22fa:	00b70523          	sb	a1,10(a4)
    22fe:	00b704a3          	sb	a1,9(a4)
    2302:	00b70423          	sb	a1,8(a4)
    2306:	00b703a3          	sb	a1,7(a4)
    230a:	00b70323          	sb	a1,6(a4)
    230e:	00b702a3          	sb	a1,5(a4)
    2312:	00b70223          	sb	a1,4(a4)
    2316:	00b701a3          	sb	a1,3(a4)
    231a:	00b70123          	sb	a1,2(a4)
    231e:	00b700a3          	sb	a1,1(a4)
    2322:	00b70023          	sb	a1,0(a4)
    2326:	8082                	ret
    2328:	0ff5f593          	andi	a1,a1,255
    232c:	00859693          	slli	a3,a1,0x8
    2330:	8dd5                	or	a1,a1,a3
    2332:	01059693          	slli	a3,a1,0x10
    2336:	8dd5                	or	a1,a1,a3
    2338:	b759                	j	22be <memset+0x12>
    233a:	00279693          	slli	a3,a5,0x2
    233e:	00000297          	auipc	t0,0x0
    2342:	9696                	add	a3,a3,t0
    2344:	8286                	mv	t0,ra
    2346:	fa8680e7          	jalr	-88(a3)
    234a:	8096                	mv	ra,t0
    234c:	17c1                	addi	a5,a5,-16
    234e:	8f1d                	sub	a4,a4,a5
    2350:	963e                	add	a2,a2,a5
    2352:	f8c374e3          	bgeu	t1,a2,22da <memset+0x2e>
    2356:	b795                	j	22ba <memset+0xe>
	...

0000235a <strchr>:
    235a:	0ff5f693          	andi	a3,a1,255
    235e:	00357793          	andi	a5,a0,3
    2362:	cec9                	beqz	a3,23fc <strchr+0xa2>
    2364:	00078b63          	beqz	a5,237a <strchr+0x20>
    2368:	00054783          	lbu	a5,0(a0)
    236c:	c7d1                	beqz	a5,23f8 <strchr+0x9e>
    236e:	08d78663          	beq	a5,a3,23fa <strchr+0xa0>
    2372:	0505                	addi	a0,a0,1
    2374:	00357793          	andi	a5,a0,3
    2378:	fbe5                	bnez	a5,2368 <strchr+0xe>
    237a:	0ff5f593          	andi	a1,a1,255
    237e:	00859313          	slli	t1,a1,0x8
    2382:	4118                	lw	a4,0(a0)
    2384:	0065e5b3          	or	a1,a1,t1
    2388:	01059313          	slli	t1,a1,0x10
    238c:	00b36333          	or	t1,t1,a1
    2390:	feff0637          	lui	a2,0xfeff0
    2394:	00e345b3          	xor	a1,t1,a4
    2398:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    239c:	00c587b3          	add	a5,a1,a2
    23a0:	00c702b3          	add	t0,a4,a2
    23a4:	fff5c593          	not	a1,a1
    23a8:	fff74713          	not	a4,a4
    23ac:	8fed                	and	a5,a5,a1
    23ae:	00e2f733          	and	a4,t0,a4
    23b2:	808085b7          	lui	a1,0x80808
    23b6:	8fd9                	or	a5,a5,a4
    23b8:	08058593          	addi	a1,a1,128 # 80808080 <__heap_end+0x607d8080>
    23bc:	8fed                	and	a5,a5,a1
    23be:	e785                	bnez	a5,23e6 <strchr+0x8c>
    23c0:	4158                	lw	a4,4(a0)
    23c2:	0511                	addi	a0,a0,4
    23c4:	006742b3          	xor	t0,a4,t1
    23c8:	00c707b3          	add	a5,a4,a2
    23cc:	00c283b3          	add	t2,t0,a2
    23d0:	fff74713          	not	a4,a4
    23d4:	fff2c293          	not	t0,t0
    23d8:	8ff9                	and	a5,a5,a4
    23da:	0053f2b3          	and	t0,t2,t0
    23de:	0057e7b3          	or	a5,a5,t0
    23e2:	8fed                	and	a5,a5,a1
    23e4:	dff1                	beqz	a5,23c0 <strchr+0x66>
    23e6:	00054783          	lbu	a5,0(a0)
    23ea:	c799                	beqz	a5,23f8 <strchr+0x9e>
    23ec:	06f68163          	beq	a3,a5,244e <strchr+0xf4>
    23f0:	00154783          	lbu	a5,1(a0)
    23f4:	0505                	addi	a0,a0,1
    23f6:	fbfd                	bnez	a5,23ec <strchr+0x92>
    23f8:	4501                	li	a0,0
    23fa:	8082                	ret
    23fc:	cb81                	beqz	a5,240c <strchr+0xb2>
    23fe:	00054783          	lbu	a5,0(a0)
    2402:	dfe5                	beqz	a5,23fa <strchr+0xa0>
    2404:	0505                	addi	a0,a0,1
    2406:	00357793          	andi	a5,a0,3
    240a:	fbf5                	bnez	a5,23fe <strchr+0xa4>
    240c:	4118                	lw	a4,0(a0)
    240e:	feff0637          	lui	a2,0xfeff0
    2412:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    2416:	00c707b3          	add	a5,a4,a2
    241a:	808086b7          	lui	a3,0x80808
    241e:	fff74713          	not	a4,a4
    2422:	8ff9                	and	a5,a5,a4
    2424:	08068693          	addi	a3,a3,128 # 80808080 <__heap_end+0x607d8080>
    2428:	8ff5                	and	a5,a5,a3
    242a:	eb91                	bnez	a5,243e <strchr+0xe4>
    242c:	4158                	lw	a4,4(a0)
    242e:	0511                	addi	a0,a0,4
    2430:	00c707b3          	add	a5,a4,a2
    2434:	fff74713          	not	a4,a4
    2438:	8ff9                	and	a5,a5,a4
    243a:	8ff5                	and	a5,a5,a3
    243c:	dbe5                	beqz	a5,242c <strchr+0xd2>
    243e:	00054783          	lbu	a5,0(a0)
    2442:	dfc5                	beqz	a5,23fa <strchr+0xa0>
    2444:	00154783          	lbu	a5,1(a0)
    2448:	0505                	addi	a0,a0,1
    244a:	ffed                	bnez	a5,2444 <strchr+0xea>
    244c:	8082                	ret
    244e:	8082                	ret

00002450 <strcpy>:
    2450:	00b567b3          	or	a5,a0,a1
    2454:	8b8d                	andi	a5,a5,3
    2456:	efb1                	bnez	a5,24b2 <strcpy+0x62>
    2458:	4198                	lw	a4,0(a1)
    245a:	7f7f86b7          	lui	a3,0x7f7f8
    245e:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    2462:	00d777b3          	and	a5,a4,a3
    2466:	97b6                	add	a5,a5,a3
    2468:	8fd9                	or	a5,a5,a4
    246a:	8fd5                	or	a5,a5,a3
    246c:	567d                	li	a2,-1
    246e:	04c79b63          	bne	a5,a2,24c4 <strcpy+0x74>
    2472:	862a                	mv	a2,a0
    2474:	537d                	li	t1,-1
    2476:	c218                	sw	a4,0(a2)
    2478:	41d8                	lw	a4,4(a1)
    247a:	0591                	addi	a1,a1,4
    247c:	0611                	addi	a2,a2,4
    247e:	00d777b3          	and	a5,a4,a3
    2482:	97b6                	add	a5,a5,a3
    2484:	8fd9                	or	a5,a5,a4
    2486:	8fd5                	or	a5,a5,a3
    2488:	fe6787e3          	beq	a5,t1,2476 <strcpy+0x26>
    248c:	0005c783          	lbu	a5,0(a1)
    2490:	0015c703          	lbu	a4,1(a1)
    2494:	0025c683          	lbu	a3,2(a1)
    2498:	00f60023          	sb	a5,0(a2)
    249c:	c799                	beqz	a5,24aa <strcpy+0x5a>
    249e:	00e600a3          	sb	a4,1(a2)
    24a2:	c701                	beqz	a4,24aa <strcpy+0x5a>
    24a4:	00d60123          	sb	a3,2(a2)
    24a8:	e291                	bnez	a3,24ac <strcpy+0x5c>
    24aa:	8082                	ret
    24ac:	000601a3          	sb	zero,3(a2)
    24b0:	8082                	ret
    24b2:	87aa                	mv	a5,a0
    24b4:	0005c703          	lbu	a4,0(a1)
    24b8:	0785                	addi	a5,a5,1
    24ba:	0585                	addi	a1,a1,1
    24bc:	fee78fa3          	sb	a4,-1(a5)
    24c0:	fb75                	bnez	a4,24b4 <strcpy+0x64>
    24c2:	8082                	ret
    24c4:	862a                	mv	a2,a0
    24c6:	b7d9                	j	248c <strcpy+0x3c>
	...

000024ca <_strerror_r>:
    24ca:	87ae                	mv	a5,a1
    24cc:	08e00713          	li	a4,142
    24d0:	85b2                	mv	a1,a2
    24d2:	00f76d63          	bltu	a4,a5,24ec <_strerror_r+0x22>
    24d6:	00003617          	auipc	a2,0x3
    24da:	86260613          	addi	a2,a2,-1950 # 4d38 <__clz_tab+0x100>
    24de:	00279313          	slli	t1,a5,0x2
    24e2:	9332                	add	t1,t1,a2
    24e4:	00032703          	lw	a4,0(t1)
    24e8:	9732                	add	a4,a4,a2
    24ea:	8702                	jr	a4
    24ec:	1151                	addi	sp,sp,-12
    24ee:	c406                	sw	ra,8(sp)
    24f0:	32068f63          	beqz	a3,282e <_strerror_r+0x364>
    24f4:	8636                	mv	a2,a3
    24f6:	853e                	mv	a0,a5
    24f8:	2735                	jal	2c24 <_user_strerror>
    24fa:	32050563          	beqz	a0,2824 <_strerror_r+0x35a>
    24fe:	40a2                	lw	ra,8(sp)
    2500:	0131                	addi	sp,sp,12
    2502:	8082                	ret
    2504:	00003517          	auipc	a0,0x3
    2508:	38050513          	addi	a0,a0,896 # 5884 <pad_line+0x68c>
    250c:	8082                	ret
    250e:	00003517          	auipc	a0,0x3
    2512:	35e50513          	addi	a0,a0,862 # 586c <pad_line+0x674>
    2516:	8082                	ret
    2518:	00003517          	auipc	a0,0x3
    251c:	30c50513          	addi	a0,a0,780 # 5824 <pad_line+0x62c>
    2520:	8082                	ret
    2522:	00003517          	auipc	a0,0x3
    2526:	31a50513          	addi	a0,a0,794 # 583c <pad_line+0x644>
    252a:	8082                	ret
    252c:	00003517          	auipc	a0,0x3
    2530:	efc50513          	addi	a0,a0,-260 # 5428 <pad_line+0x230>
    2534:	8082                	ret
    2536:	00003517          	auipc	a0,0x3
    253a:	2b250513          	addi	a0,a0,690 # 57e8 <pad_line+0x5f0>
    253e:	8082                	ret
    2540:	00003517          	auipc	a0,0x3
    2544:	11c50513          	addi	a0,a0,284 # 565c <pad_line+0x464>
    2548:	8082                	ret
    254a:	00003517          	auipc	a0,0x3
    254e:	39a50513          	addi	a0,a0,922 # 58e4 <pad_line+0x6ec>
    2552:	8082                	ret
    2554:	00003517          	auipc	a0,0x3
    2558:	d9c50513          	addi	a0,a0,-612 # 52f0 <pad_line+0xf8>
    255c:	8082                	ret
    255e:	00003517          	auipc	a0,0x3
    2562:	d5a50513          	addi	a0,a0,-678 # 52b8 <pad_line+0xc0>
    2566:	8082                	ret
    2568:	00003517          	auipc	a0,0x3
    256c:	2f050513          	addi	a0,a0,752 # 5858 <pad_line+0x660>
    2570:	8082                	ret
    2572:	00003517          	auipc	a0,0x3
    2576:	34a50513          	addi	a0,a0,842 # 58bc <pad_line+0x6c4>
    257a:	8082                	ret
    257c:	00003517          	auipc	a0,0x3
    2580:	03850513          	addi	a0,a0,56 # 55b4 <pad_line+0x3bc>
    2584:	8082                	ret
    2586:	00003517          	auipc	a0,0x3
    258a:	f6650513          	addi	a0,a0,-154 # 54ec <pad_line+0x2f4>
    258e:	8082                	ret
    2590:	00003517          	auipc	a0,0x3
    2594:	e3050513          	addi	a0,a0,-464 # 53c0 <pad_line+0x1c8>
    2598:	8082                	ret
    259a:	00003517          	auipc	a0,0x3
    259e:	f2650513          	addi	a0,a0,-218 # 54c0 <pad_line+0x2c8>
    25a2:	8082                	ret
    25a4:	00003517          	auipc	a0,0x3
    25a8:	e0c50513          	addi	a0,a0,-500 # 53b0 <pad_line+0x1b8>
    25ac:	8082                	ret
    25ae:	00003517          	auipc	a0,0x3
    25b2:	34a50513          	addi	a0,a0,842 # 58f8 <pad_line+0x700>
    25b6:	8082                	ret
    25b8:	00003517          	auipc	a0,0x3
    25bc:	e4c50513          	addi	a0,a0,-436 # 5404 <pad_line+0x20c>
    25c0:	8082                	ret
    25c2:	00003517          	auipc	a0,0x3
    25c6:	01650513          	addi	a0,a0,22 # 55d8 <pad_line+0x3e0>
    25ca:	8082                	ret
    25cc:	00003517          	auipc	a0,0x3
    25d0:	23450513          	addi	a0,a0,564 # 5800 <pad_line+0x608>
    25d4:	8082                	ret
    25d6:	00003517          	auipc	a0,0x3
    25da:	1fa50513          	addi	a0,a0,506 # 57d0 <pad_line+0x5d8>
    25de:	8082                	ret
    25e0:	00003517          	auipc	a0,0x3
    25e4:	1c050513          	addi	a0,a0,448 # 57a0 <pad_line+0x5a8>
    25e8:	8082                	ret
    25ea:	00003517          	auipc	a0,0x3
    25ee:	19e50513          	addi	a0,a0,414 # 5788 <pad_line+0x590>
    25f2:	8082                	ret
    25f4:	00003517          	auipc	a0,0x3
    25f8:	17450513          	addi	a0,a0,372 # 5768 <pad_line+0x570>
    25fc:	8082                	ret
    25fe:	00003517          	auipc	a0,0x3
    2602:	14a50513          	addi	a0,a0,330 # 5748 <pad_line+0x550>
    2606:	8082                	ret
    2608:	00003517          	auipc	a0,0x3
    260c:	11050513          	addi	a0,a0,272 # 5718 <pad_line+0x520>
    2610:	8082                	ret
    2612:	00003517          	auipc	a0,0x3
    2616:	0e250513          	addi	a0,a0,226 # 56f4 <pad_line+0x4fc>
    261a:	8082                	ret
    261c:	00003517          	auipc	a0,0x3
    2620:	19850513          	addi	a0,a0,408 # 57b4 <pad_line+0x5bc>
    2624:	8082                	ret
    2626:	00003517          	auipc	a0,0x3
    262a:	27250513          	addi	a0,a0,626 # 5898 <pad_line+0x6a0>
    262e:	8082                	ret
    2630:	00003517          	auipc	a0,0x3
    2634:	0ac50513          	addi	a0,a0,172 # 56dc <pad_line+0x4e4>
    2638:	8082                	ret
    263a:	00003517          	auipc	a0,0x3
    263e:	08650513          	addi	a0,a0,134 # 56c0 <pad_line+0x4c8>
    2642:	8082                	ret
    2644:	00003517          	auipc	a0,0x3
    2648:	06850513          	addi	a0,a0,104 # 56ac <pad_line+0x4b4>
    264c:	8082                	ret
    264e:	00003517          	auipc	a0,0x3
    2652:	04250513          	addi	a0,a0,66 # 5690 <pad_line+0x498>
    2656:	8082                	ret
    2658:	00003517          	auipc	a0,0x3
    265c:	02c50513          	addi	a0,a0,44 # 5684 <pad_line+0x48c>
    2660:	8082                	ret
    2662:	00003517          	auipc	a0,0x3
    2666:	00e50513          	addi	a0,a0,14 # 5670 <pad_line+0x478>
    266a:	8082                	ret
    266c:	00003517          	auipc	a0,0x3
    2670:	fe050513          	addi	a0,a0,-32 # 564c <pad_line+0x454>
    2674:	8082                	ret
    2676:	00003517          	auipc	a0,0x3
    267a:	fbe50513          	addi	a0,a0,-66 # 5634 <pad_line+0x43c>
    267e:	8082                	ret
    2680:	00003517          	auipc	a0,0x3
    2684:	fa050513          	addi	a0,a0,-96 # 5620 <pad_line+0x428>
    2688:	8082                	ret
    268a:	00003517          	auipc	a0,0x3
    268e:	f7e50513          	addi	a0,a0,-130 # 5608 <pad_line+0x410>
    2692:	8082                	ret
    2694:	00003517          	auipc	a0,0x3
    2698:	07c50513          	addi	a0,a0,124 # 5710 <pad_line+0x518>
    269c:	8082                	ret
    269e:	00003517          	auipc	a0,0x3
    26a2:	f5a50513          	addi	a0,a0,-166 # 55f8 <pad_line+0x400>
    26a6:	8082                	ret
    26a8:	00003517          	auipc	a0,0x3
    26ac:	f4850513          	addi	a0,a0,-184 # 55f0 <pad_line+0x3f8>
    26b0:	8082                	ret
    26b2:	00003517          	auipc	a0,0x3
    26b6:	f1a50513          	addi	a0,a0,-230 # 55cc <pad_line+0x3d4>
    26ba:	8082                	ret
    26bc:	00003517          	auipc	a0,0x3
    26c0:	ee450513          	addi	a0,a0,-284 # 55a0 <pad_line+0x3a8>
    26c4:	8082                	ret
    26c6:	00003517          	auipc	a0,0x3
    26ca:	ebe50513          	addi	a0,a0,-322 # 5584 <pad_line+0x38c>
    26ce:	8082                	ret
    26d0:	00003517          	auipc	a0,0x3
    26d4:	ea050513          	addi	a0,a0,-352 # 5570 <pad_line+0x378>
    26d8:	8082                	ret
    26da:	00003517          	auipc	a0,0x3
    26de:	e6650513          	addi	a0,a0,-410 # 5540 <pad_line+0x348>
    26e2:	8082                	ret
    26e4:	00003517          	auipc	a0,0x3
    26e8:	e5050513          	addi	a0,a0,-432 # 5534 <pad_line+0x33c>
    26ec:	8082                	ret
    26ee:	00003517          	auipc	a0,0x3
    26f2:	e3650513          	addi	a0,a0,-458 # 5524 <pad_line+0x32c>
    26f6:	8082                	ret
    26f8:	00003517          	auipc	a0,0x3
    26fc:	e1450513          	addi	a0,a0,-492 # 550c <pad_line+0x314>
    2700:	8082                	ret
    2702:	00003517          	auipc	a0,0x3
    2706:	dfa50513          	addi	a0,a0,-518 # 54fc <pad_line+0x304>
    270a:	8082                	ret
    270c:	00003517          	auipc	a0,0x3
    2710:	dc850513          	addi	a0,a0,-568 # 54d4 <pad_line+0x2dc>
    2714:	8082                	ret
    2716:	00003517          	auipc	a0,0x3
    271a:	d9a50513          	addi	a0,a0,-614 # 54b0 <pad_line+0x2b8>
    271e:	8082                	ret
    2720:	00003517          	auipc	a0,0x3
    2724:	d8050513          	addi	a0,a0,-640 # 54a0 <pad_line+0x2a8>
    2728:	8082                	ret
    272a:	00003517          	auipc	a0,0x3
    272e:	d5e50513          	addi	a0,a0,-674 # 5488 <pad_line+0x290>
    2732:	8082                	ret
    2734:	00003517          	auipc	a0,0x3
    2738:	d3450513          	addi	a0,a0,-716 # 5468 <pad_line+0x270>
    273c:	8082                	ret
    273e:	00003517          	auipc	a0,0x3
    2742:	d0a50513          	addi	a0,a0,-758 # 5448 <pad_line+0x250>
    2746:	8082                	ret
    2748:	00003517          	auipc	a0,0x3
    274c:	ca850513          	addi	a0,a0,-856 # 53f0 <pad_line+0x1f8>
    2750:	8082                	ret
    2752:	00003517          	auipc	a0,0x3
    2756:	c8e50513          	addi	a0,a0,-882 # 53e0 <pad_line+0x1e8>
    275a:	8082                	ret
    275c:	00003517          	auipc	a0,0x3
    2760:	c4450513          	addi	a0,a0,-956 # 53a0 <pad_line+0x1a8>
    2764:	8082                	ret
    2766:	00003517          	auipc	a0,0x3
    276a:	c2a50513          	addi	a0,a0,-982 # 5390 <pad_line+0x198>
    276e:	8082                	ret
    2770:	00003517          	auipc	a0,0x3
    2774:	c0c50513          	addi	a0,a0,-1012 # 537c <pad_line+0x184>
    2778:	8082                	ret
    277a:	00003517          	auipc	a0,0x3
    277e:	bf650513          	addi	a0,a0,-1034 # 5370 <pad_line+0x178>
    2782:	8082                	ret
    2784:	00003517          	auipc	a0,0x3
    2788:	bd450513          	addi	a0,a0,-1068 # 5358 <pad_line+0x160>
    278c:	8082                	ret
    278e:	00003517          	auipc	a0,0x3
    2792:	bbe50513          	addi	a0,a0,-1090 # 534c <pad_line+0x154>
    2796:	8082                	ret
    2798:	00003517          	auipc	a0,0x3
    279c:	ba050513          	addi	a0,a0,-1120 # 5338 <pad_line+0x140>
    27a0:	8082                	ret
    27a2:	00003517          	auipc	a0,0x3
    27a6:	b8250513          	addi	a0,a0,-1150 # 5324 <pad_line+0x12c>
    27aa:	8082                	ret
    27ac:	00003517          	auipc	a0,0x3
    27b0:	b6450513          	addi	a0,a0,-1180 # 5310 <pad_line+0x118>
    27b4:	8082                	ret
    27b6:	00003517          	auipc	a0,0x3
    27ba:	b2e50513          	addi	a0,a0,-1234 # 52e4 <pad_line+0xec>
    27be:	8082                	ret
    27c0:	00003517          	auipc	a0,0x3
    27c4:	b1450513          	addi	a0,a0,-1260 # 52d4 <pad_line+0xdc>
    27c8:	8082                	ret
    27ca:	00003517          	auipc	a0,0x3
    27ce:	ada50513          	addi	a0,a0,-1318 # 52a4 <pad_line+0xac>
    27d2:	8082                	ret
    27d4:	00003517          	auipc	a0,0x3
    27d8:	abc50513          	addi	a0,a0,-1348 # 5290 <pad_line+0x98>
    27dc:	8082                	ret
    27de:	00003517          	auipc	a0,0x3
    27e2:	a9650513          	addi	a0,a0,-1386 # 5274 <pad_line+0x7c>
    27e6:	8082                	ret
    27e8:	00003517          	auipc	a0,0x3
    27ec:	a8050513          	addi	a0,a0,-1408 # 5268 <pad_line+0x70>
    27f0:	8082                	ret
    27f2:	00003517          	auipc	a0,0x3
    27f6:	a5e50513          	addi	a0,a0,-1442 # 5250 <pad_line+0x58>
    27fa:	8082                	ret
    27fc:	00003517          	auipc	a0,0x3
    2800:	a4450513          	addi	a0,a0,-1468 # 5240 <pad_line+0x48>
    2804:	8082                	ret
    2806:	00003517          	auipc	a0,0x3
    280a:	a1e50513          	addi	a0,a0,-1506 # 5224 <pad_line+0x2c>
    280e:	8082                	ret
    2810:	00003517          	auipc	a0,0x3
    2814:	10050513          	addi	a0,a0,256 # 5910 <pad_line+0x718>
    2818:	8082                	ret
    281a:	00003517          	auipc	a0,0x3
    281e:	9fe50513          	addi	a0,a0,-1538 # 5218 <pad_line+0x20>
    2822:	8082                	ret
    2824:	00003517          	auipc	a0,0x3
    2828:	98850513          	addi	a0,a0,-1656 # 51ac <sg_usi_config+0x74>
    282c:	b9c9                	j	24fe <_strerror_r+0x34>
    282e:	86aa                	mv	a3,a0
    2830:	b1d1                	j	24f4 <_strerror_r+0x2a>

00002832 <strerror>:
    2832:	85aa                	mv	a1,a0
    2834:	4681                	li	a3,0
    2836:	4601                	li	a2,0
    2838:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    283c:	b179                	j	24ca <_strerror_r>

0000283e <strerror_l>:
    283e:	85aa                	mv	a1,a0
    2840:	4681                	li	a3,0
    2842:	4601                	li	a2,0
    2844:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2848:	b149                	j	24ca <_strerror_r>
	...

0000284c <strlen>:
    284c:	00357793          	andi	a5,a0,3
    2850:	872a                	mv	a4,a0
    2852:	ef9d                	bnez	a5,2890 <strlen+0x44>
    2854:	7f7f86b7          	lui	a3,0x7f7f8
    2858:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    285c:	55fd                	li	a1,-1
    285e:	4310                	lw	a2,0(a4)
    2860:	0711                	addi	a4,a4,4
    2862:	00d677b3          	and	a5,a2,a3
    2866:	97b6                	add	a5,a5,a3
    2868:	8fd1                	or	a5,a5,a2
    286a:	8fd5                	or	a5,a5,a3
    286c:	feb789e3          	beq	a5,a1,285e <strlen+0x12>
    2870:	ffc74683          	lbu	a3,-4(a4)
    2874:	ffd74603          	lbu	a2,-3(a4)
    2878:	ffe74783          	lbu	a5,-2(a4)
    287c:	8f09                	sub	a4,a4,a0
    287e:	c695                	beqz	a3,28aa <strlen+0x5e>
    2880:	02060263          	beqz	a2,28a4 <strlen+0x58>
    2884:	00f03533          	snez	a0,a5
    2888:	953a                	add	a0,a0,a4
    288a:	1579                	addi	a0,a0,-2
    288c:	8082                	ret
    288e:	d2f9                	beqz	a3,2854 <strlen+0x8>
    2890:	00074783          	lbu	a5,0(a4)
    2894:	0705                	addi	a4,a4,1
    2896:	00377693          	andi	a3,a4,3
    289a:	fbf5                	bnez	a5,288e <strlen+0x42>
    289c:	8f09                	sub	a4,a4,a0
    289e:	fff70513          	addi	a0,a4,-1
    28a2:	8082                	ret
    28a4:	ffd70513          	addi	a0,a4,-3
    28a8:	8082                	ret
    28aa:	ffc70513          	addi	a0,a4,-4
    28ae:	8082                	ret
	...

000028b2 <_strtol_l.part.0>:
    28b2:	1111                	addi	sp,sp,-28
    28b4:	c82a                	sw	a0,16(sp)
    28b6:	cc22                	sw	s0,24(sp)
    28b8:	ca26                	sw	s1,20(sp)
    28ba:	872e                	mv	a4,a1
    28bc:	c42e                	sw	a1,8(sp)
    28be:	c032                	sw	a2,0(sp)
    28c0:	00002517          	auipc	a0,0x2
    28c4:	6b550513          	addi	a0,a0,1717 # 4f75 <_ctype_+0x1>
    28c8:	00074783          	lbu	a5,0(a4)
    28cc:	85ba                	mv	a1,a4
    28ce:	0705                	addi	a4,a4,1
    28d0:	00f50633          	add	a2,a0,a5
    28d4:	00064603          	lbu	a2,0(a2)
    28d8:	8a21                	andi	a2,a2,8
    28da:	f67d                	bnez	a2,28c8 <_strtol_l.part.0+0x16>
    28dc:	02d00613          	li	a2,45
    28e0:	0ec78063          	beq	a5,a2,29c0 <_strtol_l.part.0+0x10e>
    28e4:	02b00613          	li	a2,43
    28e8:	06c78063          	beq	a5,a2,2948 <_strtol_l.part.0+0x96>
    28ec:	800004b7          	lui	s1,0x80000
    28f0:	fff4c493          	not	s1,s1
    28f4:	c602                	sw	zero,12(sp)
    28f6:	c2bd                	beqz	a3,295c <_strtol_l.part.0+0xaa>
    28f8:	4641                	li	a2,16
    28fa:	8436                	mv	s0,a3
    28fc:	0cc68b63          	beq	a3,a2,29d2 <_strtol_l.part.0+0x120>
    2900:	0284f633          	remu	a2,s1,s0
    2904:	4581                	li	a1,0
    2906:	4501                	li	a0,0
    2908:	4325                	li	t1,9
    290a:	43e5                	li	t2,25
    290c:	0284d2b3          	divu	t0,s1,s0
    2910:	c232                	sw	a2,4(sp)
    2912:	fd078613          	addi	a2,a5,-48
    2916:	00c37863          	bgeu	t1,a2,2926 <_strtol_l.part.0+0x74>
    291a:	fbf78613          	addi	a2,a5,-65
    291e:	04c3e863          	bltu	t2,a2,296e <_strtol_l.part.0+0xbc>
    2922:	fc978613          	addi	a2,a5,-55
    2926:	04d65c63          	bge	a2,a3,297e <_strtol_l.part.0+0xcc>
    292a:	0405c063          	bltz	a1,296a <_strtol_l.part.0+0xb8>
    292e:	55fd                	li	a1,-1
    2930:	00a2e863          	bltu	t0,a0,2940 <_strtol_l.part.0+0x8e>
    2934:	06a28663          	beq	t0,a0,29a0 <_strtol_l.part.0+0xee>
    2938:	4585                	li	a1,1
    293a:	02850533          	mul	a0,a0,s0
    293e:	9532                	add	a0,a0,a2
    2940:	0705                	addi	a4,a4,1
    2942:	fff74783          	lbu	a5,-1(a4)
    2946:	b7f1                	j	2912 <_strtol_l.part.0+0x60>
    2948:	800004b7          	lui	s1,0x80000
    294c:	c602                	sw	zero,12(sp)
    294e:	00074783          	lbu	a5,0(a4)
    2952:	fff4c493          	not	s1,s1
    2956:	00258713          	addi	a4,a1,2
    295a:	fed9                	bnez	a3,28f8 <_strtol_l.part.0+0x46>
    295c:	03000693          	li	a3,48
    2960:	08d78d63          	beq	a5,a3,29fa <_strtol_l.part.0+0x148>
    2964:	4429                	li	s0,10
    2966:	46a9                	li	a3,10
    2968:	bf61                	j	2900 <_strtol_l.part.0+0x4e>
    296a:	55fd                	li	a1,-1
    296c:	bfd1                	j	2940 <_strtol_l.part.0+0x8e>
    296e:	f9f78613          	addi	a2,a5,-97
    2972:	00c3e663          	bltu	t2,a2,297e <_strtol_l.part.0+0xcc>
    2976:	fa978613          	addi	a2,a5,-87
    297a:	fad648e3          	blt	a2,a3,292a <_strtol_l.part.0+0x78>
    297e:	0205c563          	bltz	a1,29a8 <_strtol_l.part.0+0xf6>
    2982:	47b2                	lw	a5,12(sp)
    2984:	c399                	beqz	a5,298a <_strtol_l.part.0+0xd8>
    2986:	40a00533          	neg	a0,a0
    298a:	4782                	lw	a5,0(sp)
    298c:	c791                	beqz	a5,2998 <_strtol_l.part.0+0xe6>
    298e:	08059163          	bnez	a1,2a10 <_strtol_l.part.0+0x15e>
    2992:	4782                	lw	a5,0(sp)
    2994:	4722                	lw	a4,8(sp)
    2996:	c398                	sw	a4,0(a5)
    2998:	4462                	lw	s0,24(sp)
    299a:	44d2                	lw	s1,20(sp)
    299c:	0171                	addi	sp,sp,28
    299e:	8082                	ret
    29a0:	4792                	lw	a5,4(sp)
    29a2:	f8c7cfe3          	blt	a5,a2,2940 <_strtol_l.part.0+0x8e>
    29a6:	bf49                	j	2938 <_strtol_l.part.0+0x86>
    29a8:	46c2                	lw	a3,16(sp)
    29aa:	02200793          	li	a5,34
    29ae:	8526                	mv	a0,s1
    29b0:	c29c                	sw	a5,0(a3)
    29b2:	4782                	lw	a5,0(sp)
    29b4:	d3f5                	beqz	a5,2998 <_strtol_l.part.0+0xe6>
    29b6:	fff70793          	addi	a5,a4,-1
    29ba:	c43e                	sw	a5,8(sp)
    29bc:	8526                	mv	a0,s1
    29be:	bfd1                	j	2992 <_strtol_l.part.0+0xe0>
    29c0:	4605                	li	a2,1
    29c2:	00074783          	lbu	a5,0(a4)
    29c6:	800004b7          	lui	s1,0x80000
    29ca:	00258713          	addi	a4,a1,2
    29ce:	c632                	sw	a2,12(sp)
    29d0:	b71d                	j	28f6 <_strtol_l.part.0+0x44>
    29d2:	03000613          	li	a2,48
    29d6:	00c79a63          	bne	a5,a2,29ea <_strtol_l.part.0+0x138>
    29da:	00074603          	lbu	a2,0(a4)
    29de:	05800593          	li	a1,88
    29e2:	0df67613          	andi	a2,a2,223
    29e6:	00b60463          	beq	a2,a1,29ee <_strtol_l.part.0+0x13c>
    29ea:	4441                	li	s0,16
    29ec:	bf11                	j	2900 <_strtol_l.part.0+0x4e>
    29ee:	00174783          	lbu	a5,1(a4)
    29f2:	4441                	li	s0,16
    29f4:	0709                	addi	a4,a4,2
    29f6:	46c1                	li	a3,16
    29f8:	b721                	j	2900 <_strtol_l.part.0+0x4e>
    29fa:	00074683          	lbu	a3,0(a4)
    29fe:	05800613          	li	a2,88
    2a02:	0df6f693          	andi	a3,a3,223
    2a06:	fec684e3          	beq	a3,a2,29ee <_strtol_l.part.0+0x13c>
    2a0a:	4421                	li	s0,8
    2a0c:	46a1                	li	a3,8
    2a0e:	bdcd                	j	2900 <_strtol_l.part.0+0x4e>
    2a10:	84aa                	mv	s1,a0
    2a12:	b755                	j	29b6 <_strtol_l.part.0+0x104>

00002a14 <_strtol_r>:
    2a14:	4705                	li	a4,1
    2a16:	00e68763          	beq	a3,a4,2a24 <_strtol_r+0x10>
    2a1a:	02400713          	li	a4,36
    2a1e:	00d76363          	bltu	a4,a3,2a24 <_strtol_r+0x10>
    2a22:	bd41                	j	28b2 <_strtol_l.part.0>
    2a24:	1151                	addi	sp,sp,-12
    2a26:	c406                	sw	ra,8(sp)
    2a28:	2401                	jal	2c28 <__errno>
    2a2a:	40a2                	lw	ra,8(sp)
    2a2c:	47d9                	li	a5,22
    2a2e:	c11c                	sw	a5,0(a0)
    2a30:	4501                	li	a0,0
    2a32:	0131                	addi	sp,sp,12
    2a34:	8082                	ret

00002a36 <strtol_l>:
    2a36:	4785                	li	a5,1
    2a38:	00f60c63          	beq	a2,a5,2a50 <strtol_l+0x1a>
    2a3c:	02400793          	li	a5,36
    2a40:	00c7e863          	bltu	a5,a2,2a50 <strtol_l+0x1a>
    2a44:	86b2                	mv	a3,a2
    2a46:	862e                	mv	a2,a1
    2a48:	85aa                	mv	a1,a0
    2a4a:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2a4e:	b595                	j	28b2 <_strtol_l.part.0>
    2a50:	1151                	addi	sp,sp,-12
    2a52:	c406                	sw	ra,8(sp)
    2a54:	2ad1                	jal	2c28 <__errno>
    2a56:	40a2                	lw	ra,8(sp)
    2a58:	47d9                	li	a5,22
    2a5a:	c11c                	sw	a5,0(a0)
    2a5c:	4501                	li	a0,0
    2a5e:	0131                	addi	sp,sp,12
    2a60:	8082                	ret

00002a62 <strtol>:
    2a62:	4785                	li	a5,1
    2a64:	00f60c63          	beq	a2,a5,2a7c <strtol+0x1a>
    2a68:	02400793          	li	a5,36
    2a6c:	00c7e863          	bltu	a5,a2,2a7c <strtol+0x1a>
    2a70:	86b2                	mv	a3,a2
    2a72:	862e                	mv	a2,a1
    2a74:	85aa                	mv	a1,a0
    2a76:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2a7a:	bd25                	j	28b2 <_strtol_l.part.0>
    2a7c:	1151                	addi	sp,sp,-12
    2a7e:	c406                	sw	ra,8(sp)
    2a80:	2265                	jal	2c28 <__errno>
    2a82:	40a2                	lw	ra,8(sp)
    2a84:	47d9                	li	a5,22
    2a86:	c11c                	sw	a5,0(a0)
    2a88:	4501                	li	a0,0
    2a8a:	0131                	addi	sp,sp,12
    2a8c:	8082                	ret

00002a8e <_strtoul_l.constprop.0>:
    2a8e:	1121                	addi	sp,sp,-24
    2a90:	ca22                	sw	s0,20(sp)
    2a92:	c826                	sw	s1,16(sp)
    2a94:	c62a                	sw	a0,12(sp)
    2a96:	c032                	sw	a2,0(sp)
    2a98:	872e                	mv	a4,a1
    2a9a:	00002317          	auipc	t1,0x2
    2a9e:	4db30313          	addi	t1,t1,1243 # 4f75 <_ctype_+0x1>
    2aa2:	00074783          	lbu	a5,0(a4)
    2aa6:	853a                	mv	a0,a4
    2aa8:	0705                	addi	a4,a4,1
    2aaa:	00f30633          	add	a2,t1,a5
    2aae:	00064603          	lbu	a2,0(a2)
    2ab2:	8a21                	andi	a2,a2,8
    2ab4:	f67d                	bnez	a2,2aa2 <_strtoul_l.constprop.0+0x14>
    2ab6:	02d00613          	li	a2,45
    2aba:	0cc78c63          	beq	a5,a2,2b92 <_strtoul_l.constprop.0+0x104>
    2abe:	02b00613          	li	a2,43
    2ac2:	c402                	sw	zero,8(sp)
    2ac4:	06c78a63          	beq	a5,a2,2b38 <_strtoul_l.constprop.0+0xaa>
    2ac8:	00068d63          	beqz	a3,2ae2 <_strtoul_l.constprop.0+0x54>
    2acc:	4641                	li	a2,16
    2ace:	0cc68963          	beq	a3,a2,2ba0 <_strtoul_l.constprop.0+0x112>
    2ad2:	567d                	li	a2,-1
    2ad4:	02d653b3          	divu	t2,a2,a3
    2ad8:	84b6                	mv	s1,a3
    2ada:	02d67633          	remu	a2,a2,a3
    2ade:	c232                	sw	a2,4(sp)
    2ae0:	a829                	j	2afa <_strtoul_l.constprop.0+0x6c>
    2ae2:	03000693          	li	a3,48
    2ae6:	0ed78463          	beq	a5,a3,2bce <_strtoul_l.constprop.0+0x140>
    2aea:	4695                	li	a3,5
    2aec:	1999a3b7          	lui	t2,0x1999a
    2af0:	c236                	sw	a3,4(sp)
    2af2:	99938393          	addi	t2,t2,-1639 # 19999999 <__min_heap_size+0x19979999>
    2af6:	44a9                	li	s1,10
    2af8:	46a9                	li	a3,10
    2afa:	4301                	li	t1,0
    2afc:	4501                	li	a0,0
    2afe:	42a5                	li	t0,9
    2b00:	4465                	li	s0,25
    2b02:	fd078613          	addi	a2,a5,-48
    2b06:	00c2f863          	bgeu	t0,a2,2b16 <_strtoul_l.constprop.0+0x88>
    2b0a:	fbf78613          	addi	a2,a5,-65
    2b0e:	02c46c63          	bltu	s0,a2,2b46 <_strtoul_l.constprop.0+0xb8>
    2b12:	fc978613          	addi	a2,a5,-55
    2b16:	04d65063          	bge	a2,a3,2b56 <_strtoul_l.constprop.0+0xc8>
    2b1a:	02034463          	bltz	t1,2b42 <_strtoul_l.constprop.0+0xb4>
    2b1e:	537d                	li	t1,-1
    2b20:	00a3e863          	bltu	t2,a0,2b30 <_strtoul_l.constprop.0+0xa2>
    2b24:	04750963          	beq	a0,t2,2b76 <_strtoul_l.constprop.0+0xe8>
    2b28:	02950533          	mul	a0,a0,s1
    2b2c:	4305                	li	t1,1
    2b2e:	9532                	add	a0,a0,a2
    2b30:	0705                	addi	a4,a4,1
    2b32:	fff74783          	lbu	a5,-1(a4)
    2b36:	b7f1                	j	2b02 <_strtoul_l.constprop.0+0x74>
    2b38:	00074783          	lbu	a5,0(a4)
    2b3c:	00250713          	addi	a4,a0,2
    2b40:	b761                	j	2ac8 <_strtoul_l.constprop.0+0x3a>
    2b42:	537d                	li	t1,-1
    2b44:	b7f5                	j	2b30 <_strtoul_l.constprop.0+0xa2>
    2b46:	f9f78613          	addi	a2,a5,-97
    2b4a:	00c46663          	bltu	s0,a2,2b56 <_strtoul_l.constprop.0+0xc8>
    2b4e:	fa978613          	addi	a2,a5,-87
    2b52:	fcd644e3          	blt	a2,a3,2b1a <_strtoul_l.constprop.0+0x8c>
    2b56:	02034463          	bltz	t1,2b7e <_strtoul_l.constprop.0+0xf0>
    2b5a:	47a2                	lw	a5,8(sp)
    2b5c:	c399                	beqz	a5,2b62 <_strtoul_l.constprop.0+0xd4>
    2b5e:	40a00533          	neg	a0,a0
    2b62:	4782                	lw	a5,0(sp)
    2b64:	c789                	beqz	a5,2b6e <_strtoul_l.constprop.0+0xe0>
    2b66:	02031363          	bnez	t1,2b8c <_strtoul_l.constprop.0+0xfe>
    2b6a:	4782                	lw	a5,0(sp)
    2b6c:	c38c                	sw	a1,0(a5)
    2b6e:	4452                	lw	s0,20(sp)
    2b70:	44c2                	lw	s1,16(sp)
    2b72:	0161                	addi	sp,sp,24
    2b74:	8082                	ret
    2b76:	4792                	lw	a5,4(sp)
    2b78:	fac7cce3          	blt	a5,a2,2b30 <_strtoul_l.constprop.0+0xa2>
    2b7c:	b775                	j	2b28 <_strtoul_l.constprop.0+0x9a>
    2b7e:	46b2                	lw	a3,12(sp)
    2b80:	02200793          	li	a5,34
    2b84:	557d                	li	a0,-1
    2b86:	c29c                	sw	a5,0(a3)
    2b88:	4782                	lw	a5,0(sp)
    2b8a:	d3f5                	beqz	a5,2b6e <_strtoul_l.constprop.0+0xe0>
    2b8c:	fff70593          	addi	a1,a4,-1
    2b90:	bfe9                	j	2b6a <_strtoul_l.constprop.0+0xdc>
    2b92:	00074783          	lbu	a5,0(a4)
    2b96:	4705                	li	a4,1
    2b98:	c43a                	sw	a4,8(sp)
    2b9a:	00250713          	addi	a4,a0,2
    2b9e:	b72d                	j	2ac8 <_strtoul_l.constprop.0+0x3a>
    2ba0:	03000613          	li	a2,48
    2ba4:	04c79c63          	bne	a5,a2,2bfc <_strtoul_l.constprop.0+0x16e>
    2ba8:	00074603          	lbu	a2,0(a4)
    2bac:	05800513          	li	a0,88
    2bb0:	0df67613          	andi	a2,a2,223
    2bb4:	02a61d63          	bne	a2,a0,2bee <_strtoul_l.constprop.0+0x160>
    2bb8:	46bd                	li	a3,15
    2bba:	100003b7          	lui	t2,0x10000
    2bbe:	00174783          	lbu	a5,1(a4)
    2bc2:	c236                	sw	a3,4(sp)
    2bc4:	0709                	addi	a4,a4,2
    2bc6:	13fd                	addi	t2,t2,-1
    2bc8:	44c1                	li	s1,16
    2bca:	46c1                	li	a3,16
    2bcc:	b73d                	j	2afa <_strtoul_l.constprop.0+0x6c>
    2bce:	00074683          	lbu	a3,0(a4)
    2bd2:	05800613          	li	a2,88
    2bd6:	0df6f693          	andi	a3,a3,223
    2bda:	fcc68fe3          	beq	a3,a2,2bb8 <_strtoul_l.constprop.0+0x12a>
    2bde:	469d                	li	a3,7
    2be0:	200003b7          	lui	t2,0x20000
    2be4:	c236                	sw	a3,4(sp)
    2be6:	13fd                	addi	t2,t2,-1
    2be8:	44a1                	li	s1,8
    2bea:	46a1                	li	a3,8
    2bec:	b739                	j	2afa <_strtoul_l.constprop.0+0x6c>
    2bee:	53fd                	li	t2,-1
    2bf0:	463d                	li	a2,15
    2bf2:	02d3d3b3          	divu	t2,t2,a3
    2bf6:	44c1                	li	s1,16
    2bf8:	c232                	sw	a2,4(sp)
    2bfa:	b701                	j	2afa <_strtoul_l.constprop.0+0x6c>
    2bfc:	463d                	li	a2,15
    2bfe:	100003b7          	lui	t2,0x10000
    2c02:	c232                	sw	a2,4(sp)
    2c04:	13fd                	addi	t2,t2,-1
    2c06:	44c1                	li	s1,16
    2c08:	bdcd                	j	2afa <_strtoul_l.constprop.0+0x6c>

00002c0a <_strtoul_r>:
    2c0a:	b551                	j	2a8e <_strtoul_l.constprop.0>

00002c0c <strtoul_l>:
    2c0c:	86b2                	mv	a3,a2
    2c0e:	862e                	mv	a2,a1
    2c10:	85aa                	mv	a1,a0
    2c12:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2c16:	bda5                	j	2a8e <_strtoul_l.constprop.0>

00002c18 <strtoul>:
    2c18:	86b2                	mv	a3,a2
    2c1a:	862e                	mv	a2,a1
    2c1c:	85aa                	mv	a1,a0
    2c1e:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2c22:	b5b5                	j	2a8e <_strtoul_l.constprop.0>

00002c24 <_user_strerror>:
    2c24:	4501                	li	a0,0
    2c26:	8082                	ret

00002c28 <__errno>:
    2c28:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2c2c:	8082                	ret

00002c2e <board_init>:

extern int clock_timer_init(void);
extern int clock_timer_start(void);

void board_init(void)
{
    2c2e:	1151                	addi	sp,sp,-12
    2c30:	c406                	sw	ra,8(sp)
    int32_t ret = 0;
    /* init the console*/
    clock_timer_init();
    2c32:	679000ef          	jal	ra,3aaa <clock_timer_init>
    clock_timer_start();
    2c36:	6ef000ef          	jal	ra,3b24 <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2c3a:	4581                	li	a1,0
    2c3c:	4501                	li	a0,0
    2c3e:	21f000ef          	jal	ra,365c <csi_usart_initialize>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2c42:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2c44:	02a1a423          	sw	a0,40(gp) # 20000510 <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2c48:	65f1                	lui	a1,0x1c
    2c4a:	478d                	li	a5,3
    2c4c:	4701                	li	a4,0
    2c4e:	4681                	li	a3,0
    2c50:	4601                	li	a2,0
    2c52:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x168e8>
}
    2c56:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2c58:	2070006f          	j	365e <csi_usart_config>

00002c5c <drv_irq_enable>:
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    CLIC->INTIE[IRQn] |= CLIC_INTIE_IE_Msk;
    2c5c:	e000e7b7          	lui	a5,0xe000e
    2c60:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    2c64:	953e                	add	a0,a0,a5
    2c66:	40054783          	lbu	a5,1024(a0)
    2c6a:	0017e793          	ori	a5,a5,1
    2c6e:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2c72:	8082                	ret

00002c74 <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2c74:	200027b7          	lui	a5,0x20002
    2c78:	050a                	slli	a0,a0,0x2
    2c7a:	aec78793          	addi	a5,a5,-1300 # 20001aec <g_irqvector>
    2c7e:	97aa                	add	a5,a5,a0
    2c80:	c38c                	sw	a1,0(a5)
}
    2c82:	8082                	ret

00002c84 <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2c84:	457c                	lw	a5,76(a0)
    2c86:	7741                	lui	a4,0xffff0
    2c88:	177d                	addi	a4,a4,-1
    2c8a:	8ff9                	and	a5,a5,a4
    2c8c:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2c8e:	457c                	lw	a5,76(a0)
    2c90:	cff7f793          	andi	a5,a5,-769
    2c94:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2c96:	47bd                	li	a5,15
    2c98:	00b7f963          	bgeu	a5,a1,2caa <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2c9c:	457c                	lw	a5,76(a0)
    2c9e:	6741                	lui	a4,0x10
    2ca0:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0xa9e8>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2ca4:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2ca6:	c57c                	sw	a5,76(a0)
    }
}
    2ca8:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2caa:	47ad                	li	a5,11
    2cac:	00b7f763          	bgeu	a5,a1,2cba <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2cb0:	6741                	lui	a4,0x10
    2cb2:	457c                	lw	a5,76(a0)
    2cb4:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0xa8e8>
    2cb8:	b7f5                	j	2ca4 <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2cba:	478d                	li	a5,3
    2cbc:	00b7f763          	bgeu	a5,a1,2cca <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2cc0:	6741                	lui	a4,0x10
    2cc2:	457c                	lw	a5,76(a0)
    2cc4:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0xa7e8>
    2cc8:	bff1                	j	2ca4 <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2cca:	457c                	lw	a5,76(a0)
    2ccc:	1007e793          	ori	a5,a5,256
    2cd0:	bfd9                	j	2ca6 <wj_usi_set_rxfifo_th+0x22>

00002cd2 <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2cd2:	200017b7          	lui	a5,0x20001
    2cd6:	00351713          	slli	a4,a0,0x3
    2cda:	71c78793          	addi	a5,a5,1820 # 2000171c <usi_instance>
    2cde:	97ba                	add	a5,a5,a4
    2ce0:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2ce2:	4705                	li	a4,1
    2ce4:	43dc                	lw	a5,4(a5)
    2ce6:	8b8d                	andi	a5,a5,3
    2ce8:	00e78863          	beq	a5,a4,2cf8 <wj_usi_irqhandler+0x26>
    2cec:	4709                	li	a4,2
    2cee:	00e78663          	beq	a5,a4,2cfa <wj_usi_irqhandler+0x28>
    2cf2:	00079563          	bnez	a5,2cfc <wj_usi_irqhandler+0x2a>
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2cf6:	af01                	j	3406 <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2cf8:	a0a1                	j	2d40 <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2cfa:	acfd                	j	2ff8 <wj_usi_spi_irqhandler>
            break;

        default:
            return;
    }
}
    2cfc:	8082                	ret

00002cfe <drv_usi_initialize>:

int32_t drv_usi_initialize(int32_t idx)
{
    2cfe:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2d00:	0050                	addi	a2,sp,4
    2d02:	858a                	mv	a1,sp
{
    2d04:	c622                	sw	s0,12(sp)
    2d06:	c806                	sw	ra,16(sp)
    2d08:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2d0a:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2d0c:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2d0e:	19d000ef          	jal	ra,36aa <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2d12:	4789                	li	a5,2
    2d14:	02a7e163          	bltu	a5,a0,2d36 <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2d18:	4782                	lw	a5,0(sp)
    2d1a:	20001537          	lui	a0,0x20001
    2d1e:	040e                	slli	s0,s0,0x3
    2d20:	71c50513          	addi	a0,a0,1820 # 2000171c <usi_instance>
    2d24:	9522                	add	a0,a0,s0
    2d26:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2d28:	4792                	lw	a5,4(sp)
    2d2a:	c15c                	sw	a5,4(a0)

    return 0;
    2d2c:	4501                	li	a0,0
}
    2d2e:	40c2                	lw	ra,16(sp)
    2d30:	4432                	lw	s0,12(sp)
    2d32:	0151                	addi	sp,sp,20
    2d34:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2d36:	81180537          	lui	a0,0x81180
    2d3a:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2d3e:	bfc5                	j	2d2e <drv_usi_initialize+0x30>

00002d40 <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d40:	03000713          	li	a4,48
    2d44:	02e50733          	mul	a4,a0,a4
    2d48:	200017b7          	lui	a5,0x20001
    2d4c:	73478693          	addi	a3,a5,1844 # 20001734 <iic_instance>
{
    2d50:	1121                	addi	sp,sp,-24
    2d52:	c822                	sw	s0,16(sp)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d54:	6599                	lui	a1,0x6
{
    2d56:	c626                	sw	s1,12(sp)
    2d58:	ca06                	sw	ra,20(sp)
    2d5a:	84aa                	mv	s1,a0
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d5c:	73478793          	addi	a5,a5,1844
    2d60:	9736                	add	a4,a4,a3
    2d62:	4300                	lw	s0,0(a4)
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2d64:	4874                	lw	a3,84(s0)
    2d66:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d6a:	8df5                	and	a1,a1,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2d6c:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d70:	c19d                	beqz	a1,2d96 <wj_usi_i2c_irqhandler+0x56>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2d72:	4691                	li	a3,4
    2d74:	d714                	sw	a3,40(a4)
        addr->USI_EN = 0;
    2d76:	00042023          	sw	zero,0(s0) # 80000 <__min_heap_size+0x60000>
        addr->USI_INTR_UNMASK = 0;
    2d7a:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2d7e:	4718                	lw	a4,8(a4)
        addr->USI_INTR_EN = 0;
    2d80:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2d84:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2d88:	cf11                	beqz	a4,2da4 <wj_usi_i2c_irqhandler+0x64>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2d8a:	4442                	lw	s0,16(sp)
    2d8c:	40d2                	lw	ra,20(sp)
    2d8e:	44b2                	lw	s1,12(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d90:	459d                	li	a1,7
}
    2d92:	0161                	addi	sp,sp,24
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d94:	8702                	jr	a4
    switch (iic_priv->status) {
    2d96:	5710                	lw	a2,40(a4)
    2d98:	4505                	li	a0,1
    2d9a:	02a60663          	beq	a2,a0,2dc6 <wj_usi_i2c_irqhandler+0x86>
    2d9e:	4589                	li	a1,2
    2da0:	10b60263          	beq	a2,a1,2ea4 <wj_usi_i2c_irqhandler+0x164>
            if (iic_priv->cb_event) {
    2da4:	03000713          	li	a4,48
    2da8:	02e48733          	mul	a4,s1,a4
            addr->USI_INTR_CLR = intr_state;
    2dac:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2db0:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2db4:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2db8:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2dbc:	97ba                	add	a5,a5,a4
    2dbe:	479c                	lw	a5,8(a5)
    2dc0:	c7e1                	beqz	a5,2e88 <wj_usi_i2c_irqhandler+0x148>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2dc2:	4599                	li	a1,6
    2dc4:	a2d9                	j	2f8a <wj_usi_i2c_irqhandler+0x24a>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2dc6:	0026f513          	andi	a0,a3,2
    uint8_t emptyfifo = 0;
    2dca:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2dcc:	cd05                	beqz	a0,2e04 <wj_usi_i2c_irqhandler+0xc4>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2dce:	5350                	lw	a2,36(a4)
    2dd0:	4b08                	lw	a0,16(a4)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2dd2:	4458                	lw	a4,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2dd4:	8d11                	sub	a0,a0,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2dd6:	8321                	srli	a4,a4,0x8
    2dd8:	4641                	li	a2,16
    2dda:	8b7d                	andi	a4,a4,31
    2ddc:	40e60733          	sub	a4,a2,a4
    2de0:	0ff57613          	andi	a2,a0,255
    2de4:	00a77963          	bgeu	a4,a0,2df6 <wj_usi_i2c_irqhandler+0xb6>
    2de8:	4458                	lw	a4,12(s0)
    2dea:	4641                	li	a2,16
    2dec:	8321                	srli	a4,a4,0x8
    2dee:	8b7d                	andi	a4,a4,31
    2df0:	8e19                	sub	a2,a2,a4
    2df2:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2df6:	03000713          	li	a4,48
    2dfa:	02e48733          	mul	a4,s1,a4
    2dfe:	973e                	add	a4,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2e00:	08c5e963          	bltu	a1,a2,2e92 <wj_usi_i2c_irqhandler+0x152>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2e04:	03000713          	li	a4,48
    2e08:	02e48733          	mul	a4,s1,a4
    2e0c:	973e                	add	a4,a4,a5
    2e0e:	534c                	lw	a1,36(a4)
    2e10:	4b18                	lw	a4,16(a4)
    2e12:	00e59963          	bne	a1,a4,2e24 <wj_usi_i2c_irqhandler+0xe4>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2e16:	5418                	lw	a4,40(s0)
    2e18:	00276713          	ori	a4,a4,2
    2e1c:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2e1e:	4838                	lw	a4,80(s0)
    2e20:	9b75                	andi	a4,a4,-3
    2e22:	c838                	sw	a4,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2e24:	6705                	lui	a4,0x1
    2e26:	8f75                	and	a4,a4,a3
    2e28:	cb0d                	beqz	a4,2e5a <wj_usi_i2c_irqhandler+0x11a>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2e2a:	03000713          	li	a4,48
    2e2e:	02e48733          	mul	a4,s1,a4
    2e32:	4595                	li	a1,5
    2e34:	973e                	add	a4,a4,a5
    2e36:	d70c                	sw	a1,40(a4)
        if (iic_priv->cb_event) {
    2e38:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    2e3a:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e3e:	cf11                	beqz	a4,2e5a <wj_usi_i2c_irqhandler+0x11a>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2e40:	4581                	li	a1,0
    2e42:	8526                	mv	a0,s1
    2e44:	c432                	sw	a2,8(sp)
    2e46:	c21a                	sw	t1,4(sp)
    2e48:	c036                	sw	a3,0(sp)
    2e4a:	9702                	jalr	a4
    2e4c:	4622                	lw	a2,8(sp)
    2e4e:	4312                	lw	t1,4(sp)
    2e50:	4682                	lw	a3,0(sp)
    2e52:	200017b7          	lui	a5,0x20001
    2e56:	73478793          	addi	a5,a5,1844 # 20001734 <iic_instance>
    iic_priv->tx_cnt += emptyfifo;
    2e5a:	03000713          	li	a4,48
    2e5e:	02e48733          	mul	a4,s1,a4
    if (intr_stat & USI_INT_TX_WERR) {
    2e62:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2e64:	97ba                	add	a5,a5,a4
    2e66:	53d8                	lw	a4,36(a5)
    2e68:	963a                	add	a2,a2,a4
    2e6a:	d3d0                	sw	a2,36(a5)
    if (intr_stat & USI_INT_TX_WERR) {
    2e6c:	ce81                	beqz	a3,2e84 <wj_usi_i2c_irqhandler+0x144>
        iic_priv->status = IIC_STATE_ERROR;
    2e6e:	471d                	li	a4,7
    2e70:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    2e72:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2e74:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e78:	c791                	beqz	a5,2e84 <wj_usi_i2c_irqhandler+0x144>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2e7a:	459d                	li	a1,7
    2e7c:	8526                	mv	a0,s1
    2e7e:	c01a                	sw	t1,0(sp)
    2e80:	9782                	jalr	a5
    2e82:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2e84:	06642023          	sw	t1,96(s0)
}
    2e88:	40d2                	lw	ra,20(sp)
    2e8a:	4442                	lw	s0,16(sp)
    2e8c:	44b2                	lw	s1,12(sp)
    2e8e:	0161                	addi	sp,sp,24
    2e90:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e92:	4f08                	lw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2e94:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2e96:	00054283          	lbu	t0,0(a0)
            iic_priv->tx_buf++;
    2e9a:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2e9c:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2ea0:	cf08                	sw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2ea2:	bfb9                	j	2e00 <wj_usi_i2c_irqhandler+0xc0>
    if (intr_stat & USI_INT_RX_THOLD) {
    2ea4:	0206f613          	andi	a2,a3,32
    2ea8:	ca25                	beqz	a2,2f18 <wj_usi_i2c_irqhandler+0x1d8>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2eaa:	02000613          	li	a2,32
    2eae:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2eb0:	4450                	lw	a2,12(s0)
    2eb2:	8241                	srli	a2,a2,0x10
    2eb4:	01f67513          	andi	a0,a2,31
        for (i = 0; i < rx_num; i++) {
    2eb8:	4601                	li	a2,0
    2eba:	0ca66e63          	bltu	a2,a0,2f96 <wj_usi_i2c_irqhandler+0x256>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ebe:	03000613          	li	a2,48
    2ec2:	02c48633          	mul	a2,s1,a2
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2ec6:	4458                	lw	a4,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ec8:	4585                	li	a1,1
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2eca:	8321                	srli	a4,a4,0x8
    2ecc:	8b7d                	andi	a4,a4,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ece:	963e                	add	a2,a2,a5
    2ed0:	5208                	lw	a0,32(a2)
    2ed2:	4641                	li	a2,16
    2ed4:	8e19                	sub	a2,a2,a4
    2ed6:	00a67663          	bgeu	a2,a0,2ee2 <wj_usi_i2c_irqhandler+0x1a2>
    2eda:	45c1                	li	a1,16
    2edc:	8d99                	sub	a1,a1,a4
    2ede:	0ff5f593          	andi	a1,a1,255
        if (iic_priv->rx_clk == 0) {
    2ee2:	03000713          	li	a4,48
    2ee6:	02e48733          	mul	a4,s1,a4
    2eea:	973e                	add	a4,a4,a5
    2eec:	5310                	lw	a2,32(a4)
    2eee:	ce61                	beqz	a2,2fc6 <wj_usi_i2c_irqhandler+0x286>
        for (i = 0; i < rxfifo; i++) {
    2ef0:	4601                	li	a2,0
            addr->USI_TX_RX_FIFO = 0x100;
    2ef2:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    2ef6:	0ab61f63          	bne	a2,a1,2fb4 <wj_usi_i2c_irqhandler+0x274>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    2efa:	8522                	mv	a0,s0
    2efc:	c236                	sw	a3,4(sp)
    2efe:	c02e                	sw	a1,0(sp)
    2f00:	3351                	jal	2c84 <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    2f02:	4582                	lw	a1,0(sp)
    2f04:	200017b7          	lui	a5,0x20001
    2f08:	4692                	lw	a3,4(sp)
    2f0a:	73478793          	addi	a5,a5,1844 # 20001734 <iic_instance>
    2f0e:	e589                	bnez	a1,2f18 <wj_usi_i2c_irqhandler+0x1d8>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    2f10:	4838                	lw	a4,80(s0)
    2f12:	6605                	lui	a2,0x1
    2f14:	8f51                	or	a4,a4,a2
    2f16:	c838                	sw	a4,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    2f18:	03000713          	li	a4,48
    2f1c:	02e48733          	mul	a4,s1,a4
    2f20:	973e                	add	a4,a4,a5
    2f22:	4f50                	lw	a2,28(a4)
    2f24:	4758                	lw	a4,12(a4)
    2f26:	00e61a63          	bne	a2,a4,2f3a <wj_usi_i2c_irqhandler+0x1fa>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2f2a:	5418                	lw	a4,40(s0)
    2f2c:	00276713          	ori	a4,a4,2
    2f30:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    2f32:	4838                	lw	a4,80(s0)
    2f34:	fdf77713          	andi	a4,a4,-33
    2f38:	c838                	sw	a4,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    2f3a:	3006f713          	andi	a4,a3,768
    2f3e:	c70d                	beqz	a4,2f68 <wj_usi_i2c_irqhandler+0x228>
        iic_priv->status = IIC_STATE_ERROR;
    2f40:	03000713          	li	a4,48
    2f44:	02e48733          	mul	a4,s1,a4
    2f48:	461d                	li	a2,7
    2f4a:	973e                	add	a4,a4,a5
    2f4c:	d710                	sw	a2,40(a4)
        if (iic_priv->cb_event) {
    2f4e:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    2f50:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f54:	cb11                	beqz	a4,2f68 <wj_usi_i2c_irqhandler+0x228>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2f56:	459d                	li	a1,7
    2f58:	8526                	mv	a0,s1
    2f5a:	c036                	sw	a3,0(sp)
    2f5c:	9702                	jalr	a4
    2f5e:	4682                	lw	a3,0(sp)
    2f60:	200017b7          	lui	a5,0x20001
    2f64:	73478793          	addi	a5,a5,1844 # 20001734 <iic_instance>
    if (intr_stat & USI_INT_I2C_STOP) {
    2f68:	6705                	lui	a4,0x1
    2f6a:	8ef9                	and	a3,a3,a4
    2f6c:	de91                	beqz	a3,2e88 <wj_usi_i2c_irqhandler+0x148>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    2f6e:	d038                	sw	a4,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f70:	03000713          	li	a4,48
    2f74:	02e48733          	mul	a4,s1,a4
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f78:	4581                	li	a1,0
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f7a:	97ba                	add	a5,a5,a4
    2f7c:	4719                	li	a4,6
    2f7e:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    2f80:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2f82:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f86:	f00781e3          	beqz	a5,2e88 <wj_usi_i2c_irqhandler+0x148>
}
    2f8a:	4442                	lw	s0,16(sp)
    2f8c:	40d2                	lw	ra,20(sp)
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2f8e:	8526                	mv	a0,s1
}
    2f90:	44b2                	lw	s1,12(sp)
    2f92:	0161                	addi	sp,sp,24
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2f94:	8782                	jr	a5
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2f96:	00842303          	lw	t1,8(s0)
    2f9a:	4b4c                	lw	a1,20(a4)
        for (i = 0; i < rx_num; i++) {
    2f9c:	0605                	addi	a2,a2,1
    2f9e:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2fa2:	00658023          	sb	t1,0(a1) # 6000 <__ctor_end__+0x6e8>
            iic_priv->rx_buf++;
    2fa6:	4b4c                	lw	a1,20(a4)
    2fa8:	0585                	addi	a1,a1,1
    2faa:	cb4c                	sw	a1,20(a4)
            iic_priv->rx_cnt++;;
    2fac:	4f4c                	lw	a1,28(a4)
    2fae:	0585                	addi	a1,a1,1
    2fb0:	cf4c                	sw	a1,28(a4)
        for (i = 0; i < rx_num; i++) {
    2fb2:	b721                	j	2eba <wj_usi_i2c_irqhandler+0x17a>
            addr->USI_TX_RX_FIFO = 0x100;
    2fb4:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    2fb8:	5308                	lw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    2fba:	0605                	addi	a2,a2,1
    2fbc:	0ff67613          	andi	a2,a2,255
            iic_priv->rx_clk--;
    2fc0:	157d                	addi	a0,a0,-1
    2fc2:	d308                	sw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    2fc4:	bf0d                	j	2ef6 <wj_usi_i2c_irqhandler+0x1b6>
            rxfifo = 0;
    2fc6:	4581                	li	a1,0
    2fc8:	bf0d                	j	2efa <wj_usi_i2c_irqhandler+0x1ba>

00002fca <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    2fca:	4789                	li	a5,2
    2fcc:	02f51463          	bne	a0,a5,2ff4 <wj_spi_ss_control.isra.0+0x2a>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    2fd0:	1151                	addi	sp,sp,-12
    2fd2:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    2fd4:	e991                	bnez	a1,2fe8 <wj_spi_ss_control.isra.0+0x1e>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    2fd6:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2fd8:	00c1a503          	lw	a0,12(gp) # 200004f4 <pgpio_pin_handle>
    2fdc:	74e000ef          	jal	ra,372a <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    2fe0:	4501                	li	a0,0
}
    2fe2:	40a2                	lw	ra,8(sp)
    2fe4:	0131                	addi	sp,sp,12
    2fe6:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    2fe8:	4785                	li	a5,1
            return -1;
    2fea:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    2fec:	fef59be3          	bne	a1,a5,2fe2 <wj_spi_ss_control.isra.0+0x18>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2ff0:	4581                	li	a1,0
    2ff2:	b7dd                	j	2fd8 <wj_spi_ss_control.isra.0+0xe>
    return 0;
    2ff4:	4501                	li	a0,0
}
    2ff6:	8082                	ret

00002ff8 <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2ff8:	04c00793          	li	a5,76
    2ffc:	02f507b3          	mul	a5,a0,a5
{
    3000:	1101                	addi	sp,sp,-32
    3002:	cc22                	sw	s0,24(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3004:	20001437          	lui	s0,0x20001
    3008:	7c440313          	addi	t1,s0,1988 # 200017c4 <spi_instance>
{
    300c:	ca26                	sw	s1,20(sp)
    300e:	ce06                	sw	ra,28(sp)
    3010:	872a                	mv	a4,a0
    3012:	7c440413          	addi	s0,s0,1988
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3016:	933e                	add	t1,t1,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3018:	00032483          	lw	s1,0(t1)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    301c:	48f0                	lw	a2,84(s1)
    301e:	00e61793          	slli	a5,a2,0xe
    3022:	83b9                	srli	a5,a5,0xe
    3024:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    3026:	000207b7          	lui	a5,0x20
    302a:	8ff1                	and	a5,a5,a2
    302c:	c7c9                	beqz	a5,30b6 <wj_usi_spi_irqhandler+0xbe>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    302e:	44dc                	lw	a5,12(s1)
    uint32_t length = spi_priv->recv_num;
    3030:	01432503          	lw	a0,20(t1)
    uint8_t *pbuffer = spi_priv->recv_buf;
    3034:	01c32583          	lw	a1,28(t1)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    3038:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    303a:	8bfd                	andi	a5,a5,31
    303c:	00f57363          	bgeu	a0,a5,3042 <wj_usi_spi_irqhandler+0x4a>
    3040:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    3042:	00f582b3          	add	t0,a1,a5
    3046:	0a559d63          	bne	a1,t0,3100 <wj_usi_spi_irqhandler+0x108>
    length -= rxdata_num;
    304a:	40f502b3          	sub	t0,a0,a5
    if (length <= 0) {
    304e:	0af51f63          	bne	a0,a5,310c <wj_usi_spi_irqhandler+0x114>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    3052:	48bc                	lw	a5,80(s1)
    3054:	7581                	lui	a1,0xfffe0
    3056:	15fd                	addi	a1,a1,-1
    3058:	8fed                	and	a5,a5,a1
    305a:	c8bc                	sw	a5,80(s1)
        spi_priv->status.busy = 0U;
    305c:	04c00793          	li	a5,76
    3060:	02f707b3          	mul	a5,a4,a5
    3064:	c832                	sw	a2,16(sp)
    3066:	c63a                	sw	a4,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3068:	c21a                	sw	t1,4(sp)
        spi_priv->status.busy = 0U;
    306a:	97a2                	add	a5,a5,s0
    306c:	0387c583          	lbu	a1,56(a5) # 20038 <__min_heap_size+0x38>
        spi_priv->recv_num = 0;
    3070:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    3072:	99f9                	andi	a1,a1,-2
    3074:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    3078:	0004a023          	sw	zero,0(s1) # 80000000 <__heap_end+0x5ffd0000>
        addr->USI_EN = 0xf;
    307c:	45bd                	li	a1,15
    307e:	c08c                	sw	a1,0(s1)
        addr->USI_EN = 0x0;
    3080:	0004a023          	sw	zero,0(s1)
        spi_priv->recv_num = 0;
    3084:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3088:	03434503          	lbu	a0,52(t1)
    308c:	4581                	li	a1,0
    308e:	3f35                	jal	2fca <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    3090:	47a2                	lw	a5,8(sp)
    3092:	4312                	lw	t1,4(sp)
    3094:	4732                	lw	a4,12(sp)
    3096:	00c7a383          	lw	t2,12(a5)
    309a:	4642                	lw	a2,16(sp)
    309c:	00038a63          	beqz	t2,30b0 <wj_usi_spi_irqhandler+0xb8>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    30a0:	43a8                	lw	a0,64(a5)
    30a2:	4589                	li	a1,2
    30a4:	c41a                	sw	t1,8(sp)
    30a6:	c232                	sw	a2,4(sp)
    30a8:	9382                	jalr	t2
            return;
    30aa:	4612                	lw	a2,4(sp)
    30ac:	4322                	lw	t1,8(sp)
    30ae:	4732                	lw	a4,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    30b0:	000207b7          	lui	a5,0x20
    30b4:	d0bc                	sw	a5,96(s1)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    30b6:	8a09                	andi	a2,a2,2
    30b8:	10060363          	beqz	a2,31be <wj_usi_spi_irqhandler+0x1c6>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30bc:	04c00793          	li	a5,76
    30c0:	02f707b3          	mul	a5,a4,a5
    30c4:	97a2                	add	a5,a5,s0
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30c6:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30c8:	4390                	lw	a2,0(a5)
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30ca:	c1d9                	beqz	a1,3150 <wj_usi_spi_irqhandler+0x158>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    30cc:	578c                	lw	a1,40(a5)
    30ce:	47c1                	li	a5,16
    30d0:	00b7f363          	bgeu	a5,a1,30d6 <wj_usi_spi_irqhandler+0xde>
    30d4:	45c1                	li	a1,16
    30d6:	04c00793          	li	a5,76
    30da:	02f707b3          	mul	a5,a4,a5
    30de:	4281                	li	t0,0
    30e0:	97a2                	add	a5,a5,s0
    30e2:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    30e4:	08558563          	beq	a1,t0,316e <wj_usi_spi_irqhandler+0x176>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    30e8:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    30ea:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    30ec:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    30f0:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    30f2:	00762423          	sw	t2,8(a2) # 1008 <__divdf3+0x15e>
            spi_priv->send_buf++;
    30f6:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    30f8:	4b88                	lw	a0,16(a5)
    30fa:	157d                	addi	a0,a0,-1
    30fc:	cb88                	sw	a0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    30fe:	b7dd                	j	30e4 <wj_usi_spi_irqhandler+0xec>
        *pbuffer = addr->USI_TX_RX_FIFO;
    3100:	0084a383          	lw	t2,8(s1)
        pbuffer++;
    3104:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    3106:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
    for (i = 0; i < rxdata_num; i++) {
    310a:	bf35                	j	3046 <wj_usi_spi_irqhandler+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    310c:	04c00793          	li	a5,76
    3110:	02f707b3          	mul	a5,a4,a5
    3114:	97a2                	add	a5,a5,s0
    3116:	4388                	lw	a0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    3118:	04452383          	lw	t2,68(a0)
    311c:	fcf3f393          	andi	t2,t2,-49
    3120:	04752223          	sw	t2,68(a0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    3124:	04452383          	lw	t2,68(a0)
    3128:	0203e393          	ori	t2,t2,32
    312c:	04752223          	sw	t2,68(a0)
    spi_priv->mode = mode;
    3130:	4509                	li	a0,2
    3132:	db88                	sw	a0,48(a5)
        spi_priv->recv_buf = pbuffer;
    3134:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    3136:	0057aa23          	sw	t0,20(a5) # 20014 <__min_heap_size+0x14>
    313a:	bf9d                	j	30b0 <wj_usi_spi_irqhandler+0xb8>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    313c:	4608                	lw	a0,8(a2)
    313e:	4fcc                	lw	a1,28(a5)
    3140:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    3144:	4fcc                	lw	a1,28(a5)
    3146:	0585                	addi	a1,a1,1
    3148:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    314a:	53cc                	lw	a1,36(a5)
    314c:	15fd                	addi	a1,a1,-1
    314e:	d3cc                	sw	a1,36(a5)
        while (spi_priv->transfer_num) {
    3150:	53c8                	lw	a0,36(a5)
    3152:	f56d                	bnez	a0,313c <wj_usi_spi_irqhandler+0x144>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3154:	578c                	lw	a1,40(a5)
    3156:	47c1                	li	a5,16
    3158:	00b7f363          	bgeu	a5,a1,315e <wj_usi_spi_irqhandler+0x166>
    315c:	45c1                	li	a1,16
    315e:	04c00793          	li	a5,76
    3162:	02f707b3          	mul	a5,a4,a5
    3166:	97a2                	add	a5,a5,s0
    3168:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    316a:	06b51163          	bne	a0,a1,31cc <wj_usi_spi_irqhandler+0x1d4>
    if (spi_priv->clk_num == 0) {
    316e:	04c00793          	li	a5,76
    3172:	02f707b3          	mul	a5,a4,a5
    3176:	97a2                	add	a5,a5,s0
    3178:	578c                	lw	a1,40(a5)
    317a:	eda5                	bnez	a1,31f2 <wj_usi_spi_irqhandler+0x1fa>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    317c:	4a2c                	lw	a1,80(a2)
    317e:	c63a                	sw	a4,12(sp)
    3180:	c432                	sw	a2,8(sp)
    3182:	99f5                	andi	a1,a1,-3
    3184:	ca2c                	sw	a1,80(a2)
        spi_priv->status.busy = 0U;
    3186:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    318a:	0007a823          	sw	zero,16(a5)
    318e:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    3190:	99f9                	andi	a1,a1,-2
    3192:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3196:	03434503          	lbu	a0,52(t1)
    319a:	4581                	li	a1,0
    319c:	353d                	jal	2fca <wj_spi_ss_control.isra.0>
        addr->USI_EN = 0x0;
    319e:	4622                	lw	a2,8(sp)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31a0:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0xf;
    31a2:	45bd                	li	a1,15
        addr->USI_EN = 0x0;
    31a4:	00062023          	sw	zero,0(a2)
        addr->USI_EN = 0xf;
    31a8:	c20c                	sw	a1,0(a2)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31aa:	5b8c                	lw	a1,48(a5)
    31ac:	47d0                	lw	a2,12(a5)
    31ae:	4732                	lw	a4,12(sp)
    31b0:	ed95                	bnez	a1,31ec <wj_usi_spi_irqhandler+0x1f4>
            if (spi_priv->cb_event) {
    31b2:	04060063          	beqz	a2,31f2 <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    31b6:	43a8                	lw	a0,64(a5)
    31b8:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    31ba:	4789                	li	a5,2
    31bc:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    31be:	4782                	lw	a5,0(sp)
}
    31c0:	40f2                	lw	ra,28(sp)
    31c2:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    31c4:	d0bc                	sw	a5,96(s1)
}
    31c6:	44d2                	lw	s1,20(sp)
    31c8:	6105                	addi	sp,sp,32
    31ca:	8082                	ret
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31cc:	0187a283          	lw	t0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31d0:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31d2:	0002c383          	lbu	t2,0(t0) # 233e <memset+0x92>
            spi_priv->send_buf++;
    31d6:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31d8:	00762423          	sw	t2,8(a2)
            spi_priv->send_buf++;
    31dc:	0057ac23          	sw	t0,24(a5)
            spi_priv->send_num--;
    31e0:	0107a283          	lw	t0,16(a5)
    31e4:	12fd                	addi	t0,t0,-1
    31e6:	0057a823          	sw	t0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31ea:	b741                	j	316a <wj_usi_spi_irqhandler+0x172>
            if (spi_priv->cb_event) {
    31ec:	c219                	beqz	a2,31f2 <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    31ee:	4585                	li	a1,1
    31f0:	b7d9                	j	31b6 <wj_usi_spi_irqhandler+0x1be>
    spi_priv->clk_num -= spi_priv->transfer_num;
    31f2:	04c00513          	li	a0,76
    31f6:	02a70733          	mul	a4,a4,a0
    31fa:	943a                	add	s0,s0,a4
    31fc:	541c                	lw	a5,40(s0)
    31fe:	5058                	lw	a4,36(s0)
    3200:	8f99                	sub	a5,a5,a4
    3202:	d41c                	sw	a5,40(s0)
    3204:	bf5d                	j	31ba <wj_usi_spi_irqhandler+0x1c2>

00003206 <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    3206:	4558                	lw	a4,12(a0)
    3208:	c319                	beqz	a4,320e <ck_usart_intr_recv_data+0x8>
    320a:	495c                	lw	a5,20(a0)
    320c:	e789                	bnez	a5,3216 <ck_usart_intr_recv_data+0x10>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    320e:	451c                	lw	a5,8(a0)
    3210:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    3212:	5948                	lw	a0,52(a0)
    3214:	8782                	jr	a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3216:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    3218:	465c                	lw	a5,12(a2)
    321a:	83c1                	srli	a5,a5,0x10
    321c:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    321e:	00f77363          	bgeu	a4,a5,3224 <ck_usart_intr_recv_data+0x1e>
    3222:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    3224:	4701                	li	a4,0
    3226:	02f71363          	bne	a4,a5,324c <ck_usart_intr_recv_data+0x46>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    322a:	4d58                	lw	a4,28(a0)
    322c:	455c                	lw	a5,12(a0)
    322e:	02f76b63          	bltu	a4,a5,3264 <ck_usart_intr_recv_data+0x5e>
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    3232:	d91c                	sw	a5,48(a0)
        if (usart_priv->cb_event) {
    3234:	451c                	lw	a5,8(a0)
        usart_priv->rx_cnt = 0;
    3236:	00052e23          	sw	zero,28(a0)
        usart_priv->rx_buf = NULL;
    323a:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    323e:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    3242:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    3246:	cf99                	beqz	a5,3264 <ck_usart_intr_recv_data+0x5e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    3248:	4585                	li	a1,1
    324a:	b7e1                	j	3212 <ck_usart_intr_recv_data+0xc>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    324c:	460c                	lw	a1,8(a2)
    324e:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    3250:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    3252:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    3256:	4d54                	lw	a3,28(a0)
    3258:	0685                	addi	a3,a3,1
    325a:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    325c:	4954                	lw	a3,20(a0)
    325e:	0685                	addi	a3,a3,1
    3260:	c954                	sw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    3262:	b7d1                	j	3226 <ck_usart_intr_recv_data+0x20>
        }
    }
}
    3264:	8082                	ret

00003266 <drv_usi_usart_config_baudrate>:
{
    3266:	1151                	addi	sp,sp,-12
    3268:	c222                	sw	s0,4(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    326a:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    326c:	5948                	lw	a0,52(a0)
{
    326e:	c026                	sw	s1,0(sp)
    3270:	c406                	sw	ra,8(sp)
    addr->USI_EN = 0x0;
    3272:	00042023          	sw	zero,0(s0)
{
    3276:	84ae                	mv	s1,a1
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3278:	734000ef          	jal	ra,39ac <drv_get_usi_freq>
    327c:	4729                	li	a4,10
    327e:	02e50533          	mul	a0,a0,a4
    3282:	029555b3          	divu	a1,a0,s1
    3286:	8191                	srli	a1,a1,0x4
        divisor = (divisor / 10);
    3288:	02e5d7b3          	divu	a5,a1,a4
    if ((divisor % 10) >= 5) {
    328c:	02e5f5b3          	remu	a1,a1,a4
    3290:	4711                	li	a4,4
    3292:	00b76363          	bltu	a4,a1,3298 <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    3296:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    3298:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    329a:	47bd                	li	a5,15
}
    329c:	40a2                	lw	ra,8(sp)
    addr->USI_EN = 0xf;
    329e:	c01c                	sw	a5,0(s0)
}
    32a0:	4412                	lw	s0,4(sp)
    32a2:	4482                	lw	s1,0(sp)
    32a4:	4501                	li	a0,0
    32a6:	0131                	addi	sp,sp,12
    32a8:	8082                	ret

000032aa <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    32aa:	cd11                	beqz	a0,32c6 <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32ac:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    32ae:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    32b0:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    32b4:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    32b6:	e199                	bnez	a1,32bc <drv_usi_usart_config_mode+0x12>
        return 0;
    32b8:	4501                	li	a0,0
    32ba:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    32bc:	81020537          	lui	a0,0x81020
    32c0:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    32c4:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    32c6:	81020537          	lui	a0,0x81020
    32ca:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    32ce:	8082                	ret

000032d0 <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    32d0:	c539                	beqz	a0,331e <drv_usi_usart_config_parity+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32d2:	411c                	lw	a5,0(a0)
    switch (parity) {
    32d4:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    32d6:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    32da:	02e58763          	beq	a1,a4,3308 <drv_usi_usart_config_parity+0x38>
    32de:	4709                	li	a4,2
    32e0:	00e58b63          	beq	a1,a4,32f6 <drv_usi_usart_config_parity+0x26>
    32e4:	04059263          	bnez	a1,3328 <drv_usi_usart_config_parity+0x58>
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    32e8:	4f98                	lw	a4,24(a5)
    32ea:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    32ec:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    32ee:	473d                	li	a4,15
    32f0:	c398                	sw	a4,0(a5)
    return 0;
    32f2:	4501                	li	a0,0
    32f4:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    32f6:	4f98                	lw	a4,24(a5)
    32f8:	8b3d                	andi	a4,a4,15
    32fa:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    32fc:	4f98                	lw	a4,24(a5)
    32fe:	01076713          	ori	a4,a4,16
    3302:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    3304:	4f98                	lw	a4,24(a5)
    3306:	b7dd                	j	32ec <drv_usi_usart_config_parity+0x1c>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    3308:	4f98                	lw	a4,24(a5)
    330a:	8b3d                	andi	a4,a4,15
    330c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    330e:	4f98                	lw	a4,24(a5)
    3310:	01076713          	ori	a4,a4,16
    3314:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3316:	4f98                	lw	a4,24(a5)
    3318:	02076713          	ori	a4,a4,32
    331c:	bfc1                	j	32ec <drv_usi_usart_config_parity+0x1c>
    USART_NULL_PARAM_CHK(handle);
    331e:	81020537          	lui	a0,0x81020
    3322:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    3326:	8082                	ret
    switch (parity) {
    3328:	81020537          	lui	a0,0x81020
    332c:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
}
    3330:	8082                	ret

00003332 <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    3332:	c531                	beqz	a0,337e <drv_usi_usart_config_stopbits+0x4c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3334:	411c                	lw	a5,0(a0)
    switch (stopbit) {
    3336:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    3338:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    333c:	02e58963          	beq	a1,a4,336e <drv_usi_usart_config_stopbits+0x3c>
    3340:	4709                	li	a4,2
    3342:	00e58e63          	beq	a1,a4,335e <drv_usi_usart_config_stopbits+0x2c>
    3346:	04059163          	bnez	a1,3388 <drv_usi_usart_config_stopbits+0x56>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    334a:	4f98                	lw	a4,24(a5)
    334c:	03377713          	andi	a4,a4,51
    3350:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    3352:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3354:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3356:	473d                	li	a4,15
    3358:	c398                	sw	a4,0(a5)
    return 0;
    335a:	4501                	li	a0,0
    335c:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    335e:	4f98                	lw	a4,24(a5)
    3360:	03377713          	andi	a4,a4,51
    3364:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    3366:	4f98                	lw	a4,24(a5)
    3368:	00476713          	ori	a4,a4,4
    336c:	b7e5                	j	3354 <drv_usi_usart_config_stopbits+0x22>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    336e:	4f98                	lw	a4,24(a5)
    3370:	03377713          	andi	a4,a4,51
    3374:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3376:	4f98                	lw	a4,24(a5)
    3378:	00876713          	ori	a4,a4,8
    337c:	bfe1                	j	3354 <drv_usi_usart_config_stopbits+0x22>
    USART_NULL_PARAM_CHK(handle);
    337e:	81020537          	lui	a0,0x81020
    3382:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    3386:	8082                	ret
    switch (stopbit) {
    3388:	81020537          	lui	a0,0x81020
    338c:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
}
    3390:	8082                	ret

00003392 <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    3392:	c52d                	beqz	a0,33fc <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3394:	411c                	lw	a5,0(a0)
    switch (databits) {
    3396:	4709                	li	a4,2
    addr->USI_EN = 0x0;
    3398:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    339c:	04e58063          	beq	a1,a4,33dc <drv_usi_usart_config_databits+0x4a>
    33a0:	00b76e63          	bltu	a4,a1,33bc <drv_usi_usart_config_databits+0x2a>
    33a4:	02059463          	bnez	a1,33cc <drv_usi_usart_config_databits+0x3a>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33a8:	4f98                	lw	a4,24(a5)
    33aa:	03c77713          	andi	a4,a4,60
    33ae:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    33b0:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    33b2:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    33b4:	473d                	li	a4,15
    33b6:	c398                	sw	a4,0(a5)
    return 0;
    33b8:	4501                	li	a0,0
    33ba:	8082                	ret
    switch (databits) {
    33bc:	470d                	li	a4,3
    33be:	02e58763          	beq	a1,a4,33ec <drv_usi_usart_config_databits+0x5a>
    33c2:	81020537          	lui	a0,0x81020
    33c6:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    33ca:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33cc:	4f98                	lw	a4,24(a5)
    33ce:	03c77713          	andi	a4,a4,60
    33d2:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    33d4:	4f98                	lw	a4,24(a5)
    33d6:	00176713          	ori	a4,a4,1
    33da:	bfe1                	j	33b2 <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33dc:	4f98                	lw	a4,24(a5)
    33de:	03c77713          	andi	a4,a4,60
    33e2:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    33e4:	4f98                	lw	a4,24(a5)
    33e6:	00276713          	ori	a4,a4,2
    33ea:	b7e1                	j	33b2 <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33ec:	4f98                	lw	a4,24(a5)
    33ee:	03c77713          	andi	a4,a4,60
    33f2:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    33f4:	4f98                	lw	a4,24(a5)
    33f6:	00376713          	ori	a4,a4,3
    33fa:	bf65                	j	33b2 <drv_usi_usart_config_databits+0x20>
    USART_NULL_PARAM_CHK(handle);
    33fc:	81020537          	lui	a0,0x81020
    3400:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3404:	8082                	ret

00003406 <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3406:	03800793          	li	a5,56
    340a:	02f507b3          	mul	a5,a0,a5
    340e:	200026b7          	lui	a3,0x20002
    3412:	8a868713          	addi	a4,a3,-1880 # 200018a8 <usi_usart_instance>
{
    3416:	1101                	addi	sp,sp,-32
    3418:	ca26                	sw	s1,20(sp)
    341a:	8a868693          	addi	a3,a3,-1880
    341e:	cc22                	sw	s0,24(sp)
    3420:	ce06                	sw	ra,28(sp)
    3422:	c036                	sw	a3,0(sp)
    3424:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3426:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3428:	4398                	lw	a4,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    342a:	4b64                	lw	s1,84(a4)
    342c:	00e49613          	slli	a2,s1,0xe
    3430:	8239                	srli	a2,a2,0xe
    3432:	c232                	sw	a2,4(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    3434:	0024f613          	andi	a2,s1,2
    3438:	c229                	beqz	a2,347a <wj_usi_usart_irqhandler+0x74>
    if (usart_priv->tx_total_num == 0) {
    343a:	4b94                	lw	a3,16(a5)
    343c:	ce8d                	beqz	a3,3476 <wj_usi_usart_irqhandler+0x70>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    343e:	5390                	lw	a2,32(a5)
    3440:	0cd66363          	bltu	a2,a3,3506 <wj_usi_usart_irqhandler+0x100>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    3444:	4b30                	lw	a2,80(a4)
    3446:	9a75                	andi	a2,a2,-3
    3448:	cb30                	sw	a2,80(a4)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    344a:	4b30                	lw	a2,80(a4)
    344c:	40066613          	ori	a2,a2,1024
    3450:	cb30                	sw	a2,80(a4)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    3452:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    3454:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    3456:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    345a:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    345e:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    3462:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    3466:	ca81                	beqz	a3,3476 <wj_usi_usart_irqhandler+0x70>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    3468:	5bc8                	lw	a0,52(a5)
    346a:	4581                	li	a1,0
    346c:	c63a                	sw	a4,12(sp)
    346e:	c43e                	sw	a5,8(sp)
    3470:	9682                	jalr	a3
    3472:	47a2                	lw	a5,8(sp)
    3474:	4732                	lw	a4,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    3476:	4689                	li	a3,2
    3478:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    347a:	0204f693          	andi	a3,s1,32
    347e:	ca91                	beqz	a3,3492 <wj_usi_usart_irqhandler+0x8c>
        ck_usart_intr_recv_data(usart_priv);
    3480:	853e                	mv	a0,a5
    3482:	c63a                	sw	a4,12(sp)
    3484:	c43e                	sw	a5,8(sp)
    3486:	3341                	jal	3206 <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3488:	4732                	lw	a4,12(sp)
    348a:	47a2                	lw	a5,8(sp)
    348c:	02000693          	li	a3,32
    3490:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_UART_STOP) {
    3492:	4004f693          	andi	a3,s1,1024
    3496:	c695                	beqz	a3,34c2 <wj_usi_usart_irqhandler+0xbc>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    3498:	4754                	lw	a3,12(a4)
    349a:	82c1                	srli	a3,a3,0x10
    349c:	8afd                	andi	a3,a3,31
    349e:	ce99                	beqz	a3,34bc <wj_usi_usart_irqhandler+0xb6>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    34a0:	03800693          	li	a3,56
    34a4:	02d406b3          	mul	a3,s0,a3
    34a8:	4602                	lw	a2,0(sp)
    34aa:	96b2                	add	a3,a3,a2
    34ac:	46d0                	lw	a2,12(a3)
    34ae:	ce51                	beqz	a2,354a <wj_usi_usart_irqhandler+0x144>
    34b0:	4ad4                	lw	a3,20(a3)
    34b2:	cec1                	beqz	a3,354a <wj_usi_usart_irqhandler+0x144>
        ck_usart_intr_recv_data(usart_priv);
    34b4:	853e                	mv	a0,a5
    34b6:	c43a                	sw	a4,8(sp)
    34b8:	33b9                	jal	3206 <ck_usart_intr_recv_data>
        return;
    34ba:	4722                	lw	a4,8(sp)
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    34bc:	02000793          	li	a5,32
    34c0:	d33c                	sw	a5,96(a4)
    }

    if (intr_state & USI_INT_UART_PERR) {
    34c2:	80ad                	srli	s1,s1,0xb
    34c4:	8885                	andi	s1,s1,1
    34c6:	c88d                	beqz	s1,34f8 <wj_usi_usart_irqhandler+0xf2>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34c8:	03800513          	li	a0,56
    34cc:	02a40433          	mul	s0,s0,a0
    34d0:	4782                	lw	a5,0(sp)
    34d2:	943e                	add	s0,s0,a5
    34d4:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    34d6:	4394                	lw	a3,0(a5)
    34d8:	9add                	andi	a3,a3,-9
    34da:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    34dc:	4394                	lw	a3,0(a5)
    34de:	0086e693          	ori	a3,a3,8
    34e2:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    34e4:	441c                	lw	a5,8(s0)
    34e6:	c791                	beqz	a5,34f2 <wj_usi_usart_irqhandler+0xec>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    34e8:	5848                	lw	a0,52(s0)
    34ea:	45a5                	li	a1,9
    34ec:	c03a                	sw	a4,0(sp)
    34ee:	9782                	jalr	a5
    34f0:	4702                	lw	a4,0(sp)
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    34f2:	02000793          	li	a5,32
    34f6:	d33c                	sw	a5,96(a4)
    }

    addr->USI_INTR_CLR = intr_state;
    34f8:	4792                	lw	a5,4(sp)
}
    34fa:	40f2                	lw	ra,28(sp)
    34fc:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    34fe:	d33c                	sw	a5,96(a4)
}
    3500:	44d2                	lw	s1,20(sp)
    3502:	6105                	addi	sp,sp,32
    3504:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    3506:	538c                	lw	a1,32(a5)
    3508:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    350c:	46bd                	li	a3,15
    350e:	00b6f363          	bgeu	a3,a1,3514 <wj_usi_usart_irqhandler+0x10e>
    3512:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3514:	03800693          	li	a3,56
    3518:	02d406b3          	mul	a3,s0,a3
    351c:	4602                	lw	a2,0(sp)
        volatile uint32_t i = 0u;
    351e:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    3520:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3522:	96b2                	add	a3,a3,a2
        for (i = 0; i < txdata_num; i++) {
    3524:	4642                	lw	a2,16(sp)
    3526:	00b66563          	bltu	a2,a1,3530 <wj_usi_usart_irqhandler+0x12a>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    352a:	4689                	li	a3,2
    352c:	d334                	sw	a3,96(a4)
    352e:	b7a1                	j	3476 <wj_usi_usart_irqhandler+0x70>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3530:	4e90                	lw	a2,24(a3)
    3532:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    3536:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3538:	c708                	sw	a0,8(a4)
            usart_priv->tx_cnt++;
    353a:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    353c:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    353e:	0505                	addi	a0,a0,1
    3540:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    3542:	4642                	lw	a2,16(sp)
    3544:	0605                	addi	a2,a2,1
    3546:	c832                	sw	a2,16(sp)
    3548:	bff1                	j	3524 <wj_usi_usart_irqhandler+0x11e>
    if (usart_priv->cb_event) {
    354a:	03800793          	li	a5,56
    354e:	02f407b3          	mul	a5,s0,a5
    3552:	4682                	lw	a3,0(sp)
    3554:	97b6                	add	a5,a5,a3
    3556:	4794                	lw	a3,8(a5)
    3558:	c691                	beqz	a3,3564 <wj_usi_usart_irqhandler+0x15e>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    355a:	5bc8                	lw	a0,52(a5)
    355c:	45b9                	li	a1,14
    355e:	c43a                	sw	a4,8(sp)
    3560:	9682                	jalr	a3
    3562:	bfa1                	j	34ba <wj_usi_usart_irqhandler+0xb4>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3564:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    3566:	4394                	lw	a3,0(a5)
    3568:	9add                	andi	a3,a3,-9
    356a:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    356c:	4394                	lw	a3,0(a5)
    356e:	0086e693          	ori	a3,a3,8
    3572:	c394                	sw	a3,0(a5)
    3574:	b7a1                	j	34bc <wj_usi_usart_irqhandler+0xb6>

00003576 <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3576:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    3578:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    357a:	475c                	lw	a5,12(a4)
    357c:	8b85                	andi	a5,a5,1
    357e:	dff5                	beqz	a5,357a <drv_usi_usart_putchar+0x4>

    return 0;
}
    3580:	4501                	li	a0,0
    3582:	8082                	ret

00003584 <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    3584:	1111                	addi	sp,sp,-28
    3586:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    3588:	0074                	addi	a3,sp,12
    358a:	0030                	addi	a2,sp,8
    358c:	004c                	addi	a1,sp,4
{
    358e:	c826                	sw	s1,16(sp)
    3590:	cc06                	sw	ra,24(sp)
    3592:	ca22                	sw	s0,20(sp)
    3594:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    3596:	22a9                	jal	36e0 <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    3598:	4709                	li	a4,2
    359a:	00a77963          	bgeu	a4,a0,35ac <drv_usi_usart_initialize+0x28>
        return NULL;
    359e:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    35a0:	40e2                	lw	ra,24(sp)
    35a2:	8522                	mv	a0,s0
    35a4:	4452                	lw	s0,20(sp)
    35a6:	44c2                	lw	s1,16(sp)
    35a8:	0171                	addi	sp,sp,28
    35aa:	8082                	ret
    ret = drv_usi_initialize(idx);
    35ac:	8526                	mv	a0,s1
    35ae:	f50ff0ef          	jal	ra,2cfe <drv_usi_initialize>
    if (ret < 0) {
    35b2:	fe0546e3          	bltz	a0,359e <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35b6:	03800413          	li	s0,56
    35ba:	02848733          	mul	a4,s1,s0
    usart_priv->irq = irq;
    35be:	47a2                	lw	a5,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35c0:	20002437          	lui	s0,0x20002
    35c4:	8a840413          	addi	s0,s0,-1880 # 200018a8 <usi_usart_instance>
    usart_priv->base = base;
    35c8:	4512                	lw	a0,4(sp)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    35ca:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35cc:	943a                	add	s0,s0,a4
    usart_priv->irq = irq;
    35ce:	c05c                	sw	a5,4(s0)
    usart_priv->cb_event = cb_event;
    35d0:	4782                	lw	a5,0(sp)
    usart_priv->base = base;
    35d2:	c008                	sw	a0,0(s0)
    usart_priv->idx = idx;
    35d4:	d844                	sw	s1,52(s0)
    usart_priv->cb_event = cb_event;
    35d6:	c41c                	sw	a5,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    35d8:	6785                	lui	a5,0x1
    35da:	f9878793          	addi	a5,a5,-104 # f98 <__divdf3+0xee>
    addr->USI_EN = 0x0;
    35de:	00052023          	sw	zero,0(a0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    35e2:	cd7c                	sw	a5,92(a0)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    35e4:	c93c                	sw	a5,80(a0)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    35e6:	c02a                	sw	a0,0(sp)
    35e8:	e9cff0ef          	jal	ra,2c84 <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    35ec:	4502                	lw	a0,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    35ee:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    35f0:	00052223          	sw	zero,4(a0)
    drv_irq_register(usart_priv->irq, handler);
    35f4:	4048                	lw	a0,4(s0)
    35f6:	e7eff0ef          	jal	ra,2c74 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    35fa:	4048                	lw	a0,4(s0)
    35fc:	e60ff0ef          	jal	ra,2c5c <drv_irq_enable>
    return usart_priv;
    3600:	b745                	j	35a0 <drv_usi_usart_initialize+0x1c>

00003602 <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    3602:	1111                	addi	sp,sp,-28
    3604:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3606:	4104                	lw	s1,0(a0)
{
    3608:	ca22                	sw	s0,20(sp)
    360a:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    360c:	0004a023          	sw	zero,0(s1)
{
    3610:	842a                	mv	s0,a0
    3612:	c032                	sw	a2,0(sp)
    3614:	c636                	sw	a3,12(sp)
    3616:	c23a                	sw	a4,4(sp)
    3618:	c43e                	sw	a5,8(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    361a:	31b1                	jal	3266 <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    361c:	02054a63          	bltz	a0,3650 <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    3620:	46b2                	lw	a3,12(sp)
    3622:	8522                	mv	a0,s0
    3624:	85b6                	mv	a1,a3
    3626:	316d                	jal	32d0 <drv_usi_usart_config_parity>

    if (ret < 0) {
    3628:	02054463          	bltz	a0,3650 <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    362c:	4582                	lw	a1,0(sp)
    362e:	8522                	mv	a0,s0
    3630:	39ad                	jal	32aa <drv_usi_usart_config_mode>

    if (ret < 0) {
    3632:	00054f63          	bltz	a0,3650 <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    3636:	4592                	lw	a1,4(sp)
    3638:	8522                	mv	a0,s0
    363a:	39e5                	jal	3332 <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    363c:	00054a63          	bltz	a0,3650 <drv_usi_usart_config+0x4e>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    3640:	45a2                	lw	a1,8(sp)
    3642:	8522                	mv	a0,s0
    3644:	33b9                	jal	3392 <drv_usi_usart_config_databits>

    if (ret < 0) {
    3646:	00054563          	bltz	a0,3650 <drv_usi_usart_config+0x4e>
        return ret;
    }

    addr->USI_EN = 0xf;
    364a:	47bd                	li	a5,15
    364c:	c09c                	sw	a5,0(s1)
    return 0;
    364e:	4501                	li	a0,0
}
    3650:	40e2                	lw	ra,24(sp)
    3652:	4452                	lw	s0,20(sp)
    3654:	44c2                	lw	s1,16(sp)
    3656:	0171                	addi	sp,sp,28
    3658:	8082                	ret

0000365a <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    365a:	bf31                	j	3576 <drv_usi_usart_putchar>

0000365c <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    365c:	b725                	j	3584 <drv_usi_usart_initialize>

0000365e <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    365e:	b755                	j	3602 <drv_usi_usart_config>

00003660 <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    3660:	47bd                	li	a5,15
    3662:	04a7c263          	blt	a5,a0,36a6 <target_get_timer+0x46>
        return -1;
    }

    if (base != NULL) {
    3666:	00058b63          	beqz	a1,367c <target_get_timer+0x1c>
        *base = sg_timer_config[idx].base;
    366a:	47b1                	li	a5,12
    366c:	02f50733          	mul	a4,a0,a5
    3670:	6795                	lui	a5,0x5
    3672:	07878793          	addi	a5,a5,120 # 5078 <sg_timer_config>
    3676:	97ba                	add	a5,a5,a4
    3678:	439c                	lw	a5,0(a5)
    367a:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    367c:	ca11                	beqz	a2,3690 <target_get_timer+0x30>
        *irq = sg_timer_config[idx].irq;
    367e:	47b1                	li	a5,12
    3680:	02f50733          	mul	a4,a0,a5
    3684:	6795                	lui	a5,0x5
    3686:	07878793          	addi	a5,a5,120 # 5078 <sg_timer_config>
    368a:	97ba                	add	a5,a5,a4
    368c:	43dc                	lw	a5,4(a5)
    368e:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    3690:	ce81                	beqz	a3,36a8 <target_get_timer+0x48>
        *handler = sg_timer_config[idx].handler;
    3692:	47b1                	li	a5,12
    3694:	02f50733          	mul	a4,a0,a5
    3698:	6795                	lui	a5,0x5
    369a:	07878793          	addi	a5,a5,120 # 5078 <sg_timer_config>
    369e:	97ba                	add	a5,a5,a4
    36a0:	479c                	lw	a5,8(a5)
    36a2:	c29c                	sw	a5,0(a3)
    36a4:	8082                	ret
        return -1;
    36a6:	557d                	li	a0,-1
    }

    return idx;
}
    36a8:	8082                	ret

000036aa <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    36aa:	4789                	li	a5,2
    36ac:	02a7c863          	blt	a5,a0,36dc <target_usi_init+0x32>
        return -1;
    }

    if (base != NULL) {
    36b0:	00058b63          	beqz	a1,36c6 <target_usi_init+0x1c>
        *base = sg_usi_config[idx].base;
    36b4:	47b1                	li	a5,12
    36b6:	02f50733          	mul	a4,a0,a5
    36ba:	6795                	lui	a5,0x5
    36bc:	13878793          	addi	a5,a5,312 # 5138 <sg_usi_config>
    36c0:	97ba                	add	a5,a5,a4
    36c2:	439c                	lw	a5,0(a5)
    36c4:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    36c6:	ce01                	beqz	a2,36de <target_usi_init+0x34>
        *irq = sg_usi_config[idx].irq;
    36c8:	47b1                	li	a5,12
    36ca:	02f50733          	mul	a4,a0,a5
    36ce:	6795                	lui	a5,0x5
    36d0:	13878793          	addi	a5,a5,312 # 5138 <sg_usi_config>
    36d4:	97ba                	add	a5,a5,a4
    36d6:	43dc                	lw	a5,4(a5)
    36d8:	c21c                	sw	a5,0(a2)
    36da:	8082                	ret
        return -1;
    36dc:	557d                	li	a0,-1
    }

    return idx;
}
    36de:	8082                	ret

000036e0 <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    36e0:	4789                	li	a5,2
    36e2:	04a7c263          	blt	a5,a0,3726 <target_usi_usart_init+0x46>
        return -1;
    }

    if (base != NULL) {
    36e6:	00058b63          	beqz	a1,36fc <target_usi_usart_init+0x1c>
        *base = sg_usi_config[idx].base;
    36ea:	47b1                	li	a5,12
    36ec:	02f50733          	mul	a4,a0,a5
    36f0:	6795                	lui	a5,0x5
    36f2:	13878793          	addi	a5,a5,312 # 5138 <sg_usi_config>
    36f6:	97ba                	add	a5,a5,a4
    36f8:	439c                	lw	a5,0(a5)
    36fa:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    36fc:	ca11                	beqz	a2,3710 <target_usi_usart_init+0x30>
        *irq = sg_usi_config[idx].irq;
    36fe:	47b1                	li	a5,12
    3700:	02f50733          	mul	a4,a0,a5
    3704:	6795                	lui	a5,0x5
    3706:	13878793          	addi	a5,a5,312 # 5138 <sg_usi_config>
    370a:	97ba                	add	a5,a5,a4
    370c:	43dc                	lw	a5,4(a5)
    370e:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    3710:	ce81                	beqz	a3,3728 <target_usi_usart_init+0x48>
        *handler = sg_usi_config[idx].handler;
    3712:	47b1                	li	a5,12
    3714:	02f50733          	mul	a4,a0,a5
    3718:	6795                	lui	a5,0x5
    371a:	13878793          	addi	a5,a5,312 # 5138 <sg_usi_config>
    371e:	97ba                	add	a5,a5,a4
    3720:	479c                	lw	a5,8(a5)
    3722:	c29c                	sw	a5,0(a3)
    3724:	8082                	ret
        return -1;
    3726:	557d                	li	a0,-1
    }

    return idx;
}
    3728:	8082                	ret

0000372a <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    372a:	cd05                	beqz	a0,3762 <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    372c:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    3730:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3732:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    3736:	02d706b3          	mul	a3,a4,a3
    373a:	20002737          	lui	a4,0x20002
    373e:	95070713          	addi	a4,a4,-1712 # 20001950 <gpio_handle>
    uint32_t port_value = value << offset;
    3742:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    3746:	4785                	li	a5,1
    3748:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    374c:	fff7c793          	not	a5,a5

    return 0;
    3750:	4501                	li	a0,0
    port_handle->value = port_value;
    3752:	9736                	add	a4,a4,a3
    3754:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3756:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    3758:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    375a:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    375c:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    375e:	c30c                	sw	a1,0(a4)
    return 0;
    3760:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3762:	81010537          	lui	a0,0x81010
    3766:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    376a:	8082                	ret

0000376c <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    376c:	47e1                	li	a5,24
    376e:	02f50733          	mul	a4,a0,a5
    3772:	200027b7          	lui	a5,0x20002
    3776:	96c78793          	addi	a5,a5,-1684 # 2000196c <timer_instance>
    377a:	97ba                	add	a5,a5,a4
    377c:	4705                	li	a4,1
    377e:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3780:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3782:	47dc                	lw	a5,12(a5)
    addr->TxEOI;
    3784:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    3786:	c399                	beqz	a5,378c <wj_oip_timer_irqhandler+0x20>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3788:	4581                	li	a1,0
    378a:	8782                	jr	a5
    }

}
    378c:	8082                	ret

0000378e <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    378e:	1111                	addi	sp,sp,-28
    3790:	cc06                	sw	ra,24(sp)
    3792:	ca22                	sw	s0,20(sp)
    3794:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    3796:	47bd                	li	a5,15
    3798:	00a7f963          	bgeu	a5,a0,37aa <csi_timer_initialize+0x1c>
        return NULL;
    379c:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    379e:	40e2                	lw	ra,24(sp)
    37a0:	8522                	mv	a0,s0
    37a2:	4452                	lw	s0,20(sp)
    37a4:	44c2                	lw	s1,16(sp)
    37a6:	0171                	addi	sp,sp,28
    37a8:	8082                	ret
    37aa:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    37ac:	0074                	addi	a3,sp,12
    37ae:	0030                	addi	a2,sp,8
    37b0:	004c                	addi	a1,sp,4
    37b2:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    37b4:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    37b6:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    37b8:	3565                	jal	3660 <target_get_timer>
    if (real_idx != idx) {
    37ba:	4702                	lw	a4,0(sp)
    37bc:	fea710e3          	bne	a4,a0,379c <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    37c0:	4461                	li	s0,24
    37c2:	028707b3          	mul	a5,a4,s0
    37c6:	20002437          	lui	s0,0x20002
    37ca:	96c40413          	addi	s0,s0,-1684 # 2000196c <timer_instance>
    timer_priv->irq  = irq;
    37ce:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    37d0:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    37d2:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    37d4:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    37d6:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    37d8:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    37dc:	c05c                	sw	a5,4(s0)
    37de:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    37e0:	2ae1                	jal	39b8 <drv_get_timer_freq>
    37e2:	577d                	li	a4,-1
    37e4:	02a75733          	divu	a4,a4,a0
    37e8:	000f4537          	lui	a0,0xf4
    37ec:	24050513          	addi	a0,a0,576 # f4240 <__min_heap_size+0xd4240>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    37f0:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    37f2:	02a70733          	mul	a4,a4,a0
    37f6:	c818                	sw	a4,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    37f8:	4798                	lw	a4,8(a5)
    37fa:	01e77693          	andi	a3,a4,30
    37fe:	0087c703          	lbu	a4,8(a5)
    3802:	9b01                	andi	a4,a4,-32
    3804:	8f55                	or	a4,a4,a3
    3806:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    380a:	4798                	lw	a4,8(a5)
    380c:	8b7d                	andi	a4,a4,31
    380e:	00476693          	ori	a3,a4,4
    3812:	0087c703          	lbu	a4,8(a5)
    3816:	9b01                	andi	a4,a4,-32
    3818:	8f55                	or	a4,a4,a3
    381a:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    381e:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3820:	dcbd                	beqz	s1,379e <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3822:	4408                	lw	a0,8(s0)
    3824:	45b2                	lw	a1,12(sp)
    3826:	c4eff0ef          	jal	ra,2c74 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    382a:	4408                	lw	a0,8(s0)
    382c:	c30ff0ef          	jal	ra,2c5c <drv_irq_enable>
    3830:	b7bd                	j	379e <csi_timer_initialize+0x10>

00003832 <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3832:	c511                	beqz	a0,383e <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3834:	415c                	lw	a5,4(a0)

    switch (mode) {
    3836:	c989                	beqz	a1,3848 <csi_timer_config+0x16>
    3838:	4705                	li	a4,1
    383a:	02e58c63          	beq	a1,a4,3872 <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    383e:	81070537          	lui	a0,0x81070
    3842:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3846:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3848:	4798                	lw	a4,8(a5)
    384a:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    384e:	0087c703          	lbu	a4,8(a5)
    return 0;
    3852:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3854:	9b01                	andi	a4,a4,-32
    3856:	8f55                	or	a4,a4,a3
    3858:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    385c:	4798                	lw	a4,8(a5)
    385e:	8b7d                	andi	a4,a4,31
    3860:	01076693          	ori	a3,a4,16
    3864:	0087c703          	lbu	a4,8(a5)
    3868:	9b01                	andi	a4,a4,-32
    386a:	8f55                	or	a4,a4,a3
    386c:	00e78423          	sb	a4,8(a5)
    return 0;
    3870:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3872:	4798                	lw	a4,8(a5)
    3874:	8b7d                	andi	a4,a4,31
    3876:	00276693          	ori	a3,a4,2
    387a:	bfd1                	j	384e <csi_timer_config+0x1c>

0000387c <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    387c:	c501                	beqz	a0,3884 <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    387e:	c90c                	sw	a1,16(a0)
    return 0;
    3880:	4501                	li	a0,0
    3882:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3884:	81070537          	lui	a0,0x81070
    3888:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    388c:	8082                	ret

0000388e <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    388e:	c545                	beqz	a0,3936 <csi_timer_start+0xa8>
{
    3890:	1141                	addi	sp,sp,-16
    3892:	c606                	sw	ra,12(sp)
    3894:	c422                	sw	s0,8(sp)
    3896:	c226                	sw	s1,4(sp)
    3898:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    389a:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    389e:	00054503          	lbu	a0,0(a0)
    38a2:	000f44b7          	lui	s1,0xf4
    38a6:	24048493          	addi	s1,s1,576 # f4240 <__min_heap_size+0xd4240>
    38aa:	2239                	jal	39b8 <drv_get_timer_freq>
    38ac:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    38b0:	00044503          	lbu	a0,0(s0)
    38b4:	2211                	jal	39b8 <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    38b6:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    38b8:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    38bc:	e08d                	bnez	s1,38de <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    38be:	00044503          	lbu	a0,0(s0)
    38c2:	c03e                	sw	a5,0(sp)
    38c4:	28d5                	jal	39b8 <drv_get_timer_freq>
    38c6:	4782                	lw	a5,0(sp)
    38c8:	000f4637          	lui	a2,0xf4
    38cc:	24060613          	addi	a2,a2,576 # f4240 <__min_heap_size+0xd4240>
    38d0:	4681                	li	a3,0
    38d2:	02f525b3          	mulhsu	a1,a0,a5
    38d6:	02a78533          	mul	a0,a5,a0
    38da:	91dfc0ef          	jal	ra,1f6 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    38de:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    38e0:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    38e2:	e729                	bnez	a4,392c <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    38e4:	577d                	li	a4,-1
    38e6:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    38e8:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    38ea:	40b2                	lw	ra,12(sp)
    38ec:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    38ee:	01e77693          	andi	a3,a4,30
    38f2:	0087c703          	lbu	a4,8(a5)
}
    38f6:	4492                	lw	s1,4(sp)
    return 0;
    38f8:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    38fa:	9b01                	andi	a4,a4,-32
    38fc:	8f55                	or	a4,a4,a3
    38fe:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3902:	4798                	lw	a4,8(a5)
    3904:	8b7d                	andi	a4,a4,31
    3906:	00176693          	ori	a3,a4,1
    390a:	0087c703          	lbu	a4,8(a5)
    390e:	9b01                	andi	a4,a4,-32
    3910:	8f55                	or	a4,a4,a3
    3912:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3916:	4798                	lw	a4,8(a5)
    3918:	01b77693          	andi	a3,a4,27
    391c:	0087c703          	lbu	a4,8(a5)
    3920:	9b01                	andi	a4,a4,-32
    3922:	8f55                	or	a4,a4,a3
    3924:	00e78423          	sb	a4,8(a5)
}
    3928:	0141                	addi	sp,sp,16
    392a:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    392c:	4798                	lw	a4,8(a5)
    392e:	8b75                	andi	a4,a4,29
    3930:	db55                	beqz	a4,38e4 <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3932:	c388                	sw	a0,0(a5)
    3934:	bf55                	j	38e8 <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3936:	81070537          	lui	a0,0x81070
    393a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    393e:	8082                	ret

00003940 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3940:	c901                	beqz	a0,3950 <csi_timer_get_current_value+0x10>
    TIMER_NULL_PARAM_CHK(value);
    3942:	00058763          	beqz	a1,3950 <csi_timer_get_current_value+0x10>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3946:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3948:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    394a:	43dc                	lw	a5,4(a5)
    394c:	c19c                	sw	a5,0(a1)
    return 0;
    394e:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3950:	81070537          	lui	a0,0x81070
    3954:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3958:	8082                	ret

0000395a <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    395a:	4501                	li	a0,0
    395c:	bd01                	j	376c <wj_oip_timer_irqhandler>

0000395e <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    395e:	4505                	li	a0,1
    3960:	b531                	j	376c <wj_oip_timer_irqhandler>

00003962 <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3962:	4509                	li	a0,2
    3964:	b521                	j	376c <wj_oip_timer_irqhandler>

00003966 <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3966:	450d                	li	a0,3
    3968:	b511                	j	376c <wj_oip_timer_irqhandler>

0000396a <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    396a:	4511                	li	a0,4
    396c:	b501                	j	376c <wj_oip_timer_irqhandler>

0000396e <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    396e:	4515                	li	a0,5
    3970:	bbf5                	j	376c <wj_oip_timer_irqhandler>

00003972 <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3972:	4519                	li	a0,6
    3974:	bbe5                	j	376c <wj_oip_timer_irqhandler>

00003976 <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3976:	451d                	li	a0,7
    3978:	bbd5                	j	376c <wj_oip_timer_irqhandler>

0000397a <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    397a:	4521                	li	a0,8
    397c:	bbc5                	j	376c <wj_oip_timer_irqhandler>

0000397e <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    397e:	4525                	li	a0,9
    3980:	b3f5                	j	376c <wj_oip_timer_irqhandler>

00003982 <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3982:	4529                	li	a0,10
    3984:	b3e5                	j	376c <wj_oip_timer_irqhandler>

00003986 <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3986:	452d                	li	a0,11
    3988:	b3d5                	j	376c <wj_oip_timer_irqhandler>

0000398a <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    398a:	4531                	li	a0,12
    398c:	b3c5                	j	376c <wj_oip_timer_irqhandler>

0000398e <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    398e:	4535                	li	a0,13
    3990:	bbf1                	j	376c <wj_oip_timer_irqhandler>

00003992 <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3992:	4539                	li	a0,14
    3994:	bbe1                	j	376c <wj_oip_timer_irqhandler>

00003996 <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3996:	453d                	li	a0,15
    3998:	bbd1                	j	376c <wj_oip_timer_irqhandler>

0000399a <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    399a:	4501                	li	a0,0
    399c:	b36ff06f          	j	2cd2 <wj_usi_irqhandler>

000039a0 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    39a0:	4505                	li	a0,1
    39a2:	b30ff06f          	j	2cd2 <wj_usi_irqhandler>

000039a6 <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    39a6:	4509                	li	a0,2
    39a8:	b2aff06f          	j	2cd2 <wj_usi_irqhandler>

000039ac <drv_get_usi_freq>:
    39ac:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    39b0:	8082                	ret

000039b2 <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    39b2:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    39b6:	8082                	ret

000039b8 <drv_get_timer_freq>:
    39b8:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    39bc:	8082                	ret

000039be <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    39be:	e000e737          	lui	a4,0xe000e
{
    39c2:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    39c4:	10070713          	addi	a4,a4,256 # e000e100 <__heap_end+0xbffde100>
    39c8:	6785                	lui	a5,0x1
{
    39ca:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    39cc:	97ba                	add	a5,a5,a4
    39ce:	4691                	li	a3,4
{
    39d0:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    39d2:	b0d78023          	sb	a3,-1280(a5) # b00 <__adddf3+0x24c>

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    39d6:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    39da:	4781                	li	a5,0
    39dc:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    39de:	00f70633          	add	a2,a4,a5
    39e2:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    39e6:	0785                	addi	a5,a5,1
    39e8:	fed79be3          	bne	a5,a3,39de <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    39ec:	450d                	li	a0,3
    39ee:	a6eff0ef          	jal	ra,2c5c <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    39f2:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    39f6:	3f75                	jal	39b2 <drv_get_sys_freq>
    39f8:	06400793          	li	a5,100
    39fc:	02f54533          	div	a0,a0,a5
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__STATIC_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3a00:	010007b7          	lui	a5,0x1000
    3a04:	157d                	addi	a0,a0,-1
    3a06:	00f57763          	bgeu	a0,a5,3a14 <SystemInit+0x56>
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3a0a:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3a0c:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3a10:	479d                	li	a5,7
    3a12:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3a14:	4412                	lw	s0,4(sp)
    3a16:	40a2                	lw	ra,8(sp)
    3a18:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3a1a:	a459                	j	3ca0 <mm_heap_initialize>

00003a1c <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3a1c:	1131                	addi	sp,sp,-20
    3a1e:	c622                	sw	s0,12(sp)
    3a20:	c806                	sw	ra,16(sp)
    3a22:	c426                	sw	s1,8(sp)
    3a24:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3a26:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3a2a:	6515                	lui	a0,0x5
    3a2c:	3ff5f593          	andi	a1,a1,1023
    3a30:	15c50513          	addi	a0,a0,348 # 515c <sg_usi_config+0x24>
    3a34:	7e6000ef          	jal	ra,421a <printf>
    printf("\n");
    3a38:	4529                	li	a0,10
    3a3a:	0f7000ef          	jal	ra,4330 <putchar>

    for (i = 0; i < 15; i++) {
    3a3e:	87a2                	mv	a5,s0
    3a40:	4481                	li	s1,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3a42:	4390                	lw	a2,0(a5)
    3a44:	c226                	sw	s1,4(sp)
    3a46:	c03e                	sw	a5,0(sp)
    3a48:	0485                	addi	s1,s1,1
    3a4a:	6795                	lui	a5,0x5
    3a4c:	17478513          	addi	a0,a5,372 # 5174 <sg_usi_config+0x3c>
    3a50:	85a6                	mv	a1,s1
    3a52:	7c8000ef          	jal	ra,421a <printf>

        if ((i % 4) == 3) {
    3a56:	4712                	lw	a4,4(sp)
    3a58:	468d                	li	a3,3
    3a5a:	4782                	lw	a5,0(sp)
    3a5c:	8b0d                	andi	a4,a4,3
    3a5e:	00d71663          	bne	a4,a3,3a6a <trap_c+0x4e>
            printf("\n");
    3a62:	4529                	li	a0,10
    3a64:	0cd000ef          	jal	ra,4330 <putchar>
    3a68:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3a6a:	473d                	li	a4,15
    3a6c:	0791                	addi	a5,a5,4
    3a6e:	fce49ae3          	bne	s1,a4,3a42 <trap_c+0x26>
        }
    }

    printf("\n");
    3a72:	4529                	li	a0,10
    3a74:	0bd000ef          	jal	ra,4330 <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3a78:	5c4c                	lw	a1,60(s0)
    3a7a:	6515                	lui	a0,0x5
    3a7c:	18050513          	addi	a0,a0,384 # 5180 <sg_usi_config+0x48>
    3a80:	79a000ef          	jal	ra,421a <printf>
    printf("mstatus: %08x\n", regs[16]);
    3a84:	402c                	lw	a1,64(s0)
    3a86:	6515                	lui	a0,0x5
    3a88:	19050513          	addi	a0,a0,400 # 5190 <sg_usi_config+0x58>
    3a8c:	78e000ef          	jal	ra,421a <printf>

    if (trap_c_callback) {
    3a90:	0101a783          	lw	a5,16(gp) # 200004f8 <trap_c_callback>
    3a94:	c391                	beqz	a5,3a98 <trap_c+0x7c>
        trap_c_callback();
    3a96:	9782                	jalr	a5
    }

    while (1);
    3a98:	a001                	j	3a98 <trap_c+0x7c>

00003a9a <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3a9a:	00059763          	bnez	a1,3aa8 <timer_cb_fun+0xe>
        Timer_LoopCount++;
    3a9e:	01c18793          	addi	a5,gp,28 # 20000504 <Timer_LoopCount>
    3aa2:	4398                	lw	a4,0(a5)
    3aa4:	0705                	addi	a4,a4,1
    3aa6:	c398                	sw	a4,0(a5)
    }
}
    3aa8:	8082                	ret

00003aaa <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3aaa:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3aac:	6591                	lui	a1,0x4
{
    3aae:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3ab0:	a9a58593          	addi	a1,a1,-1382 # 3a9a <timer_cb_fun>
    3ab4:	4501                	li	a0,0
{
    3ab6:	c806                	sw	ra,16(sp)
    3ab8:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3aba:	02418413          	addi	s0,gp,36 # 2000050c <timer_handle>
    3abe:	39c1                	jal	378e <csi_timer_initialize>
    3ac0:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3ac2:	e901                	bnez	a0,3ad2 <clock_timer_init+0x28>
        return -1;
    3ac4:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3ac6:	40c2                	lw	ra,16(sp)
    3ac8:	4432                	lw	s0,12(sp)
    3aca:	8526                	mv	a0,s1
    3acc:	44a2                	lw	s1,8(sp)
    3ace:	0151                	addi	sp,sp,20
    3ad0:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3ad2:	4501                	li	a0,0
    3ad4:	35d5                	jal	39b8 <drv_get_timer_freq>
    3ad6:	00a1aa23          	sw	a0,20(gp) # 200004fc <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3ada:	000f47b7          	lui	a5,0xf4
    3ade:	24078793          	addi	a5,a5,576 # f4240 <__min_heap_size+0xd4240>
    3ae2:	02f55533          	divu	a0,a0,a5
    3ae6:	009894b7          	lui	s1,0x989
    3aea:	68048493          	addi	s1,s1,1664 # 989680 <__min_heap_size+0x969680>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3aee:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3af0:	02950533          	mul	a0,a0,s1
    3af4:	00a1ac23          	sw	a0,24(gp) # 20000500 <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3af8:	4008                	lw	a0,0(s0)
    3afa:	3b25                	jal	3832 <csi_timer_config>
    if (ret != 0) {
    3afc:	f561                	bnez	a0,3ac4 <clock_timer_init+0x1a>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3afe:	4008                	lw	a0,0(s0)
    3b00:	85a6                	mv	a1,s1
    3b02:	3bad                	jal	387c <csi_timer_set_timeout>
    3b04:	84aa                	mv	s1,a0
    if (ret != 0) {
    3b06:	fd5d                	bnez	a0,3ac4 <clock_timer_init+0x1a>
    csi_timer_get_current_value(timer_handle, &cv1);
    3b08:	4008                	lw	a0,0(s0)
    3b0a:	858a                	mv	a1,sp
    3b0c:	3d15                	jal	3940 <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3b0e:	4008                	lw	a0,0(s0)
    3b10:	004c                	addi	a1,sp,4
    3b12:	353d                	jal	3940 <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3b14:	4712                	lw	a4,4(sp)
    3b16:	4782                	lw	a5,0(sp)
    3b18:	fae7f7e3          	bgeu	a5,a4,3ac6 <clock_timer_init+0x1c>
        timer_count_rise = 1;
    3b1c:	4705                	li	a4,1
    3b1e:	02e18023          	sb	a4,32(gp) # 20000508 <timer_count_rise>
    3b22:	b755                	j	3ac6 <clock_timer_init+0x1c>

00003b24 <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3b24:	0001ae23          	sw	zero,28(gp) # 20000504 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3b28:	0241a503          	lw	a0,36(gp) # 2000050c <timer_handle>
{
    3b2c:	1151                	addi	sp,sp,-12
    3b2e:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3b30:	3bb9                	jal	388e <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3b32:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3b34:	00a03533          	snez	a0,a0
}
    3b38:	40a00533          	neg	a0,a0
    3b3c:	0131                	addi	sp,sp,12
    3b3e:	8082                	ret

00003b40 <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3b40:	1151                	addi	sp,sp,-12
    3b42:	c222                	sw	s0,4(sp)
    3b44:	c026                	sw	s1,0(sp)
    3b46:	6419                	lui	s0,0x6
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3b48:	6499                	lui	s1,0x6
{
    3b4a:	c406                	sw	ra,8(sp)
    3b4c:	91840413          	addi	s0,s0,-1768 # 5918 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3b50:	91848493          	addi	s1,s1,-1768 # 5918 <__ctor_end__>
    3b54:	1471                	addi	s0,s0,-4
    3b56:	00947763          	bgeu	s0,s1,3b64 <_init+0x24>
        (*p) ();
    }
}
    3b5a:	40a2                	lw	ra,8(sp)
    3b5c:	4412                	lw	s0,4(sp)
    3b5e:	4482                	lw	s1,0(sp)
    3b60:	0131                	addi	sp,sp,12
    3b62:	8082                	ret
        (*p) ();
    3b64:	401c                	lw	a5,0(s0)
    3b66:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3b68:	b7f5                	j	3b54 <_init+0x14>

00003b6a <_fini>:

CPP_WEAK void _fini(void)
{
    3b6a:	1151                	addi	sp,sp,-12
    3b6c:	c222                	sw	s0,4(sp)
    3b6e:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3b70:	6419                	lui	s0,0x6
    3b72:	6499                	lui	s1,0x6
{
    3b74:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3b76:	91840413          	addi	s0,s0,-1768 # 5918 <__ctor_end__>
    3b7a:	91448493          	addi	s1,s1,-1772 # 5914 <pad_line+0x71c>
    3b7e:	0084f763          	bgeu	s1,s0,3b8c <_fini+0x22>
        (*p) ();
    }
}
    3b82:	40a2                	lw	ra,8(sp)
    3b84:	4412                	lw	s0,4(sp)
    3b86:	4482                	lw	s1,0(sp)
    3b88:	0131                	addi	sp,sp,12
    3b8a:	8082                	ret
        (*p) ();
    3b8c:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3b8e:	0411                	addi	s0,s0,4
        (*p) ();
    3b90:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3b92:	b7f5                	j	3b7e <_fini+0x14>

00003b94 <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3b94:	1151                	addi	sp,sp,-12
    3b96:	c026                	sw	s1,0(sp)
    3b98:	84aa                	mv	s1,a0
    (void)stream;

    if (console_handle == NULL) {
    3b9a:	0281a503          	lw	a0,40(gp) # 20000510 <console_handle>
{
    3b9e:	c406                	sw	ra,8(sp)
    3ba0:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3ba2:	c115                	beqz	a0,3bc6 <fputc+0x32>
    3ba4:	02818413          	addi	s0,gp,40 # 20000510 <console_handle>
        return -1;
    }

    if (ch == '\n') {
    3ba8:	47a9                	li	a5,10
    3baa:	00f49463          	bne	s1,a5,3bb2 <fputc+0x1e>
        csi_usart_putchar(console_handle, '\r');
    3bae:	45b5                	li	a1,13
    3bb0:	346d                	jal	365a <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3bb2:	4008                	lw	a0,0(s0)
    3bb4:	0ff4f593          	andi	a1,s1,255
    3bb8:	344d                	jal	365a <csi_usart_putchar>

    return 0;
    3bba:	4501                	li	a0,0
}
    3bbc:	40a2                	lw	ra,8(sp)
    3bbe:	4412                	lw	s0,4(sp)
    3bc0:	4482                	lw	s1,0(sp)
    3bc2:	0131                	addi	sp,sp,12
    3bc4:	8082                	ret
        return -1;
    3bc6:	557d                	li	a0,-1
    3bc8:	bfd5                	j	3bbc <fputc+0x28>

00003bca <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3bca:	4501                	li	a0,0
    3bcc:	8082                	ret

00003bce <os_critical_exit>:
    3bce:	4501                	li	a0,0
    3bd0:	8082                	ret

00003bd2 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3bd2:	1151                	addi	sp,sp,-12
    3bd4:	c026                	sw	s1,0(sp)
    3bd6:	84aa                	mv	s1,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3bd8:	4188                	lw	a0,0(a1)
{
    3bda:	c222                	sw	s0,4(sp)
    3bdc:	c406                	sw	ra,8(sp)
    3bde:	842e                	mv	s0,a1
  int ndx = mm_size2ndx(node->size);
    3be0:	20cd                	jal	3cc2 <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3be2:	0505                	addi	a0,a0,1
    3be4:	0512                	slli	a0,a0,0x4
    3be6:	00850713          	addi	a4,a0,8
    3bea:	9726                	add	a4,a4,s1
    3bec:	94aa                	add	s1,s1,a0
    3bee:	489c                	lw	a5,16(s1)
    3bf0:	c791                	beqz	a5,3bfc <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3bf2:	4394                	lw	a3,0(a5)
    3bf4:	c681                	beqz	a3,3bfc <mm_addfreechunk+0x2a>
    3bf6:	4010                	lw	a2,0(s0)
    3bf8:	00c6ec63          	bltu	a3,a2,3c10 <mm_addfreechunk+0x3e>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3bfc:	c700                	sw	s0,8(a4)
  node->blink = prev;
    3bfe:	c458                	sw	a4,12(s0)
  node->flink = next;
    3c00:	c41c                	sw	a5,8(s0)

  if (next)
    3c02:	c391                	beqz	a5,3c06 <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3c04:	c7c0                	sw	s0,12(a5)
    }
}
    3c06:	40a2                	lw	ra,8(sp)
    3c08:	4412                	lw	s0,4(sp)
    3c0a:	4482                	lw	s1,0(sp)
    3c0c:	0131                	addi	sp,sp,12
    3c0e:	8082                	ret
       prev = next, next = next->flink);
    3c10:	873e                	mv	a4,a5
    3c12:	479c                	lw	a5,8(a5)
    3c14:	bff1                	j	3bf0 <mm_addfreechunk+0x1e>

00003c16 <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3c16:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3c1a:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3c1c:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3c1e:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3c20:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3c22:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3c26:	95be                	add	a1,a1,a5
    3c28:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3c2a:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3c2c:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3c2e:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3c32:	17c1                	addi	a5,a5,-16
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3c34:	00572223          	sw	t0,4(a4)
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3c38:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3c3a:	00672023          	sw	t1,0(a4)
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3c3e:	00672623          	sw	t1,12(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3c42:	00870593          	addi	a1,a4,8

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3c46:	ff860713          	addi	a4,a2,-8
    3c4a:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3c4c:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3c50:	0057e7b3          	or	a5,a5,t0
    3c54:	c35c                	sw	a5,4(a4)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3c56:	bfb5                	j	3bd2 <mm_addfreechunk>

00003c58 <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3c58:	1141                	addi	sp,sp,-16
    3c5a:	c422                	sw	s0,8(sp)
    3c5c:	c226                	sw	s1,4(sp)
    3c5e:	c606                	sw	ra,12(sp)
    3c60:	842a                	mv	s0,a0
    3c62:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3c64:	00052623          	sw	zero,12(a0)
{
    3c68:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3c6a:	13000613          	li	a2,304
    3c6e:	4581                	li	a1,0
    3c70:	0561                	addi	a0,a0,24
    3c72:	e3afe0ef          	jal	ra,22ac <memset>
  for (i = 1; i < MM_NNODES; i++)
    3c76:	4702                	lw	a4,0(sp)
    3c78:	02840793          	addi	a5,s0,40
    3c7c:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3c80:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3c84:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3c88:	c7d0                	sw	a2,12(a5)
  for (i = 1; i < MM_NNODES; i++)
    3c8a:	07c1                	addi	a5,a5,16
    3c8c:	fed79ae3          	bne	a5,a3,3c80 <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3c90:	8522                	mv	a0,s0
}
    3c92:	4422                	lw	s0,8(sp)
    3c94:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3c96:	85a6                	mv	a1,s1
}
    3c98:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    3c9a:	863a                	mv	a2,a4
}
    3c9c:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    3c9e:	bfa5                	j	3c16 <mm_addregion>

00003ca0 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    3ca0:	200025b7          	lui	a1,0x20002
    3ca4:	200307b7          	lui	a5,0x20030
    3ca8:	cf458613          	addi	a2,a1,-780 # 20001cf4 <__bss_end__>
    3cac:	00078793          	mv	a5,a5
    3cb0:	20002537          	lui	a0,0x20002
    3cb4:	40c78633          	sub	a2,a5,a2
    3cb8:	cf458593          	addi	a1,a1,-780
    3cbc:	bac50513          	addi	a0,a0,-1108 # 20001bac <g_mmheap>
    3cc0:	bf61                	j	3c58 <mm_initialize>

00003cc2 <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    3cc2:	004007b7          	lui	a5,0x400
    3cc6:	00f57c63          	bgeu	a0,a5,3cde <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    3cca:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    3cce:	4705                	li	a4,1
  int ndx = 0;
    3cd0:	4501                	li	a0,0
  while (size > 1)
    3cd2:	00f76363          	bltu	a4,a5,3cd8 <mm_size2ndx+0x16>
    3cd6:	8082                	ret
    {
      ndx++;
    3cd8:	0505                	addi	a0,a0,1
      size >>= 1;
    3cda:	8385                	srli	a5,a5,0x1
    3cdc:	bfdd                	j	3cd2 <mm_size2ndx+0x10>
       return MM_NNODES-1;
    3cde:	4549                	li	a0,18
    }

  return ndx;
}
    3ce0:	8082                	ret

00003ce2 <main>:

#include <stdio.h>

int main(void)
{
    printf("Hello World!\n");
    3ce2:	6515                	lui	a0,0x5
{
    3ce4:	1151                	addi	sp,sp,-12
    printf("Hello World!\n");
    3ce6:	1a050513          	addi	a0,a0,416 # 51a0 <sg_usi_config+0x68>
{
    3cea:	c406                	sw	ra,8(sp)
    printf("Hello World!\n");
    3cec:	2da1                	jal	4344 <puts>

    return 0;
}
    3cee:	40a2                	lw	ra,8(sp)
    3cf0:	4501                	li	a0,0
    3cf2:	0131                	addi	sp,sp,12
    3cf4:	8082                	ret

00003cf6 <copystring>:
    3cf6:	4781                	li	a5,0
    3cf8:	470d                	li	a4,3
    3cfa:	00b7c463          	blt	a5,a1,3d02 <copystring+0xc>
    3cfe:	853e                	mv	a0,a5
    3d00:	8082                	ret
    3d02:	00f606b3          	add	a3,a2,a5
    3d06:	0006c303          	lbu	t1,0(a3)
    3d0a:	00f506b3          	add	a3,a0,a5
    3d0e:	0785                	addi	a5,a5,1
    3d10:	00668023          	sb	t1,0(a3)
    3d14:	fee793e3          	bne	a5,a4,3cfa <copystring+0x4>
    3d18:	feb7d3e3          	bge	a5,a1,3cfe <copystring+0x8>
    3d1c:	000501a3          	sb	zero,3(a0)
    3d20:	4791                	li	a5,4
    3d22:	bff1                	j	3cfe <copystring+0x8>

00003d24 <__dtostr>:
    3d24:	fa810113          	addi	sp,sp,-88
    3d28:	c8a2                	sw	s0,80(sp)
    3d2a:	ca86                	sw	ra,84(sp)
    3d2c:	c6a6                	sw	s1,76(sp)
    3d2e:	d02a                	sw	a0,32(sp)
    3d30:	c42e                	sw	a1,8(sp)
    3d32:	c032                	sw	a2,0(sp)
    3d34:	8436                	mv	s0,a3
    3d36:	d43a                	sw	a4,40(sp)
    3d38:	c23e                	sw	a5,4(sp)
    3d3a:	2ed5                	jal	412e <__isinf>
    3d3c:	cd01                	beqz	a0,3d54 <__dtostr+0x30>
    3d3e:	6615                	lui	a2,0x5
    3d40:	1e860613          	addi	a2,a2,488 # 51e8 <sg_usi_config+0xb0>
    3d44:	85a2                	mv	a1,s0
    3d46:	4446                	lw	s0,80(sp)
    3d48:	4502                	lw	a0,0(sp)
    3d4a:	40d6                	lw	ra,84(sp)
    3d4c:	44b6                	lw	s1,76(sp)
    3d4e:	05810113          	addi	sp,sp,88
    3d52:	b755                	j	3cf6 <copystring>
    3d54:	5702                	lw	a4,32(sp)
    3d56:	47a2                	lw	a5,8(sp)
    3d58:	853a                	mv	a0,a4
    3d5a:	85be                	mv	a1,a5
    3d5c:	2b15                	jal	4290 <__isnan>
    3d5e:	d22a                	sw	a0,36(sp)
    3d60:	c509                	beqz	a0,3d6a <__dtostr+0x46>
    3d62:	6615                	lui	a2,0x5
    3d64:	1ec60613          	addi	a2,a2,492 # 51ec <sg_usi_config+0xb4>
    3d68:	bff1                	j	3d44 <__dtostr+0x20>
    3d6a:	5702                	lw	a4,32(sp)
    3d6c:	47a2                	lw	a5,8(sp)
    3d6e:	4601                	li	a2,0
    3d70:	4681                	li	a3,0
    3d72:	853a                	mv	a0,a4
    3d74:	85be                	mv	a1,a5
    3d76:	ec6fd0ef          	jal	ra,143c <__eqdf2>
    3d7a:	e925                	bnez	a0,3dea <__dtostr+0xc6>
    3d7c:	4792                	lw	a5,4(sp)
    3d7e:	3a078363          	beqz	a5,4124 <__dtostr+0x400>
    3d82:	0789                	addi	a5,a5,2
    3d84:	02f46163          	bltu	s0,a5,3da6 <__dtostr+0x82>
    3d88:	cb85                	beqz	a5,3db8 <__dtostr+0x94>
    3d8a:	4722                	lw	a4,8(sp)
    3d8c:	04075c63          	bgez	a4,3de4 <__dtostr+0xc0>
    3d90:	4682                	lw	a3,0(sp)
    3d92:	02d00713          	li	a4,45
    3d96:	00e68023          	sb	a4,0(a3)
    3d9a:	00178713          	addi	a4,a5,1 # 400001 <__min_heap_size+0x3e0001>
    3d9e:	4785                	li	a5,1
    3da0:	03000693          	li	a3,48
    3da4:	a801                	j	3db4 <__dtostr+0x90>
    3da6:	47a1                	li	a5,8
    3da8:	b7cd                	j	3d8a <__dtostr+0x66>
    3daa:	4602                	lw	a2,0(sp)
    3dac:	963e                	add	a2,a2,a5
    3dae:	00d60023          	sb	a3,0(a2)
    3db2:	0785                	addi	a5,a5,1
    3db4:	fee7ebe3          	bltu	a5,a4,3daa <__dtostr+0x86>
    3db8:	4702                	lw	a4,0(sp)
    3dba:	03000693          	li	a3,48
    3dbe:	00074603          	lbu	a2,0(a4)
    3dc2:	4705                	li	a4,1
    3dc4:	00d60363          	beq	a2,a3,3dca <__dtostr+0xa6>
    3dc8:	4709                	li	a4,2
    3dca:	4682                	lw	a3,0(sp)
    3dcc:	9736                	add	a4,a4,a3
    3dce:	02e00693          	li	a3,46
    3dd2:	00d70023          	sb	a3,0(a4)
    3dd6:	4702                	lw	a4,0(sp)
    3dd8:	00f704b3          	add	s1,a4,a5
    3ddc:	00048023          	sb	zero,0(s1)
    3de0:	d23e                	sw	a5,36(sp)
    3de2:	a459                	j	4068 <__dtostr+0x344>
    3de4:	873e                	mv	a4,a5
    3de6:	4781                	li	a5,0
    3de8:	bf65                	j	3da0 <__dtostr+0x7c>
    3dea:	5702                	lw	a4,32(sp)
    3dec:	47a2                	lw	a5,8(sp)
    3dee:	4601                	li	a2,0
    3df0:	4681                	li	a3,0
    3df2:	853a                	mv	a0,a4
    3df4:	85be                	mv	a1,a5
    3df6:	f78fd0ef          	jal	ra,156e <__ledf2>
    3dfa:	16055f63          	bgez	a0,3f78 <__dtostr+0x254>
    3dfe:	47a2                	lw	a5,8(sp)
    3e00:	4702                	lw	a4,0(sp)
    3e02:	800002b7          	lui	t0,0x80000
    3e06:	00f2c2b3          	xor	t0,t0,a5
    3e0a:	02d00793          	li	a5,45
    3e0e:	00f70023          	sb	a5,0(a4)
    3e12:	147d                	addi	s0,s0,-1
    3e14:	00170493          	addi	s1,a4,1
    3e18:	6795                	lui	a5,0x5
    3e1a:	1b07a503          	lw	a0,432(a5) # 51b0 <sg_usi_config+0x78>
    3e1e:	1b47a583          	lw	a1,436(a5)
    3e22:	6795                	lui	a5,0x5
    3e24:	1c07a703          	lw	a4,448(a5) # 51c0 <sg_usi_config+0x88>
    3e28:	1c47a783          	lw	a5,452(a5)
    3e2c:	4381                	li	t2,0
    3e2e:	4692                	lw	a3,4(sp)
    3e30:	14d39763          	bne	t2,a3,3f7e <__dtostr+0x25a>
    3e34:	5702                	lw	a4,32(sp)
    3e36:	862a                	mv	a2,a0
    3e38:	86ae                	mv	a3,a1
    3e3a:	853a                	mv	a0,a4
    3e3c:	8596                	mv	a1,t0
    3e3e:	a77fc0ef          	jal	ra,8b4 <__adddf3>
    3e42:	6795                	lui	a5,0x5
    3e44:	1c87a603          	lw	a2,456(a5) # 51c8 <sg_usi_config+0x90>
    3e48:	1cc7a683          	lw	a3,460(a5)
    3e4c:	c82a                	sw	a0,16(sp)
    3e4e:	ca2e                	sw	a1,20(sp)
    3e50:	f1efd0ef          	jal	ra,156e <__ledf2>
    3e54:	00055863          	bgez	a0,3e64 <__dtostr+0x140>
    3e58:	03000793          	li	a5,48
    3e5c:	00f48023          	sb	a5,0(s1)
    3e60:	147d                	addi	s0,s0,-1
    3e62:	0485                	addi	s1,s1,1
    3e64:	47a2                	lw	a5,8(sp)
    3e66:	0147d513          	srli	a0,a5,0x14
    3e6a:	7ff57513          	andi	a0,a0,2047
    3e6e:	c0150513          	addi	a0,a0,-1023
    3e72:	aaafe0ef          	jal	ra,211c <__floatsidf>
    3e76:	6795                	lui	a5,0x5
    3e78:	1d07a603          	lw	a2,464(a5) # 51d0 <sg_usi_config+0x98>
    3e7c:	1d47a683          	lw	a3,468(a5)
    3e80:	fa4fd0ef          	jal	ra,1624 <__muldf3>
    3e84:	a34fe0ef          	jal	ra,20b8 <__fixdfsi>
    3e88:	00150793          	addi	a5,a0,1
    3e8c:	cc3e                	sw	a5,24(sp)
    3e8e:	22f05763          	blez	a5,40bc <__dtostr+0x398>
    3e92:	6695                	lui	a3,0x5
    3e94:	1d86a603          	lw	a2,472(a3) # 51d8 <sg_usi_config+0xa0>
    3e98:	82be                	mv	t0,a5
    3e9a:	1dc6a683          	lw	a3,476(a3)
    3e9e:	6795                	lui	a5,0x5
    3ea0:	1b87a703          	lw	a4,440(a5) # 51b8 <sg_usi_config+0x80>
    3ea4:	1bc7a783          	lw	a5,444(a5)
    3ea8:	43a9                	li	t2,10
    3eaa:	d632                	sw	a2,44(sp)
    3eac:	d836                	sw	a3,48(sp)
    3eae:	0e53e663          	bltu	t2,t0,3f9a <__dtostr+0x276>
    3eb2:	6695                	lui	a3,0x5
    3eb4:	1b86a603          	lw	a2,440(a3) # 51b8 <sg_usi_config+0x80>
    3eb8:	1bc6a683          	lw	a3,444(a3)
    3ebc:	4385                	li	t2,1
    3ebe:	d632                	sw	a2,44(sp)
    3ec0:	d836                	sw	a3,48(sp)
    3ec2:	0e729963          	bne	t0,t2,3fb4 <__dtostr+0x290>
    3ec6:	4685                	li	a3,1
    3ec8:	d636                	sw	a3,44(sp)
    3eca:	6695                	lui	a3,0x5
    3ecc:	1e06a603          	lw	a2,480(a3) # 51e0 <sg_usi_config+0xa8>
    3ed0:	1e46a683          	lw	a3,484(a3)
    3ed4:	da32                	sw	a2,52(sp)
    3ed6:	dc36                	sw	a3,56(sp)
    3ed8:	6695                	lui	a3,0x5
    3eda:	1b86a603          	lw	a2,440(a3) # 51b8 <sg_usi_config+0x80>
    3ede:	1bc6a683          	lw	a3,444(a3)
    3ee2:	de32                	sw	a2,60(sp)
    3ee4:	c0b6                	sw	a3,64(sp)
    3ee6:	5652                	lw	a2,52(sp)
    3ee8:	56e2                	lw	a3,56(sp)
    3eea:	853a                	mv	a0,a4
    3eec:	85be                	mv	a1,a5
    3eee:	c2ba                	sw	a4,68(sp)
    3ef0:	c4be                	sw	a5,72(sp)
    3ef2:	dc6fd0ef          	jal	ra,14b8 <__gedf2>
    3ef6:	4716                	lw	a4,68(sp)
    3ef8:	47a6                	lw	a5,72(sp)
    3efa:	0ca04a63          	bgtz	a0,3fce <__dtostr+0x2aa>
    3efe:	4682                	lw	a3,0(sp)
    3f00:	00d49a63          	bne	s1,a3,3f14 <__dtostr+0x1f0>
    3f04:	16040263          	beqz	s0,4068 <__dtostr+0x344>
    3f08:	03000693          	li	a3,48
    3f0c:	00d48023          	sb	a3,0(s1)
    3f10:	147d                	addi	s0,s0,-1
    3f12:	0485                	addi	s1,s1,1
    3f14:	4692                	lw	a3,4(sp)
    3f16:	ea81                	bnez	a3,3f26 <__dtostr+0x202>
    3f18:	4682                	lw	a3,0(sp)
    3f1a:	5622                	lw	a2,40(sp)
    3f1c:	40d486b3          	sub	a3,s1,a3
    3f20:	0685                	addi	a3,a3,1
    3f22:	04c6f563          	bgeu	a3,a2,3f6c <__dtostr+0x248>
    3f26:	14040163          	beqz	s0,4068 <__dtostr+0x344>
    3f2a:	02e00693          	li	a3,46
    3f2e:	00d48023          	sb	a3,0(s1)
    3f32:	4692                	lw	a3,4(sp)
    3f34:	147d                	addi	s0,s0,-1
    3f36:	00148293          	addi	t0,s1,1
    3f3a:	ea81                	bnez	a3,3f4a <__dtostr+0x226>
    3f3c:	56a2                	lw	a3,40(sp)
    3f3e:	4602                	lw	a2,0(sp)
    3f40:	0685                	addi	a3,a3,1
    3f42:	40c28633          	sub	a2,t0,a2
    3f46:	8e91                	sub	a3,a3,a2
    3f48:	c236                	sw	a3,4(sp)
    3f4a:	4692                	lw	a3,4(sp)
    3f4c:	10d46e63          	bltu	s0,a3,4068 <__dtostr+0x344>
    3f50:	8426                	mv	s0,s1
    3f52:	94b6                	add	s1,s1,a3
    3f54:	6695                	lui	a3,0x5
    3f56:	1b86a603          	lw	a2,440(a3) # 51b8 <sg_usi_config+0x80>
    3f5a:	1bc6a683          	lw	a3,444(a3)
    3f5e:	c432                	sw	a2,8(sp)
    3f60:	c636                	sw	a3,12(sp)
    3f62:	16941363          	bne	s0,s1,40c8 <__dtostr+0x3a4>
    3f66:	4792                	lw	a5,4(sp)
    3f68:	00f284b3          	add	s1,t0,a5
    3f6c:	4782                	lw	a5,0(sp)
    3f6e:	00048023          	sb	zero,0(s1)
    3f72:	40f487b3          	sub	a5,s1,a5
    3f76:	b5ad                	j	3de0 <__dtostr+0xbc>
    3f78:	4482                	lw	s1,0(sp)
    3f7a:	42a2                	lw	t0,8(sp)
    3f7c:	bd71                	j	3e18 <__dtostr+0xf4>
    3f7e:	863a                	mv	a2,a4
    3f80:	86be                	mv	a3,a5
    3f82:	d616                	sw	t0,44(sp)
    3f84:	cc1e                	sw	t2,24(sp)
    3f86:	c83a                	sw	a4,16(sp)
    3f88:	ca3e                	sw	a5,20(sp)
    3f8a:	e9afd0ef          	jal	ra,1624 <__muldf3>
    3f8e:	43e2                	lw	t2,24(sp)
    3f90:	52b2                	lw	t0,44(sp)
    3f92:	4742                	lw	a4,16(sp)
    3f94:	0385                	addi	t2,t2,1
    3f96:	47d2                	lw	a5,20(sp)
    3f98:	bd59                	j	3e2e <__dtostr+0x10a>
    3f9a:	5632                	lw	a2,44(sp)
    3f9c:	56c2                	lw	a3,48(sp)
    3f9e:	853a                	mv	a0,a4
    3fa0:	85be                	mv	a1,a5
    3fa2:	da16                	sw	t0,52(sp)
    3fa4:	e80fd0ef          	jal	ra,1624 <__muldf3>
    3fa8:	52d2                	lw	t0,52(sp)
    3faa:	872a                	mv	a4,a0
    3fac:	87ae                	mv	a5,a1
    3fae:	12d9                	addi	t0,t0,-10
    3fb0:	43a9                	li	t2,10
    3fb2:	bdf5                	j	3eae <__dtostr+0x18a>
    3fb4:	5632                	lw	a2,44(sp)
    3fb6:	56c2                	lw	a3,48(sp)
    3fb8:	853a                	mv	a0,a4
    3fba:	85be                	mv	a1,a5
    3fbc:	da16                	sw	t0,52(sp)
    3fbe:	e66fd0ef          	jal	ra,1624 <__muldf3>
    3fc2:	52d2                	lw	t0,52(sp)
    3fc4:	872a                	mv	a4,a0
    3fc6:	87ae                	mv	a5,a1
    3fc8:	12fd                	addi	t0,t0,-1
    3fca:	4385                	li	t2,1
    3fcc:	bddd                	j	3ec2 <__dtostr+0x19e>
    3fce:	4542                	lw	a0,16(sp)
    3fd0:	45d2                	lw	a1,20(sp)
    3fd2:	863a                	mv	a2,a4
    3fd4:	86be                	mv	a3,a5
    3fd6:	c2ba                	sw	a4,68(sp)
    3fd8:	c4be                	sw	a5,72(sp)
    3fda:	ed1fc0ef          	jal	ra,eaa <__divdf3>
    3fde:	8dafe0ef          	jal	ra,20b8 <__fixdfsi>
    3fe2:	5632                	lw	a2,44(sp)
    3fe4:	0ff57693          	andi	a3,a0,255
    3fe8:	4716                	lw	a4,68(sp)
    3fea:	47a6                	lw	a5,72(sp)
    3fec:	c211                	beqz	a2,3ff0 <__dtostr+0x2cc>
    3fee:	ced5                	beqz	a3,40aa <__dtostr+0x386>
    3ff0:	03068693          	addi	a3,a3,48
    3ff4:	00d48023          	sb	a3,0(s1)
    3ff8:	0485                	addi	s1,s1,1
    3ffa:	ec35                	bnez	s0,4076 <__dtostr+0x352>
    3ffc:	863a                	mv	a2,a4
    3ffe:	86be                	mv	a3,a5
    4000:	5702                	lw	a4,32(sp)
    4002:	47a2                	lw	a5,8(sp)
    4004:	853a                	mv	a0,a4
    4006:	85be                	mv	a1,a5
    4008:	ea3fc0ef          	jal	ra,eaa <__divdf3>
    400c:	4792                	lw	a5,4(sp)
    400e:	5722                	lw	a4,40(sp)
    4010:	4602                	lw	a2,0(sp)
    4012:	4681                	li	a3,0
    4014:	3b01                	jal	3d24 <__dtostr>
    4016:	c929                	beqz	a0,4068 <__dtostr+0x344>
    4018:	00a48333          	add	t1,s1,a0
    401c:	06500793          	li	a5,101
    4020:	00f30023          	sb	a5,0(t1)
    4024:	00130493          	addi	s1,t1,1
    4028:	fff54513          	not	a0,a0
    402c:	4711                	li	a4,4
    402e:	4685                	li	a3,1
    4030:	3e800793          	li	a5,1000
    4034:	4629                	li	a2,10
    4036:	45e2                	lw	a1,24(sp)
    4038:	00f5d363          	bge	a1,a5,403e <__dtostr+0x31a>
    403c:	e285                	bnez	a3,405c <__dtostr+0x338>
    403e:	c909                	beqz	a0,4050 <__dtostr+0x32c>
    4040:	46e2                	lw	a3,24(sp)
    4042:	0485                	addi	s1,s1,1
    4044:	02f6c6b3          	div	a3,a3,a5
    4048:	03068693          	addi	a3,a3,48
    404c:	fed48fa3          	sb	a3,-1(s1)
    4050:	46e2                	lw	a3,24(sp)
    4052:	157d                	addi	a0,a0,-1
    4054:	02f6e6b3          	rem	a3,a3,a5
    4058:	cc36                	sw	a3,24(sp)
    405a:	4681                	li	a3,0
    405c:	177d                	addi	a4,a4,-1
    405e:	02c7c7b3          	div	a5,a5,a2
    4062:	fb71                	bnez	a4,4036 <__dtostr+0x312>
    4064:	f00514e3          	bnez	a0,3f6c <__dtostr+0x248>
    4068:	40d6                	lw	ra,84(sp)
    406a:	4446                	lw	s0,80(sp)
    406c:	5512                	lw	a0,36(sp)
    406e:	44b6                	lw	s1,76(sp)
    4070:	05810113          	addi	sp,sp,88
    4074:	8082                	ret
    4076:	0ff57513          	andi	a0,a0,255
    407a:	d63a                	sw	a4,44(sp)
    407c:	d83e                	sw	a5,48(sp)
    407e:	89efe0ef          	jal	ra,211c <__floatsidf>
    4082:	5732                	lw	a4,44(sp)
    4084:	57c2                	lw	a5,48(sp)
    4086:	147d                	addi	s0,s0,-1
    4088:	863a                	mv	a2,a4
    408a:	86be                	mv	a3,a5
    408c:	c2ba                	sw	a4,68(sp)
    408e:	c4be                	sw	a5,72(sp)
    4090:	d94fd0ef          	jal	ra,1624 <__muldf3>
    4094:	862a                	mv	a2,a0
    4096:	86ae                	mv	a3,a1
    4098:	4542                	lw	a0,16(sp)
    409a:	45d2                	lw	a1,20(sp)
    409c:	a11fd0ef          	jal	ra,1aac <__subdf3>
    40a0:	4716                	lw	a4,68(sp)
    40a2:	47a6                	lw	a5,72(sp)
    40a4:	c82a                	sw	a0,16(sp)
    40a6:	ca2e                	sw	a1,20(sp)
    40a8:	d602                	sw	zero,44(sp)
    40aa:	5672                	lw	a2,60(sp)
    40ac:	4686                	lw	a3,64(sp)
    40ae:	853a                	mv	a0,a4
    40b0:	85be                	mv	a1,a5
    40b2:	df9fc0ef          	jal	ra,eaa <__divdf3>
    40b6:	872a                	mv	a4,a0
    40b8:	87ae                	mv	a5,a1
    40ba:	b535                	j	3ee6 <__dtostr+0x1c2>
    40bc:	6795                	lui	a5,0x5
    40be:	1c07a703          	lw	a4,448(a5) # 51c0 <sg_usi_config+0x88>
    40c2:	1c47a783          	lw	a5,452(a5)
    40c6:	bd25                	j	3efe <__dtostr+0x1da>
    40c8:	4542                	lw	a0,16(sp)
    40ca:	45d2                	lw	a1,20(sp)
    40cc:	863a                	mv	a2,a4
    40ce:	86be                	mv	a3,a5
    40d0:	d016                	sw	t0,32(sp)
    40d2:	cc3a                	sw	a4,24(sp)
    40d4:	ce3e                	sw	a5,28(sp)
    40d6:	dd5fc0ef          	jal	ra,eaa <__divdf3>
    40da:	fdffd0ef          	jal	ra,20b8 <__fixdfsi>
    40de:	03050693          	addi	a3,a0,48
    40e2:	00d400a3          	sb	a3,1(s0)
    40e6:	0ff57513          	andi	a0,a0,255
    40ea:	832fe0ef          	jal	ra,211c <__floatsidf>
    40ee:	4762                	lw	a4,24(sp)
    40f0:	47f2                	lw	a5,28(sp)
    40f2:	0405                	addi	s0,s0,1
    40f4:	863a                	mv	a2,a4
    40f6:	86be                	mv	a3,a5
    40f8:	d2cfd0ef          	jal	ra,1624 <__muldf3>
    40fc:	862a                	mv	a2,a0
    40fe:	86ae                	mv	a3,a1
    4100:	4542                	lw	a0,16(sp)
    4102:	45d2                	lw	a1,20(sp)
    4104:	9a9fd0ef          	jal	ra,1aac <__subdf3>
    4108:	4762                	lw	a4,24(sp)
    410a:	47f2                	lw	a5,28(sp)
    410c:	4622                	lw	a2,8(sp)
    410e:	46b2                	lw	a3,12(sp)
    4110:	c82a                	sw	a0,16(sp)
    4112:	ca2e                	sw	a1,20(sp)
    4114:	853a                	mv	a0,a4
    4116:	85be                	mv	a1,a5
    4118:	d93fc0ef          	jal	ra,eaa <__divdf3>
    411c:	872a                	mv	a4,a0
    411e:	87ae                	mv	a5,a1
    4120:	5282                	lw	t0,32(sp)
    4122:	b581                	j	3f62 <__dtostr+0x23e>
    4124:	47a1                	li	a5,8
    4126:	c60402e3          	beqz	s0,3d8a <__dtostr+0x66>
    412a:	4785                	li	a5,1
    412c:	b9b9                	j	3d8a <__dtostr+0x66>

0000412e <__isinf>:
    412e:	e509                	bnez	a0,4138 <__isinf+0xa>
    4130:	7ff007b7          	lui	a5,0x7ff00
    4134:	00f58b63          	beq	a1,a5,414a <__isinf+0x1c>
    4138:	fff007b7          	lui	a5,0xfff00
    413c:	8fad                	xor	a5,a5,a1
    413e:	8d5d                	or	a0,a0,a5
    4140:	00153513          	seqz	a0,a0
    4144:	40a00533          	neg	a0,a0
    4148:	8082                	ret
    414a:	4505                	li	a0,1
    414c:	8082                	ret

0000414e <__lltostr>:
    414e:	fdc10113          	addi	sp,sp,-36
    4152:	15fd                	addi	a1,a1,-1
    4154:	ce22                	sw	s0,28(sp)
    4156:	d006                	sw	ra,32(sp)
    4158:	cc26                	sw	s1,24(sp)
    415a:	95aa                	add	a1,a1,a0
    415c:	00058023          	sb	zero,0(a1)
    4160:	842a                	mv	s0,a0
    4162:	82b2                	mv	t0,a2
    4164:	8336                	mv	t1,a3
    4166:	c709                	beqz	a4,4170 <__lltostr+0x22>
    4168:	02400693          	li	a3,36
    416c:	00e6d363          	bge	a3,a4,4172 <__lltostr+0x24>
    4170:	4729                	li	a4,10
    4172:	0062e6b3          	or	a3,t0,t1
    4176:	4601                	li	a2,0
    4178:	e699                	bnez	a3,4186 <__lltostr+0x38>
    417a:	03000693          	li	a3,48
    417e:	fed58fa3          	sb	a3,-1(a1)
    4182:	4605                	li	a2,1
    4184:	15fd                	addi	a1,a1,-1
    4186:	02700693          	li	a3,39
    418a:	c391                	beqz	a5,418e <__lltostr+0x40>
    418c:	469d                	li	a3,7
    418e:	0ff6f793          	andi	a5,a3,255
    4192:	c23e                	sw	a5,4(sp)
    4194:	00c587b3          	add	a5,a1,a2
    4198:	c43e                	sw	a5,8(sp)
    419a:	41f75793          	srai	a5,a4,0x1f
    419e:	84ae                	mv	s1,a1
    41a0:	c03e                	sw	a5,0(sp)
    41a2:	47a2                	lw	a5,8(sp)
    41a4:	409786b3          	sub	a3,a5,s1
    41a8:	00947563          	bgeu	s0,s1,41b2 <__lltostr+0x64>
    41ac:	0062e633          	or	a2,t0,t1
    41b0:	e205                	bnez	a2,41d0 <__lltostr+0x82>
    41b2:	00168613          	addi	a2,a3,1
    41b6:	85a6                	mv	a1,s1
    41b8:	8522                	mv	a0,s0
    41ba:	c036                	sw	a3,0(sp)
    41bc:	802fe0ef          	jal	ra,21be <memmove>
    41c0:	4682                	lw	a3,0(sp)
    41c2:	5082                	lw	ra,32(sp)
    41c4:	4472                	lw	s0,28(sp)
    41c6:	44e2                	lw	s1,24(sp)
    41c8:	8536                	mv	a0,a3
    41ca:	02410113          	addi	sp,sp,36
    41ce:	8082                	ret
    41d0:	4682                	lw	a3,0(sp)
    41d2:	863a                	mv	a2,a4
    41d4:	8516                	mv	a0,t0
    41d6:	859a                	mv	a1,t1
    41d8:	ca3a                	sw	a4,20(sp)
    41da:	c816                	sw	t0,16(sp)
    41dc:	c61a                	sw	t1,12(sp)
    41de:	b82fc0ef          	jal	ra,560 <__umoddi3>
    41e2:	03050513          	addi	a0,a0,48
    41e6:	0ff57513          	andi	a0,a0,255
    41ea:	03900793          	li	a5,57
    41ee:	14fd                	addi	s1,s1,-1
    41f0:	4332                	lw	t1,12(sp)
    41f2:	42c2                	lw	t0,16(sp)
    41f4:	4752                	lw	a4,20(sp)
    41f6:	00a7ef63          	bltu	a5,a0,4214 <__lltostr+0xc6>
    41fa:	4682                	lw	a3,0(sp)
    41fc:	00a48023          	sb	a0,0(s1)
    4200:	863a                	mv	a2,a4
    4202:	8516                	mv	a0,t0
    4204:	859a                	mv	a1,t1
    4206:	c63a                	sw	a4,12(sp)
    4208:	feffb0ef          	jal	ra,1f6 <__udivdi3>
    420c:	82aa                	mv	t0,a0
    420e:	832e                	mv	t1,a1
    4210:	4732                	lw	a4,12(sp)
    4212:	bf41                	j	41a2 <__lltostr+0x54>
    4214:	4792                	lw	a5,4(sp)
    4216:	953e                	add	a0,a0,a5
    4218:	b7cd                	j	41fa <__lltostr+0xac>

0000421a <printf>:
    421a:	fdc10113          	addi	sp,sp,-36
    421e:	c82e                	sw	a1,16(sp)
    4220:	080c                	addi	a1,sp,16
    4222:	c606                	sw	ra,12(sp)
    4224:	ca32                	sw	a2,20(sp)
    4226:	cc36                	sw	a3,24(sp)
    4228:	ce3a                	sw	a4,28(sp)
    422a:	d03e                	sw	a5,32(sp)
    422c:	c02e                	sw	a1,0(sp)
    422e:	2099                	jal	4274 <vprintf>
    4230:	40b2                	lw	ra,12(sp)
    4232:	02410113          	addi	sp,sp,36
    4236:	8082                	ret

00004238 <putc>:
    4238:	95dff06f          	j	3b94 <fputc>

0000423c <__stdio_outs>:
    423c:	1151                	addi	sp,sp,-12
    423e:	c222                	sw	s0,4(sp)
    4240:	c026                	sw	s1,0(sp)
    4242:	842a                	mv	s0,a0
    4244:	84ae                	mv	s1,a1
    4246:	c406                	sw	ra,8(sp)
    4248:	94a2                	add	s1,s1,s0
    424a:	981ff0ef          	jal	ra,3bca <os_critical_enter>
    424e:	00941a63          	bne	s0,s1,4262 <__stdio_outs+0x26>
    4252:	97dff0ef          	jal	ra,3bce <os_critical_exit>
    4256:	40a2                	lw	ra,8(sp)
    4258:	4412                	lw	s0,4(sp)
    425a:	4482                	lw	s1,0(sp)
    425c:	4505                	li	a0,1
    425e:	0131                	addi	sp,sp,12
    4260:	8082                	ret
    4262:	0001a703          	lw	a4,0(gp) # 200004e8 <_impure_ptr>
    4266:	00044503          	lbu	a0,0(s0)
    426a:	0405                	addi	s0,s0,1
    426c:	470c                	lw	a1,8(a4)
    426e:	927ff0ef          	jal	ra,3b94 <fputc>
    4272:	bff1                	j	424e <__stdio_outs+0x12>

00004274 <vprintf>:
    4274:	1131                	addi	sp,sp,-20
    4276:	6791                	lui	a5,0x4
    4278:	23c78793          	addi	a5,a5,572 # 423c <__stdio_outs>
    427c:	862e                	mv	a2,a1
    427e:	85aa                	mv	a1,a0
    4280:	850a                	mv	a0,sp
    4282:	c806                	sw	ra,16(sp)
    4284:	c002                	sw	zero,0(sp)
    4286:	c23e                	sw	a5,4(sp)
    4288:	2291                	jal	43cc <__v_printf>
    428a:	40c2                	lw	ra,16(sp)
    428c:	0151                	addi	sp,sp,20
    428e:	8082                	ret

00004290 <__isnan>:
    4290:	fff80737          	lui	a4,0xfff80
    4294:	177d                	addi	a4,a4,-1
    4296:	8f6d                	and	a4,a4,a1
    4298:	e509                	bnez	a0,42a2 <__isnan+0x12>
    429a:	7ff007b7          	lui	a5,0x7ff00
    429e:	00f70963          	beq	a4,a5,42b0 <__isnan+0x20>
    42a2:	fff807b7          	lui	a5,0xfff80
    42a6:	8fad                	xor	a5,a5,a1
    42a8:	8fc9                	or	a5,a5,a0
    42aa:	0017b513          	seqz	a0,a5
    42ae:	8082                	ret
    42b0:	4505                	li	a0,1
    42b2:	8082                	ret

000042b4 <__ltostr>:
    42b4:	1151                	addi	sp,sp,-12
    42b6:	15fd                	addi	a1,a1,-1
    42b8:	c406                	sw	ra,8(sp)
    42ba:	c222                	sw	s0,4(sp)
    42bc:	95aa                	add	a1,a1,a0
    42be:	00058023          	sb	zero,0(a1)
    42c2:	fff68313          	addi	t1,a3,-1
    42c6:	02300793          	li	a5,35
    42ca:	0067f363          	bgeu	a5,t1,42d0 <__ltostr+0x1c>
    42ce:	46a9                	li	a3,10
    42d0:	4781                	li	a5,0
    42d2:	e619                	bnez	a2,42e0 <__ltostr+0x2c>
    42d4:	03000793          	li	a5,48
    42d8:	fef58fa3          	sb	a5,-1(a1)
    42dc:	15fd                	addi	a1,a1,-1
    42de:	4785                	li	a5,1
    42e0:	02700313          	li	t1,39
    42e4:	c311                	beqz	a4,42e8 <__ltostr+0x34>
    42e6:	431d                	li	t1,7
    42e8:	0ff37713          	andi	a4,t1,255
    42ec:	03900293          	li	t0,57
    42f0:	00f58333          	add	t1,a1,a5
    42f4:	40b30433          	sub	s0,t1,a1
    42f8:	00b57363          	bgeu	a0,a1,42fe <__ltostr+0x4a>
    42fc:	ea11                	bnez	a2,4310 <__ltostr+0x5c>
    42fe:	00140613          	addi	a2,s0,1
    4302:	ebdfd0ef          	jal	ra,21be <memmove>
    4306:	8522                	mv	a0,s0
    4308:	40a2                	lw	ra,8(sp)
    430a:	4412                	lw	s0,4(sp)
    430c:	0131                	addi	sp,sp,12
    430e:	8082                	ret
    4310:	02d677b3          	remu	a5,a2,a3
    4314:	15fd                	addi	a1,a1,-1
    4316:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    431a:	0ff7f793          	andi	a5,a5,255
    431e:	00f2e763          	bltu	t0,a5,432c <__ltostr+0x78>
    4322:	00f58023          	sb	a5,0(a1)
    4326:	02d65633          	divu	a2,a2,a3
    432a:	b7e9                	j	42f4 <__ltostr+0x40>
    432c:	97ba                	add	a5,a5,a4
    432e:	bfd5                	j	4322 <__ltostr+0x6e>

00004330 <putchar>:
    4330:	0001a783          	lw	a5,0(gp) # 200004e8 <_impure_ptr>
    4334:	1151                	addi	sp,sp,-12
    4336:	c406                	sw	ra,8(sp)
    4338:	478c                	lw	a1,8(a5)
    433a:	3dfd                	jal	4238 <putc>
    433c:	40a2                	lw	ra,8(sp)
    433e:	4501                	li	a0,0
    4340:	0131                	addi	sp,sp,12
    4342:	8082                	ret

00004344 <puts>:
    4344:	1151                	addi	sp,sp,-12
    4346:	c222                	sw	s0,4(sp)
    4348:	c406                	sw	ra,8(sp)
    434a:	842a                	mv	s0,a0
    434c:	00044503          	lbu	a0,0(s0)
    4350:	55fd                	li	a1,-1
    4352:	e909                	bnez	a0,4364 <puts+0x20>
    4354:	4529                	li	a0,10
    4356:	83fff0ef          	jal	ra,3b94 <fputc>
    435a:	40a2                	lw	ra,8(sp)
    435c:	4412                	lw	s0,4(sp)
    435e:	4501                	li	a0,0
    4360:	0131                	addi	sp,sp,12
    4362:	8082                	ret
    4364:	831ff0ef          	jal	ra,3b94 <fputc>
    4368:	0405                	addi	s0,s0,1
    436a:	b7cd                	j	434c <puts+0x8>

0000436c <write_pad>:
    436c:	1131                	addi	sp,sp,-20
    436e:	fd060613          	addi	a2,a2,-48
    4372:	c426                	sw	s1,8(sp)
    4374:	00163613          	seqz	a2,a2
    4378:	6495                	lui	s1,0x5
    437a:	0612                	slli	a2,a2,0x4
    437c:	1f848493          	addi	s1,s1,504 # 51f8 <pad_line>
    4380:	c622                	sw	s0,12(sp)
    4382:	c806                	sw	ra,16(sp)
    4384:	87aa                	mv	a5,a0
    4386:	872e                	mv	a4,a1
    4388:	94b2                	add	s1,s1,a2
    438a:	842e                	mv	s0,a1
    438c:	463d                	li	a2,15
    438e:	408706b3          	sub	a3,a4,s0
    4392:	02864263          	blt	a2,s0,43b6 <write_pad+0x4a>
    4396:	00805a63          	blez	s0,43aa <write_pad+0x3e>
    439a:	43d8                	lw	a4,4(a5)
    439c:	4390                	lw	a2,0(a5)
    439e:	85a2                	mv	a1,s0
    43a0:	8526                	mv	a0,s1
    43a2:	c036                	sw	a3,0(sp)
    43a4:	9702                	jalr	a4
    43a6:	4682                	lw	a3,0(sp)
    43a8:	96a2                	add	a3,a3,s0
    43aa:	40c2                	lw	ra,16(sp)
    43ac:	4432                	lw	s0,12(sp)
    43ae:	44a2                	lw	s1,8(sp)
    43b0:	8536                	mv	a0,a3
    43b2:	0151                	addi	sp,sp,20
    43b4:	8082                	ret
    43b6:	43d4                	lw	a3,4(a5)
    43b8:	4390                	lw	a2,0(a5)
    43ba:	45c1                	li	a1,16
    43bc:	8526                	mv	a0,s1
    43be:	c23a                	sw	a4,4(sp)
    43c0:	c03e                	sw	a5,0(sp)
    43c2:	9682                	jalr	a3
    43c4:	1441                	addi	s0,s0,-16
    43c6:	4712                	lw	a4,4(sp)
    43c8:	4782                	lw	a5,0(sp)
    43ca:	b7c9                	j	438c <write_pad+0x20>

000043cc <__v_printf>:
    43cc:	0081a783          	lw	a5,8(gp) # 200004f0 <errno>
    43d0:	f2810113          	addi	sp,sp,-216
    43d4:	c9a2                	sw	s0,208(sp)
    43d6:	c7a6                	sw	s1,204(sp)
    43d8:	cb86                	sw	ra,212(sp)
    43da:	84aa                	mv	s1,a0
    43dc:	c82e                	sw	a1,16(sp)
    43de:	8432                	mv	s0,a2
    43e0:	d83e                	sw	a5,48(sp)
    43e2:	c202                	sw	zero,4(sp)
    43e4:	47c2                	lw	a5,16(sp)
    43e6:	0007c783          	lbu	a5,0(a5)
    43ea:	66078d63          	beqz	a5,4a64 <__v_printf+0x698>
    43ee:	4701                	li	a4,0
    43f0:	02500613          	li	a2,37
    43f4:	a011                	j	43f8 <__v_printf+0x2c>
    43f6:	0705                	addi	a4,a4,1
    43f8:	47c2                	lw	a5,16(sp)
    43fa:	97ba                	add	a5,a5,a4
    43fc:	0007c683          	lbu	a3,0(a5)
    4400:	74068563          	beqz	a3,4b4a <__v_printf+0x77e>
    4404:	fec699e3          	bne	a3,a2,43f6 <__v_printf+0x2a>
    4408:	e319                	bnez	a4,440e <__v_printf+0x42>
    440a:	47c2                	lw	a5,16(sp)
    440c:	a01d                	j	4432 <__v_printf+0x66>
    440e:	40d4                	lw	a3,4(s1)
    4410:	4090                	lw	a2,0(s1)
    4412:	4542                	lw	a0,16(sp)
    4414:	85ba                	mv	a1,a4
    4416:	c43e                	sw	a5,8(sp)
    4418:	c03a                	sw	a4,0(sp)
    441a:	9682                	jalr	a3
    441c:	4792                	lw	a5,4(sp)
    441e:	4702                	lw	a4,0(sp)
    4420:	97ba                	add	a5,a5,a4
    4422:	c23e                	sw	a5,4(sp)
    4424:	47a2                	lw	a5,8(sp)
    4426:	02500713          	li	a4,37
    442a:	0007c683          	lbu	a3,0(a5)
    442e:	72e69163          	bne	a3,a4,4b50 <__v_printf+0x784>
    4432:	00178513          	addi	a0,a5,1
    4436:	02000793          	li	a5,32
    443a:	c002                	sw	zero,0(sp)
    443c:	c602                	sw	zero,12(sp)
    443e:	4701                	li	a4,0
    4440:	ca02                	sw	zero,20(sp)
    4442:	ce02                	sw	zero,28(sp)
    4444:	d602                	sw	zero,44(sp)
    4446:	d002                	sw	zero,32(sp)
    4448:	c402                	sw	zero,8(sp)
    444a:	cc3e                	sw	a5,24(sp)
    444c:	00054303          	lbu	t1,0(a0)
    4450:	00150793          	addi	a5,a0,1
    4454:	c83e                	sw	a5,16(sp)
    4456:	046103a3          	sb	t1,71(sp)
    445a:	06300793          	li	a5,99
    445e:	1cf30963          	beq	t1,a5,4630 <__v_printf+0x264>
    4462:	0c67e863          	bltu	a5,t1,4532 <__v_printf+0x166>
    4466:	02d00793          	li	a5,45
    446a:	02f30363          	beq	t1,a5,4490 <__v_printf+0xc4>
    446e:	0667e263          	bltu	a5,t1,44d2 <__v_printf+0x106>
    4472:	02300793          	li	a5,35
    4476:	02f30163          	beq	t1,a5,4498 <__v_printf+0xcc>
    447a:	0267e663          	bltu	a5,t1,44a6 <__v_printf+0xda>
    447e:	5e030163          	beqz	t1,4a60 <__v_printf+0x694>
    4482:	02000793          	li	a5,32
    4486:	f4f31fe3          	bne	t1,a5,43e4 <__v_printf+0x18>
    448a:	4785                	li	a5,1
    448c:	d63e                	sw	a5,44(sp)
    448e:	a019                	j	4494 <__v_printf+0xc8>
    4490:	4785                	li	a5,1
    4492:	d03e                	sw	a5,32(sp)
    4494:	4542                	lw	a0,16(sp)
    4496:	bf5d                	j	444c <__v_printf+0x80>
    4498:	0ff00793          	li	a5,255
    449c:	c43e                	sw	a5,8(sp)
    449e:	bfdd                	j	4494 <__v_printf+0xc8>
    44a0:	4785                	li	a5,1
    44a2:	ce3e                	sw	a5,28(sp)
    44a4:	bfc5                	j	4494 <__v_printf+0xc8>
    44a6:	02a00793          	li	a5,42
    44aa:	16f30163          	beq	t1,a5,460c <__v_printf+0x240>
    44ae:	02b00793          	li	a5,43
    44b2:	fef307e3          	beq	t1,a5,44a0 <__v_printf+0xd4>
    44b6:	02500793          	li	a5,37
    44ba:	f2f315e3          	bne	t1,a5,43e4 <__v_printf+0x18>
    44be:	40dc                	lw	a5,4(s1)
    44c0:	4090                	lw	a2,0(s1)
    44c2:	4585                	li	a1,1
    44c4:	04710513          	addi	a0,sp,71
    44c8:	9782                	jalr	a5
    44ca:	4792                	lw	a5,4(sp)
    44cc:	0785                	addi	a5,a5,1
    44ce:	c23e                	sw	a5,4(sp)
    44d0:	bf11                	j	43e4 <__v_printf+0x18>
    44d2:	03900793          	li	a5,57
    44d6:	0267ee63          	bltu	a5,t1,4512 <__v_printf+0x146>
    44da:	03000793          	li	a5,48
    44de:	0ef37f63          	bgeu	t1,a5,45dc <__v_printf+0x210>
    44e2:	02e00793          	li	a5,46
    44e6:	eef31fe3          	bne	t1,a5,43e4 <__v_printf+0x18>
    44ea:	00154683          	lbu	a3,1(a0)
    44ee:	02a00793          	li	a5,42
    44f2:	12f69163          	bne	a3,a5,4614 <__v_printf+0x248>
    44f6:	4014                	lw	a3,0(s0)
    44f8:	00440793          	addi	a5,s0,4
    44fc:	c036                	sw	a3,0(sp)
    44fe:	0006d363          	bgez	a3,4504 <__v_printf+0x138>
    4502:	c002                	sw	zero,0(sp)
    4504:	00250693          	addi	a3,a0,2
    4508:	c836                	sw	a3,16(sp)
    450a:	843e                	mv	s0,a5
    450c:	4785                	li	a5,1
    450e:	ca3e                	sw	a5,20(sp)
    4510:	b751                	j	4494 <__v_printf+0xc8>
    4512:	05800793          	li	a5,88
    4516:	28f30f63          	beq	t1,a5,47b4 <__v_printf+0x3e8>
    451a:	06200793          	li	a5,98
    451e:	36f30063          	beq	t1,a5,487e <__v_printf+0x4b2>
    4522:	04c00793          	li	a5,76
    4526:	eaf31fe3          	bne	t1,a5,43e4 <__v_printf+0x18>
    452a:	0705                	addi	a4,a4,1
    452c:	0762                	slli	a4,a4,0x18
    452e:	8761                	srai	a4,a4,0x18
    4530:	a091                	j	4574 <__v_printf+0x1a8>
    4532:	06d00793          	li	a5,109
    4536:	10f30263          	beq	t1,a5,463a <__v_printf+0x26e>
    453a:	0267ef63          	bltu	a5,t1,4578 <__v_printf+0x1ac>
    453e:	06700793          	li	a5,103
    4542:	0067ef63          	bltu	a5,t1,4560 <__v_printf+0x194>
    4546:	06600793          	li	a5,102
    454a:	3cf37f63          	bgeu	t1,a5,4928 <__v_printf+0x55c>
    454e:	06400793          	li	a5,100
    4552:	e8f319e3          	bne	t1,a5,43e4 <__v_printf+0x18>
    4556:	4529                	li	a0,10
    4558:	4781                	li	a5,0
    455a:	4285                	li	t0,1
    455c:	4301                	li	t1,0
    455e:	a471                	j	47ea <__v_printf+0x41e>
    4560:	06900793          	li	a5,105
    4564:	fef309e3          	beq	t1,a5,4556 <__v_printf+0x18a>
    4568:	06f36663          	bltu	t1,a5,45d4 <__v_printf+0x208>
    456c:	06c00793          	li	a5,108
    4570:	e6f31ae3          	bne	t1,a5,43e4 <__v_printf+0x18>
    4574:	0705                	addi	a4,a4,1
    4576:	a085                	j	45d6 <__v_printf+0x20a>
    4578:	07300793          	li	a5,115
    457c:	0ef30163          	beq	t1,a5,465e <__v_printf+0x292>
    4580:	0267ec63          	bltu	a5,t1,45b8 <__v_printf+0x1ec>
    4584:	07000793          	li	a5,112
    4588:	20f30f63          	beq	t1,a5,47a6 <__v_printf+0x3da>
    458c:	07100793          	li	a5,113
    4590:	f8f30de3          	beq	t1,a5,452a <__v_printf+0x15e>
    4594:	06f00793          	li	a5,111
    4598:	e4f316e3          	bne	t1,a5,43e4 <__v_printf+0x18>
    459c:	47a2                	lw	a5,8(sp)
    459e:	2e078463          	beqz	a5,4886 <__v_printf+0x4ba>
    45a2:	03000793          	li	a5,48
    45a6:	04f106a3          	sb	a5,77(sp)
    45aa:	4785                	li	a5,1
    45ac:	c43e                	sw	a5,8(sp)
    45ae:	4521                	li	a0,8
    45b0:	4781                	li	a5,0
    45b2:	4281                	li	t0,0
    45b4:	4305                	li	t1,1
    45b6:	ac15                	j	47ea <__v_printf+0x41e>
    45b8:	07800793          	li	a5,120
    45bc:	2af30f63          	beq	t1,a5,487a <__v_printf+0x4ae>
    45c0:	07a00793          	li	a5,122
    45c4:	ecf308e3          	beq	t1,a5,4494 <__v_printf+0xc8>
    45c8:	07500793          	li	a5,117
    45cc:	e0f31ce3          	bne	t1,a5,43e4 <__v_printf+0x18>
    45d0:	4529                	li	a0,10
    45d2:	a47d                	j	4880 <__v_printf+0x4b4>
    45d4:	177d                	addi	a4,a4,-1
    45d6:	0762                	slli	a4,a4,0x18
    45d8:	8761                	srai	a4,a4,0x18
    45da:	bd6d                	j	4494 <__v_printf+0xc8>
    45dc:	47d2                	lw	a5,20(sp)
    45de:	c83a                	sw	a4,16(sp)
    45e0:	48079063          	bnez	a5,4a60 <__v_printf+0x694>
    45e4:	4629                	li	a2,10
    45e6:	00ac                	addi	a1,sp,72
    45e8:	e30fe0ef          	jal	ra,2c18 <strtoul>
    45ec:	04714683          	lbu	a3,71(sp)
    45f0:	c62a                	sw	a0,12(sp)
    45f2:	03000793          	li	a5,48
    45f6:	4742                	lw	a4,16(sp)
    45f8:	00f69763          	bne	a3,a5,4606 <__v_printf+0x23a>
    45fc:	5782                	lw	a5,32(sp)
    45fe:	e781                	bnez	a5,4606 <__v_printf+0x23a>
    4600:	03000793          	li	a5,48
    4604:	cc3e                	sw	a5,24(sp)
    4606:	47a6                	lw	a5,72(sp)
    4608:	c83e                	sw	a5,16(sp)
    460a:	b569                	j	4494 <__v_printf+0xc8>
    460c:	401c                	lw	a5,0(s0)
    460e:	0411                	addi	s0,s0,4
    4610:	c63e                	sw	a5,12(sp)
    4612:	b549                	j	4494 <__v_printf+0xc8>
    4614:	4542                	lw	a0,16(sp)
    4616:	4629                	li	a2,10
    4618:	00ac                	addi	a1,sp,72
    461a:	ca3a                	sw	a4,20(sp)
    461c:	c46fe0ef          	jal	ra,2a62 <strtol>
    4620:	c02a                	sw	a0,0(sp)
    4622:	4752                	lw	a4,20(sp)
    4624:	00055363          	bgez	a0,462a <__v_printf+0x25e>
    4628:	c002                	sw	zero,0(sp)
    462a:	47a6                	lw	a5,72(sp)
    462c:	c83e                	sw	a5,16(sp)
    462e:	bdf9                	j	450c <__v_printf+0x140>
    4630:	401c                	lw	a5,0(s0)
    4632:	0411                	addi	s0,s0,4
    4634:	04f103a3          	sb	a5,71(sp)
    4638:	b559                	j	44be <__v_printf+0xf2>
    463a:	5542                	lw	a0,48(sp)
    463c:	9f6fe0ef          	jal	ra,2832 <strerror>
    4640:	c4aa                	sw	a0,72(sp)
    4642:	c42a                	sw	a0,8(sp)
    4644:	a08fe0ef          	jal	ra,284c <strlen>
    4648:	4722                	lw	a4,8(sp)
    464a:	40d4                	lw	a3,4(s1)
    464c:	4090                	lw	a2,0(s1)
    464e:	85aa                	mv	a1,a0
    4650:	c02a                	sw	a0,0(sp)
    4652:	853a                	mv	a0,a4
    4654:	9682                	jalr	a3
    4656:	4712                	lw	a4,4(sp)
    4658:	4782                	lw	a5,0(sp)
    465a:	97ba                	add	a5,a5,a4
    465c:	bd8d                	j	44ce <__v_printf+0x102>
    465e:	4018                	lw	a4,0(s0)
    4660:	00440793          	addi	a5,s0,4
    4664:	c721                	beqz	a4,46ac <__v_printf+0x2e0>
    4666:	c4ba                	sw	a4,72(sp)
    4668:	4526                	lw	a0,72(sp)
    466a:	cc3e                	sw	a5,24(sp)
    466c:	9e0fe0ef          	jal	ra,284c <strlen>
    4670:	4752                	lw	a4,20(sp)
    4672:	832a                	mv	t1,a0
    4674:	47e2                	lw	a5,24(sp)
    4676:	cf1d                	beqz	a4,46b4 <__v_printf+0x2e8>
    4678:	4702                	lw	a4,0(sp)
    467a:	00a77363          	bgeu	a4,a0,4680 <__v_printf+0x2b4>
    467e:	833a                	mv	t1,a4
    4680:	843e                	mv	s0,a5
    4682:	c002                	sw	zero,0(sp)
    4684:	ca02                	sw	zero,20(sp)
    4686:	4281                	li	t0,0
    4688:	02000793          	li	a5,32
    468c:	cc3e                	sw	a5,24(sp)
    468e:	47b2                	lw	a5,12(sp)
    4690:	4702                	lw	a4,0(sp)
    4692:	46a6                	lw	a3,72(sp)
    4694:	8fd9                	or	a5,a5,a4
    4696:	e39d                	bnez	a5,46bc <__v_printf+0x2f0>
    4698:	40dc                	lw	a5,4(s1)
    469a:	4090                	lw	a2,0(s1)
    469c:	859a                	mv	a1,t1
    469e:	8536                	mv	a0,a3
    46a0:	c01a                	sw	t1,0(sp)
    46a2:	9782                	jalr	a5
    46a4:	4792                	lw	a5,4(sp)
    46a6:	4302                	lw	t1,0(sp)
    46a8:	979a                	add	a5,a5,t1
    46aa:	b515                	j	44ce <__v_printf+0x102>
    46ac:	6715                	lui	a4,0x5
    46ae:	1f070713          	addi	a4,a4,496 # 51f0 <sg_usi_config+0xb8>
    46b2:	bf55                	j	4666 <__v_printf+0x29a>
    46b4:	843e                	mv	s0,a5
    46b6:	4281                	li	t0,0
    46b8:	c002                	sw	zero,0(sp)
    46ba:	b7f9                	j	4688 <__v_printf+0x2bc>
    46bc:	42029e63          	bnez	t0,4af8 <__v_printf+0x72c>
    46c0:	47a2                	lw	a5,8(sp)
    46c2:	3a078863          	beqz	a5,4a72 <__v_printf+0x6a6>
    46c6:	47a2                	lw	a5,8(sp)
    46c8:	00f68733          	add	a4,a3,a5
    46cc:	c4ba                	sw	a4,72(sp)
    46ce:	4732                	lw	a4,12(sp)
    46d0:	40f30333          	sub	t1,t1,a5
    46d4:	8f1d                	sub	a4,a4,a5
    46d6:	c63a                	sw	a4,12(sp)
    46d8:	5702                	lw	a4,32(sp)
    46da:	3a070063          	beqz	a4,4a7a <__v_printf+0x6ae>
    46de:	40d8                	lw	a4,4(s1)
    46e0:	4090                	lw	a2,0(s1)
    46e2:	85be                	mv	a1,a5
    46e4:	8536                	mv	a0,a3
    46e6:	ca1a                	sw	t1,20(sp)
    46e8:	c43e                	sw	a5,8(sp)
    46ea:	9702                	jalr	a4
    46ec:	4712                	lw	a4,4(sp)
    46ee:	47a2                	lw	a5,8(sp)
    46f0:	4352                	lw	t1,20(sp)
    46f2:	97ba                	add	a5,a5,a4
    46f4:	c23e                	sw	a5,4(sp)
    46f6:	4782                	lw	a5,0(sp)
    46f8:	03000613          	li	a2,48
    46fc:	8526                	mv	a0,s1
    46fe:	406785b3          	sub	a1,a5,t1
    4702:	ca1a                	sw	t1,20(sp)
    4704:	31a5                	jal	436c <write_pad>
    4706:	4792                	lw	a5,4(sp)
    4708:	4352                	lw	t1,20(sp)
    470a:	40d8                	lw	a4,4(s1)
    470c:	97aa                	add	a5,a5,a0
    470e:	4090                	lw	a2,0(s1)
    4710:	4526                	lw	a0,72(sp)
    4712:	859a                	mv	a1,t1
    4714:	c43e                	sw	a5,8(sp)
    4716:	c21a                	sw	t1,4(sp)
    4718:	9702                	jalr	a4
    471a:	4312                	lw	t1,4(sp)
    471c:	47a2                	lw	a5,8(sp)
    471e:	4582                	lw	a1,0(sp)
    4720:	979a                	add	a5,a5,t1
    4722:	0065f363          	bgeu	a1,t1,4728 <__v_printf+0x35c>
    4726:	859a                	mv	a1,t1
    4728:	c03e                	sw	a5,0(sp)
    472a:	47b2                	lw	a5,12(sp)
    472c:	02000613          	li	a2,32
    4730:	8526                	mv	a0,s1
    4732:	40b785b3          	sub	a1,a5,a1
    4736:	391d                	jal	436c <write_pad>
    4738:	4782                	lw	a5,0(sp)
    473a:	97aa                	add	a5,a5,a0
    473c:	bb49                	j	44ce <__v_printf+0x102>
    473e:	c78d                	beqz	a5,4768 <__v_printf+0x39c>
    4740:	4662                	lw	a2,24(sp)
    4742:	03000713          	li	a4,48
    4746:	02e61163          	bne	a2,a4,4768 <__v_printf+0x39c>
    474a:	40d8                	lw	a4,4(s1)
    474c:	4090                	lw	a2,0(s1)
    474e:	85be                	mv	a1,a5
    4750:	8536                	mv	a0,a3
    4752:	ca1a                	sw	t1,20(sp)
    4754:	c43e                	sw	a5,8(sp)
    4756:	c036                	sw	a3,0(sp)
    4758:	9702                	jalr	a4
    475a:	4712                	lw	a4,4(sp)
    475c:	47a2                	lw	a5,8(sp)
    475e:	4352                	lw	t1,20(sp)
    4760:	4682                	lw	a3,0(sp)
    4762:	97ba                	add	a5,a5,a4
    4764:	c23e                	sw	a5,4(sp)
    4766:	4781                	li	a5,0
    4768:	c43e                	sw	a5,8(sp)
    476a:	47b2                	lw	a5,12(sp)
    476c:	4662                	lw	a2,24(sp)
    476e:	8526                	mv	a0,s1
    4770:	406785b3          	sub	a1,a5,t1
    4774:	c01a                	sw	t1,0(sp)
    4776:	ca36                	sw	a3,20(sp)
    4778:	3ed5                	jal	436c <write_pad>
    477a:	4792                	lw	a5,4(sp)
    477c:	4302                	lw	t1,0(sp)
    477e:	00a78733          	add	a4,a5,a0
    4782:	47a2                	lw	a5,8(sp)
    4784:	34078e63          	beqz	a5,4ae0 <__v_printf+0x714>
    4788:	46d2                	lw	a3,20(sp)
    478a:	0044a383          	lw	t2,4(s1)
    478e:	4090                	lw	a2,0(s1)
    4790:	85be                	mv	a1,a5
    4792:	8536                	mv	a0,a3
    4794:	c41a                	sw	t1,8(sp)
    4796:	c23a                	sw	a4,4(sp)
    4798:	c03e                	sw	a5,0(sp)
    479a:	9382                	jalr	t2
    479c:	4782                	lw	a5,0(sp)
    479e:	4712                	lw	a4,4(sp)
    47a0:	4322                	lw	t1,8(sp)
    47a2:	973e                	add	a4,a4,a5
    47a4:	ae35                	j	4ae0 <__v_printf+0x714>
    47a6:	07800793          	li	a5,120
    47aa:	04f103a3          	sb	a5,71(sp)
    47ae:	4789                	li	a5,2
    47b0:	4705                	li	a4,1
    47b2:	c43e                	sw	a5,8(sp)
    47b4:	04714783          	lbu	a5,71(sp)
    47b8:	fa878793          	addi	a5,a5,-88
    47bc:	0017b793          	seqz	a5,a5
    47c0:	46a2                	lw	a3,8(sp)
    47c2:	4301                	li	t1,0
    47c4:	ce81                	beqz	a3,47dc <__v_printf+0x410>
    47c6:	03000693          	li	a3,48
    47ca:	04d106a3          	sb	a3,77(sp)
    47ce:	04714683          	lbu	a3,71(sp)
    47d2:	4309                	li	t1,2
    47d4:	04d10723          	sb	a3,78(sp)
    47d8:	4689                	li	a3,2
    47da:	c436                	sw	a3,8(sp)
    47dc:	46b2                	lw	a3,12(sp)
    47de:	4602                	lw	a2,0(sp)
    47e0:	00c6f363          	bgeu	a3,a2,47e6 <__v_printf+0x41a>
    47e4:	c632                	sw	a2,12(sp)
    47e6:	4541                	li	a0,16
    47e8:	4281                	li	t0,0
    47ea:	04d10693          	addi	a3,sp,77
    47ee:	c4b6                	sw	a3,72(sp)
    47f0:	0ae05a63          	blez	a4,48a4 <__v_printf+0x4d8>
    47f4:	4685                	li	a3,1
    47f6:	08d70c63          	beq	a4,a3,488e <__v_printf+0x4c2>
    47fa:	00840393          	addi	t2,s0,8
    47fe:	4010                	lw	a2,0(s0)
    4800:	4054                	lw	a3,4(s0)
    4802:	4581                	li	a1,0
    4804:	08028c63          	beqz	t0,489c <__v_printf+0x4d0>
    4808:	0006da63          	bgez	a3,481c <__v_printf+0x450>
    480c:	40c00633          	neg	a2,a2
    4810:	00c03733          	snez	a4,a2
    4814:	40d006b3          	neg	a3,a3
    4818:	8e99                	sub	a3,a3,a4
    481a:	4289                	li	t0,2
    481c:	872a                	mv	a4,a0
    481e:	04d10513          	addi	a0,sp,77
    4822:	951a                	add	a0,a0,t1
    4824:	07b00593          	li	a1,123
    4828:	da1e                	sw	t2,52(sp)
    482a:	d416                	sw	t0,40(sp)
    482c:	d21a                	sw	t1,36(sp)
    482e:	921ff0ef          	jal	ra,414e <__lltostr>
    4832:	53d2                	lw	t2,52(sp)
    4834:	5312                	lw	t1,36(sp)
    4836:	52a2                	lw	t0,40(sp)
    4838:	841e                	mv	s0,t2
    483a:	4752                	lw	a4,20(sp)
    483c:	47a6                	lw	a5,72(sp)
    483e:	cb5d                	beqz	a4,48f4 <__v_printf+0x528>
    4840:	4705                	li	a4,1
    4842:	0ae51963          	bne	a0,a4,48f4 <__v_printf+0x528>
    4846:	00678733          	add	a4,a5,t1
    484a:	00074683          	lbu	a3,0(a4)
    484e:	03000713          	li	a4,48
    4852:	0ae69163          	bne	a3,a4,48f4 <__v_printf+0x528>
    4856:	4702                	lw	a4,0(sp)
    4858:	c345                	beqz	a4,48f8 <__v_printf+0x52c>
    485a:	4722                	lw	a4,8(sp)
    485c:	c319                	beqz	a4,4862 <__v_printf+0x496>
    485e:	c402                	sw	zero,8(sp)
    4860:	4301                	li	t1,0
    4862:	4709                	li	a4,2
    4864:	08e29d63          	bne	t0,a4,48fe <__v_printf+0x532>
    4868:	fff78713          	addi	a4,a5,-1
    486c:	c4ba                	sw	a4,72(sp)
    486e:	02d00713          	li	a4,45
    4872:	fee78fa3          	sb	a4,-1(a5)
    4876:	0305                	addi	t1,t1,1
    4878:	bd19                	j	468e <__v_printf+0x2c2>
    487a:	4781                	li	a5,0
    487c:	b791                	j	47c0 <__v_printf+0x3f4>
    487e:	4509                	li	a0,2
    4880:	4781                	li	a5,0
    4882:	4281                	li	t0,0
    4884:	b9e1                	j	455c <__v_printf+0x190>
    4886:	4781                	li	a5,0
    4888:	4281                	li	t0,0
    488a:	4521                	li	a0,8
    488c:	b9c1                	j	455c <__v_printf+0x190>
    488e:	00440393          	addi	t2,s0,4
    4892:	400c                	lw	a1,0(s0)
    4894:	00029d63          	bnez	t0,48ae <__v_printf+0x4e2>
    4898:	4601                	li	a2,0
    489a:	4681                	li	a3,0
    489c:	4405                	li	s0,1
    489e:	f6e44fe3          	blt	s0,a4,481c <__v_printf+0x450>
    48a2:	a01d                	j	48c8 <__v_printf+0x4fc>
    48a4:	00440393          	addi	t2,s0,4
    48a8:	400c                	lw	a1,0(s0)
    48aa:	00028863          	beqz	t0,48ba <__v_printf+0x4ee>
    48ae:	4285                	li	t0,1
    48b0:	0005d563          	bgez	a1,48ba <__v_printf+0x4ee>
    48b4:	40b005b3          	neg	a1,a1
    48b8:	4289                	li	t0,2
    48ba:	fc075fe3          	bgez	a4,4898 <__v_printf+0x4cc>
    48be:	56fd                	li	a3,-1
    48c0:	02d70763          	beq	a4,a3,48ee <__v_printf+0x522>
    48c4:	0ff5f593          	andi	a1,a1,255
    48c8:	873e                	mv	a4,a5
    48ca:	04d10793          	addi	a5,sp,77
    48ce:	86aa                	mv	a3,a0
    48d0:	862e                	mv	a2,a1
    48d2:	00678533          	add	a0,a5,t1
    48d6:	07b00593          	li	a1,123
    48da:	da1e                	sw	t2,52(sp)
    48dc:	d416                	sw	t0,40(sp)
    48de:	d21a                	sw	t1,36(sp)
    48e0:	9d5ff0ef          	jal	ra,42b4 <__ltostr>
    48e4:	53d2                	lw	t2,52(sp)
    48e6:	52a2                	lw	t0,40(sp)
    48e8:	5312                	lw	t1,36(sp)
    48ea:	841e                	mv	s0,t2
    48ec:	b7b9                	j	483a <__v_printf+0x46e>
    48ee:	05c2                	slli	a1,a1,0x10
    48f0:	81c1                	srli	a1,a1,0x10
    48f2:	bfd9                	j	48c8 <__v_printf+0x4fc>
    48f4:	932a                	add	t1,t1,a0
    48f6:	b7b5                	j	4862 <__v_printf+0x496>
    48f8:	4301                	li	t1,0
    48fa:	c402                	sw	zero,8(sp)
    48fc:	b79d                	j	4862 <__v_printf+0x496>
    48fe:	d80288e3          	beqz	t0,468e <__v_printf+0x2c2>
    4902:	4772                	lw	a4,28(sp)
    4904:	ef19                	bnez	a4,4922 <__v_printf+0x556>
    4906:	5732                	lw	a4,44(sp)
    4908:	4281                	li	t0,0
    490a:	d80702e3          	beqz	a4,468e <__v_printf+0x2c2>
    490e:	02000713          	li	a4,32
    4912:	fff78693          	addi	a3,a5,-1
    4916:	c4b6                	sw	a3,72(sp)
    4918:	fee78fa3          	sb	a4,-1(a5)
    491c:	0305                	addi	t1,t1,1
    491e:	4285                	li	t0,1
    4920:	b3bd                	j	468e <__v_printf+0x2c2>
    4922:	02b00713          	li	a4,43
    4926:	b7f5                	j	4912 <__v_printf+0x546>
    4928:	00840793          	addi	a5,s0,8
    492c:	da3e                	sw	a5,52(sp)
    492e:	401c                	lw	a5,0(s0)
    4930:	d23e                	sw	a5,36(sp)
    4932:	405c                	lw	a5,4(s0)
    4934:	d43e                	sw	a5,40(sp)
    4936:	04d10793          	addi	a5,sp,77
    493a:	c4be                	sw	a5,72(sp)
    493c:	47b2                	lw	a5,12(sp)
    493e:	e399                	bnez	a5,4944 <__v_printf+0x578>
    4940:	4785                	li	a5,1
    4942:	c63e                	sw	a5,12(sp)
    4944:	47d2                	lw	a5,20(sp)
    4946:	e399                	bnez	a5,494c <__v_printf+0x580>
    4948:	4799                	li	a5,6
    494a:	c03e                	sw	a5,0(sp)
    494c:	42f2                	lw	t0,28(sp)
    494e:	00029e63          	bnez	t0,496a <__v_printf+0x59e>
    4952:	5712                	lw	a4,36(sp)
    4954:	57a2                	lw	a5,40(sp)
    4956:	4601                	li	a2,0
    4958:	4681                	li	a3,0
    495a:	853a                	mv	a0,a4
    495c:	85be                	mv	a1,a5
    495e:	dc1a                	sw	t1,56(sp)
    4960:	c0ffc0ef          	jal	ra,156e <__ledf2>
    4964:	5362                	lw	t1,56(sp)
    4966:	01f55293          	srli	t0,a0,0x1f
    496a:	5412                	lw	s0,36(sp)
    496c:	53a2                	lw	t2,40(sp)
    496e:	4782                	lw	a5,0(sp)
    4970:	4732                	lw	a4,12(sp)
    4972:	07f00693          	li	a3,127
    4976:	04d10613          	addi	a2,sp,77
    497a:	8522                	mv	a0,s0
    497c:	859e                	mv	a1,t2
    497e:	c096                	sw	t0,64(sp)
    4980:	dc1a                	sw	t1,56(sp)
    4982:	ba2ff0ef          	jal	ra,3d24 <__dtostr>
    4986:	47d2                	lw	a5,20(sp)
    4988:	de2a                	sw	a0,60(sp)
    498a:	5362                	lw	t1,56(sp)
    498c:	4286                	lw	t0,64(sp)
    498e:	cb95                	beqz	a5,49c2 <__v_printf+0x5f6>
    4990:	4426                	lw	s0,72(sp)
    4992:	02e00593          	li	a1,46
    4996:	dc16                	sw	t0,56(sp)
    4998:	8522                	mv	a0,s0
    499a:	ca1a                	sw	t1,20(sp)
    499c:	9bffd0ef          	jal	ra,235a <strchr>
    49a0:	4352                	lw	t1,20(sp)
    49a2:	52e2                	lw	t0,56(sp)
    49a4:	57f2                	lw	a5,60(sp)
    49a6:	cd49                	beqz	a0,4a40 <__v_printf+0x674>
    49a8:	4782                	lw	a5,0(sp)
    49aa:	e399                	bnez	a5,49b0 <__v_printf+0x5e4>
    49ac:	47a2                	lw	a5,8(sp)
    49ae:	cb81                	beqz	a5,49be <__v_printf+0x5f2>
    49b0:	0505                	addi	a0,a0,1
    49b2:	4782                	lw	a5,0(sp)
    49b4:	c789                	beqz	a5,49be <__v_printf+0x5f2>
    49b6:	0505                	addi	a0,a0,1
    49b8:	00054783          	lbu	a5,0(a0)
    49bc:	efb5                	bnez	a5,4a38 <__v_printf+0x66c>
    49be:	00050023          	sb	zero,0(a0)
    49c2:	06700793          	li	a5,103
    49c6:	04f31a63          	bne	t1,a5,4a1a <__v_printf+0x64e>
    49ca:	4526                	lw	a0,72(sp)
    49cc:	02e00593          	li	a1,46
    49d0:	c416                	sw	t0,8(sp)
    49d2:	989fd0ef          	jal	ra,235a <strchr>
    49d6:	842a                	mv	s0,a0
    49d8:	42a2                	lw	t0,8(sp)
    49da:	c121                	beqz	a0,4a1a <__v_printf+0x64e>
    49dc:	06500593          	li	a1,101
    49e0:	97bfd0ef          	jal	ra,235a <strchr>
    49e4:	42a2                	lw	t0,8(sp)
    49e6:	85aa                	mv	a1,a0
    49e8:	00044783          	lbu	a5,0(s0)
    49ec:	e7b5                	bnez	a5,4a58 <__v_printf+0x68c>
    49ee:	c191                	beqz	a1,49f2 <__v_printf+0x626>
    49f0:	842e                	mv	s0,a1
    49f2:	03000693          	li	a3,48
    49f6:	fff44703          	lbu	a4,-1(s0)
    49fa:	fff40513          	addi	a0,s0,-1
    49fe:	04d70f63          	beq	a4,a3,4a5c <__v_printf+0x690>
    4a02:	02e00693          	li	a3,46
    4a06:	00d70363          	beq	a4,a3,4a0c <__v_printf+0x640>
    4a0a:	8522                	mv	a0,s0
    4a0c:	00050023          	sb	zero,0(a0)
    4a10:	c589                	beqz	a1,4a1a <__v_printf+0x64e>
    4a12:	c416                	sw	t0,8(sp)
    4a14:	a3dfd0ef          	jal	ra,2450 <strcpy>
    4a18:	42a2                	lw	t0,8(sp)
    4a1a:	47f2                	lw	a5,28(sp)
    4a1c:	10079263          	bnez	a5,4b20 <__v_printf+0x754>
    4a20:	57b2                	lw	a5,44(sp)
    4a22:	e3e5                	bnez	a5,4b02 <__v_printf+0x736>
    4a24:	4526                	lw	a0,72(sp)
    4a26:	ce16                	sw	t0,28(sp)
    4a28:	e25fd0ef          	jal	ra,284c <strlen>
    4a2c:	832a                	mv	t1,a0
    4a2e:	5452                	lw	s0,52(sp)
    4a30:	ca02                	sw	zero,20(sp)
    4a32:	c402                	sw	zero,8(sp)
    4a34:	42f2                	lw	t0,28(sp)
    4a36:	b9a1                	j	468e <__v_printf+0x2c2>
    4a38:	4782                	lw	a5,0(sp)
    4a3a:	17fd                	addi	a5,a5,-1
    4a3c:	c03e                	sw	a5,0(sp)
    4a3e:	bf95                	j	49b2 <__v_printf+0x5e6>
    4a40:	4722                	lw	a4,8(sp)
    4a42:	d341                	beqz	a4,49c2 <__v_printf+0x5f6>
    4a44:	943e                	add	s0,s0,a5
    4a46:	02e00713          	li	a4,46
    4a4a:	00e40023          	sb	a4,0(s0)
    4a4e:	4526                	lw	a0,72(sp)
    4a50:	953e                	add	a0,a0,a5
    4a52:	000500a3          	sb	zero,1(a0)
    4a56:	b7b5                	j	49c2 <__v_printf+0x5f6>
    4a58:	0405                	addi	s0,s0,1
    4a5a:	b779                	j	49e8 <__v_printf+0x61c>
    4a5c:	842a                	mv	s0,a0
    4a5e:	bf61                	j	49f6 <__v_printf+0x62a>
    4a60:	57fd                	li	a5,-1
    4a62:	c23e                	sw	a5,4(sp)
    4a64:	40de                	lw	ra,212(sp)
    4a66:	444e                	lw	s0,208(sp)
    4a68:	4512                	lw	a0,4(sp)
    4a6a:	44be                	lw	s1,204(sp)
    4a6c:	0d810113          	addi	sp,sp,216
    4a70:	8082                	ret
    4a72:	5782                	lw	a5,32(sp)
    4a74:	c80791e3          	bnez	a5,46f6 <__v_printf+0x32a>
    4a78:	4781                	li	a5,0
    4a7a:	4752                	lw	a4,20(sp)
    4a7c:	cc0701e3          	beqz	a4,473e <__v_printf+0x372>
    4a80:	4582                	lw	a1,0(sp)
    4a82:	0065f363          	bgeu	a1,t1,4a88 <__v_printf+0x6bc>
    4a86:	859a                	mv	a1,t1
    4a88:	ca3e                	sw	a5,20(sp)
    4a8a:	47b2                	lw	a5,12(sp)
    4a8c:	02000613          	li	a2,32
    4a90:	8526                	mv	a0,s1
    4a92:	40b785b3          	sub	a1,a5,a1
    4a96:	c41a                	sw	t1,8(sp)
    4a98:	cc36                	sw	a3,24(sp)
    4a9a:	8d3ff0ef          	jal	ra,436c <write_pad>
    4a9e:	4792                	lw	a5,4(sp)
    4aa0:	4322                	lw	t1,8(sp)
    4aa2:	00f50733          	add	a4,a0,a5
    4aa6:	47d2                	lw	a5,20(sp)
    4aa8:	cf99                	beqz	a5,4ac6 <__v_printf+0x6fa>
    4aaa:	46e2                	lw	a3,24(sp)
    4aac:	0044a383          	lw	t2,4(s1)
    4ab0:	4090                	lw	a2,0(s1)
    4ab2:	85be                	mv	a1,a5
    4ab4:	8536                	mv	a0,a3
    4ab6:	c61a                	sw	t1,12(sp)
    4ab8:	c43a                	sw	a4,8(sp)
    4aba:	c23e                	sw	a5,4(sp)
    4abc:	9382                	jalr	t2
    4abe:	4792                	lw	a5,4(sp)
    4ac0:	4722                	lw	a4,8(sp)
    4ac2:	4332                	lw	t1,12(sp)
    4ac4:	973e                	add	a4,a4,a5
    4ac6:	4782                	lw	a5,0(sp)
    4ac8:	03000613          	li	a2,48
    4acc:	8526                	mv	a0,s1
    4ace:	406785b3          	sub	a1,a5,t1
    4ad2:	c23a                	sw	a4,4(sp)
    4ad4:	c01a                	sw	t1,0(sp)
    4ad6:	897ff0ef          	jal	ra,436c <write_pad>
    4ada:	4712                	lw	a4,4(sp)
    4adc:	4302                	lw	t1,0(sp)
    4ade:	972a                	add	a4,a4,a0
    4ae0:	40dc                	lw	a5,4(s1)
    4ae2:	4090                	lw	a2,0(s1)
    4ae4:	4526                	lw	a0,72(sp)
    4ae6:	859a                	mv	a1,t1
    4ae8:	c23a                	sw	a4,4(sp)
    4aea:	c01a                	sw	t1,0(sp)
    4aec:	9782                	jalr	a5
    4aee:	4302                	lw	t1,0(sp)
    4af0:	4712                	lw	a4,4(sp)
    4af2:	006707b3          	add	a5,a4,t1
    4af6:	bae1                	j	44ce <__v_printf+0x102>
    4af8:	47a2                	lw	a5,8(sp)
    4afa:	bc0796e3          	bnez	a5,46c6 <__v_printf+0x2fa>
    4afe:	4785                	li	a5,1
    4b00:	b6e1                	j	46c8 <__v_printf+0x2fc>
    4b02:	57a2                	lw	a5,40(sp)
    4b04:	5712                	lw	a4,36(sp)
    4b06:	4601                	li	a2,0
    4b08:	85be                	mv	a1,a5
    4b0a:	4681                	li	a3,0
    4b0c:	853a                	mv	a0,a4
    4b0e:	c416                	sw	t0,8(sp)
    4b10:	9a9fc0ef          	jal	ra,14b8 <__gedf2>
    4b14:	02000793          	li	a5,32
    4b18:	42a2                	lw	t0,8(sp)
    4b1a:	02055163          	bgez	a0,4b3c <__v_printf+0x770>
    4b1e:	b719                	j	4a24 <__v_printf+0x658>
    4b20:	5712                	lw	a4,36(sp)
    4b22:	57a2                	lw	a5,40(sp)
    4b24:	4601                	li	a2,0
    4b26:	4681                	li	a3,0
    4b28:	853a                	mv	a0,a4
    4b2a:	85be                	mv	a1,a5
    4b2c:	c416                	sw	t0,8(sp)
    4b2e:	98bfc0ef          	jal	ra,14b8 <__gedf2>
    4b32:	42a2                	lw	t0,8(sp)
    4b34:	ee0548e3          	bltz	a0,4a24 <__v_printf+0x658>
    4b38:	02b00793          	li	a5,43
    4b3c:	4726                	lw	a4,72(sp)
    4b3e:	fff70693          	addi	a3,a4,-1
    4b42:	c4b6                	sw	a3,72(sp)
    4b44:	fef70fa3          	sb	a5,-1(a4)
    4b48:	bdf1                	j	4a24 <__v_printf+0x658>
    4b4a:	8c0712e3          	bnez	a4,440e <__v_printf+0x42>
    4b4e:	47c2                	lw	a5,16(sp)
    4b50:	c83e                	sw	a5,16(sp)
    4b52:	b849                	j	43e4 <__v_printf+0x18>
	...
