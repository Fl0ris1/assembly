SECTION .data
msgy db "YE", 0Ah
msg db "NO", 0Ah, 0

SECTION .text
global _start

_start:
mov ecx,msgy
mov edx,1
mov eax,4
mov ebx,1
int 80h
jmp finished

finished:
mov eax,1
mov ebx,0
int 80h
