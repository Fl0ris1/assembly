SECTION .data
msgn db "NO",0Ah
msgy db "YES",0Ah
lenn equ $-msgn
leny equ $-msgy

SECTION .text
global _start

_start:
mov eax,2
cmp eax,2
je equal
jmp notequal

equal:
mov edx,leny
mov ecx,msgy
mov ebx,1
mov eax,4
int 80h
jmp finished

notequal:
mov edx, lenn
mov ecx, msgn
mov ebx, 1
mov eax, 4
int 80h
jmp finished


finished:
mov ebx,0
mov eax,1
int 80h

