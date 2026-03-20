SECTION .data
msg1 db "HELLO," ,0
msg2 db "WORLD!" ,0Ah,0
msg3 db "HIDDEN MESSAGE",0Ah, 0

SECTION .text
global _start
_start:

mov ecx,msg1
mov edx,ecx
call len

mov eax,4
mov ebx,1
int 80h

mov ecx,msg2
mov edx,ecx
call len

mov eax,4
mov ebx,1
int 80h

mov eax,1
mov ebx,0
int 80h

len:
cmp byte [edx],0
je complete
inc edx
jmp len

complete:
sub edx,ecx
ret
