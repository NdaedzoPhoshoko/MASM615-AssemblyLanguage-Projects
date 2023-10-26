TITLE    testing (project.asm)

INCLUDE IRVINE32.INC 
.data
promptAge BYTE "Enter age: ",0
printYes BYTE "Eligible",0
printNo BYTE "Not Eligible",0
.code
main proc

mov edx, OFFSET promptAge
call WriteString
call ReadInt
cmp al, 18d
jae L1
mov edx, OFFSET printNo
call WriteString
jmp L2
L1: mov edx, OFFSET printYes
    call WriteString
L2:
exit
main ENDP 
END main