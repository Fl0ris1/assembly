%include 'func.asm'

SECTION .data
msg1 db "Hello World!", 0Ah, 0
msg2 db "This Is Skipping LF's In NASM", 0Ah, 0

SECTION .text
global _start

_start:
mov ebx, 0
mov edx, msg2
mov eax, msg1
call print

mov ebx, 1
mov eax, edx
call print

call end
