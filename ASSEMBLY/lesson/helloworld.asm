SECTION .data
msg db "Hello, World!", 0Ah

SECTION .text
global _start

_start:
mov ecx,msg ;message
mov edx, 14
mov ebx, 1 ;stdout
mov eax, 4;syswrite
int 80h ;interupt

mov ebx,0;return0
mov eax,1;sys-exit opcode
int 80h ;interupt
