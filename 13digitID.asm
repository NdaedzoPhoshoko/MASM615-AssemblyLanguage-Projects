TITLE  a program to allow user to enter  SA 13 digit ID (13digitID.asm)

INCLUDE IRVINE32.INC 
.data
promptStr BYTE "enter SA 13-digit ID: ", 0
byteArray BYTE 13 DUP(?)
.code
main proc
mov edx, offset promptStr
call writeString
mov edx, offset byteArray
mov ecx, sizeof byteArray
call readString

mov eax, 0
mov al, byteArray
call writeString
exit
main ENDP 
END main