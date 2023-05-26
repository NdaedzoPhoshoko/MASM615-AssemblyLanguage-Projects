TITLE ASSIGNMENT1         (Assignment1.asm)

;Program: Sum of two integers, using clear screen and procedures
;Author : Unarine Nemangwela
;Date   : 23 August 2022

INCLUDE Irvine32.INC 

.data 
VarName BYTE 15 DUP(0),0
nameMsg BYTE "Enter your Name: ",0
ageMsg BYTE "Enter your age: ",0
spaceMgs BYTE ", age ",0
string1 BYTE "Enter Integer 1: ",0
string2 Byte "Enter Integer 2: ",0
sumMsg BYTE "Your sum is : ",0
loadMsg BYTE "System Loading...",0

.data?
age DWORD ?
int1 DWORD ?
int2 DWORD ?
VarSum  DWORD ?

.code

userName PROC                    ; procedure for collecting user name

mov dh, 24d                      ; y-coordinate : y= 24d
mov dl, 40d                      ; x-coordinate : x= 40d
call gotoXY

mov edx, OFFSET nameMsg
call WriteString
mov edx, OFFSET VarName
mov ecx, SIZEOF VarName
call ReadString
ret
userName ENDP

ageProcedure PROC                ; procedure for collecting user age

mov dh, 25d                      ; y-coordinate : y= 25d
mov dl, 40d                      ; x-coordinate : x= 40d
call gotoXY

mov edx, OFFSET ageMsg
call WriteString
call ReadInt
mov age, eax
ret
ageProcedure ENDP

summation PROC
call Crlf                        ; open newline

mov dh, 26d                      ; y-coordinate : y= 26d
mov dl, 40d                      ; x-coordinate : x= 40d
call gotoXY

mov edx, OFFSET VarName
call WriteString
mov edx, OFFSET spaceMgs
call WriteString
mov eax, age
call WriteInt

call Crlf
mov dh, 27d                      ; y-coordinate : y= 27d
mov dl, 40d                      ; x-coordinate : x= 40d
call gotoXY

mov edx, OFFSET string1
call WriteString                 ; "enter integer 1: ____"
call ReadInt                   
mov int1, eax

mov dh, 28d                      ; y-coordinate : y= 28d
mov dl, 40d                      ; x-coordinate : x= 40d
call gotoXY

mov edx, OFFSET string2          ; "enter integer 2: ____"
call WriteString
call ReadInt
mov int2, eax

mov eax , [int1]
add eax , [int2]                   
mov VarSum, eax                   ; VarSum = int1 + int2

call Crlf
mov dh, 29d                       ; y-coordinate : y= 29d
mov dl, 40d                       ; x-coordinate: x= 40d
call gotoXY

mov edx, OFFSET sumMsg            ; "Your sum is : ____"
call WriteString
mov eax, VarSum 
call WriteInt                     ; display sum

ret 
summation ENDP

systemLoading PROC               ; a procedure for delay
call Crlf
mov edx, OFFSET loadMsg
call WriteString
mov eax, 5000                    ; pause the console for 5000milliseconds 
call delay                       ; 5000ms/1000 = 5s delay

ret
systemLoading ENDP

main PROC

call ClrScr                      ; clears the screen
call userName
call ageProcedure

mov ecx, 3                       ;  let it run 3 times
myLoop:
      call summation
      call systemLoading         ; delay for 5s
      call ClrScr
      loop myLoop

exit
main ENDP
END main
