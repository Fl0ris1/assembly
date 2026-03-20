%include 'functions.asm'

SECTION .text
global _start

_start:
mov ebx, 4
mov eax, 16
mul ebx ;multiplies operand with eax

call iprintLF

call quit

