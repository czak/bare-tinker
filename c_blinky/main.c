int main() {
	volatile int *GPIO1_SWPORTA_DR = (int *)0xff780000;
	volatile int *GPIO1_SWPORTA_DDR = (int *)0xff780004;

	*GPIO1_SWPORTA_DDR = 0b00000001000000000000000000000000;

	while (1) {
		// LED on
		*GPIO1_SWPORTA_DR = 0b00000001000000000000000000000000;

		for (int i = 0; i < 1000000; i++)
			;

		// LED off
		*GPIO1_SWPORTA_DR = 0;

		for (int i = 0; i < 1000000; i++)
			;
	}
}
