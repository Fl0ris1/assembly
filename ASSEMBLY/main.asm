;; 
; Welcome to GDB Online.
; GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
; C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
; Code, Compile, Run and Debug online from anywhere in world.
; 
; 

SECTION .data
msg db "Hello World", 0Ah

SECTION .text
global _start

_start:
mov edx,12 ;amount of bytes
mov ecx,msg ;message 
mov ebx, 1 ;stdout
mov eax, 4;syswrite
int 80h ;interupt

mov ebx,0;return0
mov eax,0;sys-exit opcode
int 80h ;interupt