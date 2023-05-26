TITLE Using Direct-Offeset Operands  (dereference.asm)

Include Irvine32.inc 

.data
arrayW  WORD 1000h,2000h,3000h, 4000h, 5000h, 6000h   ;index 0 2 4 6 8 10 12 
arrayD  DWORD 1,2,3,4,14,12,10,6         ;index 0 4 8 12 16         
.code

main PROC

;Will the following statements assemble?
mov ax,[arrayW+10]		; ?? true   = 0
;mov eax,[arrayD+16]		; ?? true   = 00000

call dumpRegs 
ret
main ENDP
END main
