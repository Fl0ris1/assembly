%include 'func.asm'

SECTION .data
msg1 db "Hello World!", 0
msg2 db "This Is Recycling In NASM", 0

SECTION .text
global _start

_start:
mov eax, msg1
call sprint

mov eax, msg2
call printLF

call quit
