TITLE how to manipulate the data using a pointer   (pointer.asm)

INCLUDE Irvine32.inc 

.data
arrayDW DWORD 1000h,2000h,3000h            ;index  0   4   8   12......
ptrW DWORD arrayDW                          ; assign the address of arrayDW into the pointer ptrW

.code
main PROC

mov esi, ptrW               ;store address of ptrW into the esi reg
mov eax, [esi+4]

call dumpRegs               ; call the registers including the eax reg accumulator

ret
main ENDP
END main

;You cannot dereference a pointer, it yeild the address stored in the pointer