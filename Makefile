boot.bin: boot.asm
	nasm -f bin	boot.asm -o boot.bin

view: boot.bin
	hexdump -C boot.bin | less

run: boot.bin
	qemu-system-x86_64 -accel kvm -hda boot.bin 

clean:
	rm -fr boot.bin
