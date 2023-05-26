TITLE A project for learning assembly and flags (flagProject.asm)

.data                        ; data declaration
num1 BYTE 101b               ;num1 = 5
nameOfStudent WORK ? 
age BYTE 22d

.code                        ; this is a body of the assembly code

main PROC                    ;PROC is telling the assembler that 'main' is the function
mov eax, 32d
add eax, 23d

exit                         ;this is a reserved keyword for exiting the function
main ENDP
END main                     ;alert done with function