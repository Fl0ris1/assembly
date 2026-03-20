lenn:
cmp byte [edx], 0Ah
je done
inc edx
jmp lenn

len:
cmp byte [edx], 0
je done
inc edx
jmp len

done:
sub edx, ecx
ret

print:
push edx
push ecx
push ebx
push eax

mov edx, ecx

cmp ebx, 0
je nlf

cmp ebx, 1
je lf

return:
mov eax, 4
mov ebx, 1
int  80h

pop eax
pop ebx
pop ecx
pop edx

ret

lf:
call len
jmp return

nlf:
call lenn
jmp return

quit:
mov eax, 1
mov ebx, 0
int 80h
ret
