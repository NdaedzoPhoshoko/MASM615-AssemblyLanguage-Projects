TITLE test study (study.asm)

INCLUDE Irvine32.inc 

.data
c1 BYTE 3d
d1 WORD 1001111010111100b
a1 BYTE 01010111b
.code
main PROC
              ;start here
mov cl, c1
mov dx, d1
movzx ax, a1

Shr dx, 1           ;a =     4F5E  

Shr dx, cl      ;b =     09EB     

Rol dx, cl       ;c =    4F58        

Ror al, 1         ;d = AB

Rcr al, cl             ;e =  FA         

Rcr dx, 1                 ;f = 27AC

Sar dx, cl                ;g =     04F5

Sar al, 1             ;h= FA 
Rcl dx, cl                 ; i=   27AC
rcl al, cl       ; j = D3


call writeBin
call dumpRegs ;end here

ret
main ENDP
END main