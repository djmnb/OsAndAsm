

%.bin: %.asm
	nasm -f bin $< -o $@



%.img: boot.bin
	dd if=boot.bin of=$@ bs=512 count=1 conv=notrunc
	rm -rf boot.bin

# boot.img: boot.bin
# 	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
# 	rm -rf boot.bin

run:  boot.img
	bochs -q




.PHONY: clean run writeLoaderbin

clean:
	rm -rf *.bin

writeLoaderbin:
	mkdir /tmp/boot_img_mount
	sudo mount -o loop boot.img -t vfat /tmp/boot_img_mount
	sudo cp loader.bin /tmp/boot_img_mount/
	sudo umount /tmp/boot_img_mount
	rmdir /tmp/boot_img_mount

 


