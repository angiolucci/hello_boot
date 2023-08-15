; hello_boot
; Copyright (C) 2023  Vinícius Angiolucci Reis

; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; version 2.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License along
; with this program; if not, write to the Free Software Foundation, Inc.,
; 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


ORG 0x00
BITS 16

_start:
	jmp short start   ; It seems some BIOSes use the following 
	nop               ; pad to write info about 
	times 33 db 0     ; BIOS Parameter Block (BPB)  
    ; https://wiki.osdev.org/FAT#BPB_.28BIOS_Parameter_Block.29
start:
	jmp 0x7c0:step2

step2:
	cli
	mov ax, 0x7c0 ; Making sure that register
	mov es, ax    ; segments are correctly
	mov ds, ax    ; set to 0x7c0, which is
	mov ax, 0x00  ; where the BIOS loads our
	mov ss, ax    ; executable in memory.
	mov sp, 0x7c00; 
	sti
	mov si, message
	call print	
	jmp $ 

print:
	mov bx, 0
.loop:
	lodsb
	cmp al, 0
	je .done
	call print_char
	jmp .loop
.done:
	ret

print_char:
	mov ah, 0xe
	int 0x10
	ret

message:  db 'It works! (kind of)', 0


times 510- ($ - $$) nop 
dw	0xAA55			; 55AA Boot partition signature
