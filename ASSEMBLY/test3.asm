SECTION .text
global _start

_start:
mov ecx,48
push ecx
mov ecx, esp

mov edx,1

mov eax,4
mov ebx,1
int 80h

pop ecx

mov ebx, 0
mov eax,1
int 80h
