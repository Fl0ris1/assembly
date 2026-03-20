%include 'functions.asm'

SECTION .data
msg1 db "Hello",0

SECTION .text
global _start

_start:
pop ecx

mov ecx,msg1
pop ecx

nextArg:
cmp ecx,0h
jz noMoreArgs
pop eax
call sprintLF
dec ecx
jmp nextArg

noMoreArgs:
call quit
