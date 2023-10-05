

%.bin: %.asm
	nasm -f bin $< -o $@

master.img: boot.bin
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc

run:  master.img
	bochs -q


.PHONY: clean

clean:
	rm -rf *.bin