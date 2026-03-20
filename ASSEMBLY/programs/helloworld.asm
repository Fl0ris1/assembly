%include 'functions.asm'

SECTION .data
msg1 db "Hello, ", 0Ah, 0
msg2 db "World!", 0Ah, 0

SECTION .text
global _start

_start:
mov edx, msg2
mov ecx, msg1
mov ebx, 0

call print

mov ecx, edx
mov ebx, 1

call print

call quit
