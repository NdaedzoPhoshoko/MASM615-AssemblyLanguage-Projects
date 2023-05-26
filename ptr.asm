TITLE How to use the PTR dir for overriding the label types        (offset.asm)

Include Irvine32.inc 

.data?

.data
myBytes BYTE 12h,34h,56h,78h
varW WORD 6543h,1202h


.code
main PROC

;mov ax,WORD PTR [myBytes]		; AX = 3412h
;mov ax,WORD PTR [myBytes+2]		; AX = 7856h
;mov eax,DWORD PTR myBytes		; EAX = 78563412h
mov bl,BYTE PTR [[varW+2]+1]    ; bl= 12h

call DumpRegs

ret
main ENDP
END main
COMMENT p 

Override operator syntax
Type PTR destination, source     overrides the source to a specified type

example
the value 22222h will it be stored on the WORD memory segment?
No, 22222h in decimal is > 65535, so only values less than 2^16-1 will be required on the segment

How PTR is used to store smaller values to a single larger value
test by myBytes 12h,34h,56h,78

mov ax,WORD PTR [myBytes]		; AX = 3412h
mov ax,WORD PTR [myBytes+2]		; AX = 7856h
mov eax,DWORD PTR myBytes		; EAX = 78563412h


adressing   index/post  WORD    DWORD
12h        myBtyes+0    3412    78563412h  
34h        myBtyes+1    
56h        myBtyes+2    7856
78h        myBtyes+3


p