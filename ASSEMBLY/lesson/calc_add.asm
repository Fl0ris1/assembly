%include 'functions.asm'

SECTION .text
global _start

_start:
mov ebx, 1
mov eax, 99
add eax, ebx

call iprintLF

call quit

