%include 'functions.asm'

SECTION .data
msg1 db "What's Your Name?", 0
msg2 db "Hello, ",0

SECTION .bss
sinput: resb 255 ;reserve 255 bytes in memory for user input

SECTION .text
global _start

_start:
mov eax, msg1
call sprintLF

mov edx, 255 ;number of bytes to read
mov ecx, sinput ;reserved space to store input (buffer)

mov ebx, 0 ;stdin
mov eax, 3 ;invoke sys_read (opcode 3)
int 80h

mov eax, msg2
call sprint

mov eax, ecx
call sprint

call quit
