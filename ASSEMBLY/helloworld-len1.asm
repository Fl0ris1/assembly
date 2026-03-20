SECTION .data
msg db "Hello, Brave New World!", 0Ah, 0

SECTION .text
global _start
_start:

mov ecx,msg
mov ebx,1
mov eax,4

call len
int 80h

mov ebx,0
mov eax,1
int 80h

len:
push ebx
mov ebx,ecx

nextchar:
cmp byte [ebx],0
je done
inc ebx
jmp nextchar

done:
sub ebx,ecx
mov edx,ebx
pop ebx
ret
