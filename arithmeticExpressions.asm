title Project for evaluating expression VAL1+(VAL2-VAL3)*VAL4  (arithmeticExpressions.asm)

;author: Ndaedzo Phoshoko
;date: 02/09/2023
;time: 00:17

INCLUDE irvine32.inc

.data
VAL1 BYTE 4d
VAL2 BYTE 6d
VAL3 BYTE 5d
VAL4 BYTE 7d
msgStr BYTE "VAL1+(VAL2-VAL3)*VAL4 = ",0          ;string to display
.data?
VAL5 BYTE ?                                       ;variable to store evaluated answer

.code
main PROC 

mov eax,0
mov al, VAL2
sub al, VAL3                                       ;al=(VAL2-VAL3)
mov bl, VAL4
mul bl                                             ;ax=(VAL2-VAL3)*VAL4
add al, VAL1                                       ;al=VAL1+(VAL2-VAL3)*VAL4
mov VAL5, al                                       ;val5=al

mov edx, OFFSET msgStr
call writeString                                   ;displaying string msgStr
call writeInt                                      ;displaying value from ax register since it is a child of eax

exit
main ENDP
END main 

COMMENT p
please note that
        mul bl
simply means ax= al*bl
p
