lenn:
cmp byte [edx], 0Ah
je finished
inc edx
jmp lenn

len:
cmp byte [edx], 0
je finished
inc edx
jmp len

finished:
sub edx, ecx
ret

print:
push edx
push ecx
push ebx
push eax

mov ecx, eax
mov edx, ecx

cmp ebx, 0
je nlf
jmp lf

continue:
mov eax, 4
mov ebx, 1
int 80h

pop eax
pop ebx
pop ecx
pop edx

ret

lf:
call len
jmp continue

nlf:
call lenn
jmp continue

end:
mov eax, 1
mov ebx, 0
int 80h

