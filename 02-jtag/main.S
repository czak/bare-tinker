.globl _start

_start:
  b		main

main:
	ldr r0, =0x10001000
	ldr r1, =0xff770244
	str r0, [r1]

	ldr r0, =0x03ff02aa
	ldr r1, =0xff770064
	str r0, [r1]

halt:
	b		halt
