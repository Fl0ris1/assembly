%include 'functions.asm'

SECTION .text
global _start

_start:
mov eax, 0

nextNumber:
inc ecx ;ecx+1

mov eax, ecx
call iprintLF
cmp ecx, 10
jne nextNumber
call quit
