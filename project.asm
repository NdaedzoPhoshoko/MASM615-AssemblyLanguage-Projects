TITLE        program for      VAL1+(VAL2-VAL3)*VAL4                     (project.asm)

INCLUDE irvine32.inc

.data

.data?

.code
main PROC 

mov eax, 346680Ah
mov ebx, 35757ABh
push eax

mov [esp], ebx
pop eax
call dumpregs

exit
main ENDP
END main 

COMMENT p
please note that
        mul bl
simply means ax= al*bl
p
