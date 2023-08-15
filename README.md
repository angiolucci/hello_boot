hello_boot
==========

A simple ~~bootloader for~~ code that boots on  8086. This is just a hobby/study project. On its current state, only shows a greetings message, but in the future, maybe, hopefully, ~~who knows?~~ it will be able to load a very, very, very simple kernel, supporting interrupts, virtual memory paging and all those fancy stuff.

### Requisites
- nasm 
- gnu make (otional)

### Building
- make build #OR
- nasm -f bin boot.asm boot.bin

### Running
You can use qemu-x86_64 to test it by one of the following commands:
- make run #OR
- qemu-system-x86_64 -hda boot.bin

Makefile's "run" target supposes you have a working system with kvm. If not running on x86_64 as a host system, just remove the "-accel kvm" argument on Makefile.

You can try to use dd to write the generated bin file to a bootable device (not recomended), but a successfully is not guaranteed.


### Goals
- [x] Boot up on 8086 real mode
- [ ] Boot up on x86 protected mode
- [ ] Load up some usable payload
