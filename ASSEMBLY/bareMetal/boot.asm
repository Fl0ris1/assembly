[org 0x7c00]

start:
	cli
	xor ax, ax
	mov ss, ax
	mov sp, 0x7c00
	mov ds, ax
	mov es, ax
	sti

	mov ah, 0x0e
	mov al, 'M'
	int 0x10

	jmp $

error:
	mov ah, 0xe
	mov al, 'E'
	int 0x10
	jmp $

times 510 - ($ - $$) db 0
dw 0xAA55
