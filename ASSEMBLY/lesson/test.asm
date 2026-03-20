%include 'functions.asm'

SECTION .text
global _start

_start:
mov eax, 1
mov ebx, 0

nextNum:
push eax
add eax, ebx
pop ebx

cmp eax, 9999999
jg exit

call iprintLF

jmp nextNum

exit:
call quit
