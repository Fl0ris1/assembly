%include 'functions.asm'

SECTION .text
global _start

_start:
mov ebx, 5
mov eax, 37
sub eax, ebx

call iprintLF

call quit

