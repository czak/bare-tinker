.globl _start

_start:
	b main

main:
	// Enable jtag on GPIO6C pins
	ldr r0, =0b00000011111111110000001010101010
	ldr r1, GRF_GPIO6C_IOMUX
	str r0, [r1]

	// Set GPIO1_D0 as output
	ldr r0, =0b00000001000000000000000000000000
	ldr r1, GPIO1_SWPORTA_DDR
	str r0, [r1]

	// Output 1 on GPIO1_D0
	ldr r0, =0b00000001000000000000000000000000
	ldr r1, GPIO1_SWPORTA_DR
	str r0, [r1]

halt:
	b halt

GRF_GPIO6C_IOMUX:
	.word	0xff770064
GPIO1_SWPORTA_DR:
	.word	0xff780000
GPIO1_SWPORTA_DDR:
	.word	0xff780004
