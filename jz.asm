TITLE How to generate random numbers (random.asm)

INCLUDE Irvine32.inc

.data
answer BYTE "number is even!",10d,13d,0
number WORD 12

.code
answerPROC PROC

mov edx, OFFSET answer
call WriteString

ret
answerPROC ENDP
 
main PROC 
                   ;check for even
mov ax, number
and ax, 1
jz answerPROC

;call dumpRegs

ret
main ENDP
END main