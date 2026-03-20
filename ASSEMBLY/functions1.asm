lenn:
mov ecx,eax
mov edx,ecx

nextcharn:
cmp byte [edx],0Ah
je donen
inc edx
jmp nextcharn

donen:
sub edx,ecx
ret

len:
push ebx
mov ebx,eax

nextchar:
cmp byte [eax],0
je done
inc eax
jmp nextchar

done:
sub eax,ebx
pop ebx
ret

print:
push edx
push ecx
push ebx
push eax

call len

mov edx,eax
pop eax
mov ecx,eax

mov eax,4
mov ebx,1
int 80h
pop ebx
pop ecx
pop edx

ret

printLF:
call print
push eax
mov eax,0Ah
push eax
mov eax,esp
call print
pop eax
pop eax
ret

printN:
push edx
push ecx
push ebx
push eax

call lenn
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
