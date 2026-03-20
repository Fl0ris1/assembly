%include 'functions.asm'

SECTION .data
quotient db "QUOTIENT: ", 0
remainder db "REMAINDER: ", 0

SECTION .text
global _start

_start:

mov eax, quotient
call sprint

mov eax, 20
mov ebx, 3
idiv ebx

call iprintLF

mov eax, remainder
call sprint

mov eax, edx
call iprintLF

call quit
