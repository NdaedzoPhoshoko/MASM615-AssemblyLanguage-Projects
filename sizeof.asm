TITLE how to use the sizeof dir

;SIZEOF = SIZE * LENGTHOF

INCLUDE Irvine32.inc 

.data	                    ;SIZEOF
byte1  BYTE 10,20,30	    ; 3
array1 WORD 30 DUP(?),0,0	; 64
array2 WORD 5 DUP(3 DUP(?))	; 30
array3 DWORD 1,2,3,4	    ; 16
digitStr BYTE "12345678",0	; 9

.code

main PROC
mov ecx,SIZEOF array1	    ; 64
call DumpRegs
ret
main ENDP
END main
