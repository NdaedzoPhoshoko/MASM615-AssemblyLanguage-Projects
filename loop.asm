TITLE how to use the loop to sum values   (loop.asm)

INCLUDE Irvine32.inc

;A program that sum numbers from 1 to 10

.data
.code
main PROC

mov eax, 0                  ;start point, using eax as accumulator
mov ecx, 10                 ;start point, using a counter

L1:                         ;ecx <- ecx-1  10-1 9-1 8-1 ... 1-1      ;ecx decrements by default
    add eax, ecx                  ;1 2 3 4 5 6 7 8 9 10
    loop L1                       ;jump back to loop

call dumpRegs               ; call the registers including the eax reg accumulator

ret
main ENDP
END main

COMMENT p 

Syntax: LOOP target
Logic:
dec ecx
if ecx != 0, jump to target

p 