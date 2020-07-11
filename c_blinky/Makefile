CROSS_COMPILE = arm-none-eabi-

boot.img: boot.bin
	mkimage -n rk3288 -T rksd -d $< $@

boot.bin: boot.elf
	$(CROSS_COMPILE)objcopy -O binary $< $@

boot.elf: start.S main.c
	$(CROSS_COMPILE)gcc -g -Wl,--build-id=none -Ttext=0xff704000 -nostdlib $^ -o $@

.PHONY: burn_sdb clean

burn_sdb: boot.img
	sudo dd if=$< of=/dev/sdb seek=64 oflag=sync status=progress

clean:
	rm -f *.img *.bin *.elf
