TITLE How to manipulate addresses of labels  (addressing.asm)

INCLUDE Irvine32.inc

.data
var1 DWORD ?

.code
bval BYTE 12
wval WORD 100

main PROC
                              ;start here
;mov wval, bval           ;error memory-to-memory
;mov al, bval              ; true
;mov eax, al               ;error size or type mismatch            
movzx eax, al              ; true since the HSB of eax are mapped with zeros and LSB are filled with al

main ENDP
END main