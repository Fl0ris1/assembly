%include 'functions1.asm'

SECTION .data
msg1 db "Hello, World!",0Ah ,0
msg2 db " I Am Awake!",0Ah, 0

SECTION .text
global _start

_start:
mov eax, msg1
call printN
mov eax,msg2
call print

call quit
