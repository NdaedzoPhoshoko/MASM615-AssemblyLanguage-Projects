TITLE Reversing String       (reverseString.asm)
INCLUDE Irvine32.inc

.data
nameStr BYTE "John Doe"
.code
main PROC
mov ecx, LENGTHOF nameStr           ;set loop counter to length of string nameStr 
mov edx,0                           ; set edx=0,  its child dx will store index
mov eax, 0                          ; eax=0 
myLoop1:
    movzx eax, [nameStr+dx]
    push eax                        ;saving character read to stack
    inc dx                           ;incrementing index 0,1,2,3....lengthof-1
    loop myLoop1

mov ecx, LENGTHOF nameStr           ;set loop counter to length of string nameStr
mov eax, 0
mov edx,0                           ; set edx=0,  its child dx will store index
myLoop2:
    pop eax                         ;saving character read from stack
    mov [nameStr+dx], al            
    inc dx                          ;incrementing index 0,1,2,3....lengthof-1
    loop myLoop2

mov edx, OFFSET nameStr             ;pointing edx to string to be displayed
call writeString

call dumpRegs
exit
main ENDP
END main
