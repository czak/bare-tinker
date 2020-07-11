@ vim: filetype=arm
.globl _start

_start:
	@ Needs to be here as mkimage will overwrite this
	@ with 'RK32'
	nop

	@ Enable jtag on GPIO6C pins
	ldr r0, =0b00000011111111110000001010101010
	ldr r1, GRF_GPIO6C_IOMUX
	str r0, [r1]

	@ Set stack pointer
	ldr sp, =0xff708000

	bl main

1:	b 1b

GRF_GPIO6C_IOMUX:
	.word	0xff770064
