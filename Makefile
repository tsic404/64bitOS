build-boot:
	make -f boot/Makefile boot-floopy

build-loader:
	make -f boot/Makefile loader-floopy

run: build-loader build-boot
	bochs -f bochsfrc

.PHONY : clean
clean :
	rm *.bin || exit 0
	rm *.img || exit 0
	rmdir tmp || exit 0
