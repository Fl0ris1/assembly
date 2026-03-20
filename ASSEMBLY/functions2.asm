len:
mov ecx,eax
mov edx,ecx

nextchar:
cmp byte [edx],0Ah
je done
inc edx
jmp nextchar

done:
sub edx,ecx
ret

printN:
push edx
push ecx
push ebx
push eax

call len

mov eax,4
mov ebx,1
int 80h

pop eax
pop ebx
pop ecx
pop edx

ret
quit:
mov eax,1
mov ebx,0
int 80h
ret
