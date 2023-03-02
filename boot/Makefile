ASM=nasm

boot-img:
	test -f boot.img || bximage -func=create -fd="1.44M" -q boot.img

boot-bin: boot/boot.asm
	@echo $(ASM)
	$(ASM) boot/boot.asm -o boot.bin

boot-floopy: boot-bin boot-img
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc

loader-bin: boot/loader.asm boot/fat12.inc
	@echo $(ASM)
	$(ASM) boot/loader.asm -o loader.bin

loader-floopy: loader-bin boot-floopy
	test -d tmp || mkdir tmp
	sudo mount boot.img ./tmp -t vfat -o loop
	sudo cp loader.bin ./tmp
	sync
	sudo umount tmp
