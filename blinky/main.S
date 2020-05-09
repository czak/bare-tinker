.globl _start

_start:
	b main

main:
	mov r0, #0b00000000000000000000000000000000	@ off
	mov r1, #0b00000001000000000000000000000000	@ on

	@ Set GPIO1_D0 as output
	ldr r2, GPIO1_SWPORTA_DDR
	str r1, [r2]
	
	ldr r2, GPIO1_SWPORTA_DR
blink:
	@ LED on
	str r1, [r2]
	bl delay

	@ LED off
	str r0, [r2]
	bl delay

	b blink

delay:
	mov r3, #0x100000
1: 	subs r3, r3, #1
	bne 1b
	bx lr

GPIO1_SWPORTA_DR:
	.word	0xff780000
GPIO1_SWPORTA_DDR:
	.word	0xff780004
