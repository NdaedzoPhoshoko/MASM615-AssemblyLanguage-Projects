TITLE How to use the shift instr  in Masm615      (shiftInstruction.asm)

INCLUDE Irvine32.inc

.data

.code
main PROC
                                                ;start here
mov ax, 9BA6h
mov bx, 0AC36h
shld ax, bx, 1

call WriteBin
call dumpRegs                                   ;stop here

ret
main ENDP
END main

COMMENT p

Clement: THIS THINGS ARE COMPILCATED, always prove your answers by the machine for better understanding

;logical shift always put a zero infront of the byte and moves the LSB to the carry flag
;arithmetic shift always copy a sign MSB to the front of the byte and moves the LSB to the carry flag
;SHL (shift left) perfoms a logical left shift putting a 0 after LSB, moves the MSB to the carry flag 
;SHR (shift right) perfoms a logical right shift putting a 0 after MSB, moves the LSB to the carry flag
;SAL (shift arithmetic left) identical to SHL but also copies the MSB to the carry flag
;SAR (shift arithmetic right) identical to SHR but also copies the LSB to the carry flag
;ROL (rotate left) moves the MSB to the carry flag and copies the MSB to be the LSB
;ROR (rotate right) moves the LSB to the carry flag and copies the LSB to be the MSB
;RCL (rotate carry left) - same as ROL but also copies the carry flag to the LSB
                         - and then copies the MSB to the carry flag
;RCR (rotate carry right) - same as ROR but also copies the carry flag to the MSB
                          - and then copies the LSB to the carry flag
SHLD (shift left double) - copies n-MSB from source to destination, does not affect the source operand
                         - and cause the destination MSB to be shifted to the carry flag


;shift left instr
mov al, 10001111b     ;al = 143
shl al, 2             ;al = 00011110b = 30  eax = 143*2= 286   CF = 1

;shift right instr
mov al, 10001111b     ;al = 143
shr al, 1             ;al = 01000111b = 143/2 = 71   ax = eax = 143   CF = 0

;shift arithmetic left instr (same as SHL using 0 as the shift value)
mov al, -80            ; al = 10110000b   
sal al, 1              ; al = 01100000b = 96  CF = 1  (MSB is copied to the carry flag)

;shift arithmetic right ( same as SHR using 1 as the shift value)
mov al, -20            ;al = 11101100b
sar al, 1              ;al = -10 = 11110110b CF = 0

;rotate left instr
mov al, 11110000b      ; bl = F0h = 15d
rol al, 1              ; bl = 11100001 CF = MSB = 1

;rotate right instr
mov al, 11110000b      ; bl = F0h = 15d
ror al, 1              ; bl = 01111000b CF = LSB = 0

;rotate carry left instr
clc                    ; clear carry flag
mov al, 11110000b      ; bl = F0h = 150d   init CF = 0 init MSB = 1
rcl al, 1              ; bl = 11100001   fin CF = init MSB = 1  fin LSB = init CF = 0

;rotate carry right instr
clc                    ; clear carry flag
mov al, 11110000b      ; bl = F0h = 150d   init CF = 0 init LSB = 0
rcr al, 1              ; bl = 01111000b   fin CF = init LSB = 0  fin MSB = init CF = 0

;set and clear carry flag calls
clc                 ; clear carry flag  CF = 0
stc                 ; set carry flag    CF = 1

p