SECTION .data
msg db "Hello", 0Ah, 0

SECTION .text

global _start
_start:
mov ecx,msg
mov edx,0
call strlen
mov eax,4
mov ebx,1
int 80h

mov eax,1
mov ebx,0
int 80h

strlen:
cmp byte [ecx],0
je done
inc edx
inc ecx
jmp strlen

done:
mov ecx,msg
ret

