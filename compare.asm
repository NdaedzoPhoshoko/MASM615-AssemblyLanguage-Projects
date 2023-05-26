TITLE study session (study.asm)

INCLUDE Irvine32.inc

.data
message BYTE "NUMBER IS ABOVE 16",10d,13d,0
.code

myFunction PROC
    mov edx, OFFSET message
    call Crlf
    call WriteString
ret
myFunction ENDP

main PROC

mov bl, 00000010b

AND bl, 00010000b
cmp bl, 00010000b
jnz myFunction

ret
main ENDP
END main