TITLE Project for tester      (project.asm)


INCLUDE IRVINE32.INC

.data

.code 
main PROC 

mov eax, 0
mov ebx, 0
mov ecx, 0

mov al, 0d4h
rol al, 1

call dumpregs

exit
main ENDP
END main