TITLE SUM                                     (sum.asm)

;Program: Sum of two integers, using clear screen and procedures
;Author : Unarine Nemangwela
;Date   : 23 August 2022

INCLUDE Irvine32.inc

.data

string1 BYTE "Enter the integer 1 : ",0
string2 BYTE "Enter the integer 2 : ",0      ;messages to show
answer  BYTE ", your sum is : ",0
loadMsg BYTE "wait system loading...",0
int1    DWORD ?                              ;labels for string user integer
int2    DWORD ?

.code

locateCursor PROC                            ;procedure for locating the cursor allignment

mov dh, 24                                   ;y-coordinate
mov dl, 40                                   ;x-coordinate
call gotoXY                                  ;call for x-and y- coordinates for cursor

ret
locateCursor ENDP



delayAndClearScreen PROC                     ;a procedure for delay

call Crlf
call Crlf
mov edx, OFFSET loadMsg                      ;print out "system loading...."
call WriteString
mov eax, 5000
call delay                                   ;pause the console for 5 seconds. (1000 ms = 1s)
call ClrScr                                  ;clear screen
ret
delayAndClearScreen ENDP

sumOfIntegers PROC                           ;a procedure for summing the two integers

call Crlf                                    ;new line
mov edx, OFFSET string1                      ;storing the address of string1 into reg edx
call WriteString                             ;printing the string1 asking for integer
call ReadInt                                 ;reading a value
mov int1, eax                                ;collecting the user-32bit integer
call Crlf                                    ;new line

mov edx, OFFSET answer
call WriteString
mov eax, [int1]                              ;summation of two user-32bit integers
add eax, [int2]
call WriteInt

call delayAndClearScreen                     ;wait for few seconds after printing sum before clear screen

ret
sumOfIntegers ENDP

main PROC                                    ;a procedure called main

call ClrScr                                  ;clear screen
;call sumOfIntegers                           ;call the procedure sumOfIntegers 1st time
;call sumOfIntegers                           ;||             ||                2nd time
;call sumOfIntegers                           ;||             ||                3rd time
mov ecx, 3
L1:
   call sumOfIntegers
   loop L1

exit
main ENDP                                    ;end procedure main
END main

