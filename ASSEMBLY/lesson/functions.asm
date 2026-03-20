iprint:
push eax ;preserve eax-esi
push ecx ;eax=14
push edx
push esi
mov ecx, 0 ;temp counter for number of bytes to print

divideLoop:
inc ecx ;count each byte to print
mov edx, 0 ;empty out edx
mov esi, 10
idiv esi ;divides eax/esi. Quotient is stored inside eax, remainder is stored inside edx. If eax=14 eax wil be 1 and edx will be 4
add edx, 48 ;converts 4 to ascii code
push edx ;52 on stack
cmp eax, 0 ;checks if remainding numbers. eax remaining 1
jnz divideLoop 

printLoop:
dec ecx
mov eax, esp ;moves stack poinnter adress into eax
call sprint ;print
pop eax
cmp ecx, 0 ;checks if remaining integers still in stack
jnz printLoop 

pop esi
pop edx
pop ecx
pop eax
ret

iprintLF:
call iprint
push eax
mov eax, 0Ah
push eax
mov eax, esp
call sprint
pop eax
pop eax
ret

slen:
push ebx; 2x ebx on stack. Number 1 and 3
mov ebx, eax

nextchar:
cmp byte [eax],0
je finished
inc eax
jmp nextchar

finished:
sub eax, ebx
pop ebx ;restores original value of ebx. 1 more ebx remaining
ret

sprint:
push edx ;4th on stack
push ecx ;3rd on stack
push ebx ;2nd on stack
push eax ;1st on stack

call slen

mov edx, eax ;eax hold string length
pop eax ;restores original value of eax (message adress)

mov ecx, eax ;moves message adress into ecx
mov ebx, 1
mov eax, 4
int 80h

pop ebx ;restores original value
pop ecx ;restores original value
pop edx ;restores original value

ret

sprintLF:
call sprint ;print message

push eax ;pushes msg onto stack
mov eax, 0Ah ;moves 0Ah into eax
push eax ;pushes 0Ah on stack

mov eax, esp ;moves adress of (000000)0Ah in eax. 0Ah is sorted by little endian, 
	     ;so the smallest value goes last. 
             ;When printing it starts from 0Ah to the 0's following it

call sprint ;prints 0Ah

pop eax ;0Ah back into eax
pop  eax ;msg back into eax
ret ;return

quit:
mov ebx, 0
mov eax, 1
int 80h
ret
