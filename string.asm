TITLE String test          (string.asm)

Include Irvine32.Inc

.data
menu BYTE "Checking Account",       13,10,13,10,         ;skip two lines
	"1. Create a new account" ,     0dh,0ah,            ;similar_to call Crlf
	"2. Open an existing account",  0dh,0ah,            ;similar_to 13,10
	"3. Credit the account",        0dh,0ah,
	"4. Debit the account",         0dh,0ah,
	"5. Exit",                      0ah,0ah,
	"Choice> ",0

.code

main PROC

mov edx, OFFSET menu
mov ecx, SIZEOF menu      ;sizeof = type * size
call WriteString          ;printing the menu string

ret
main ENDP
END main

COMMENT p
instructions for newline
use hexadecimal 0Dh,0Ah
or use the functionCall call Crlf
or use code decimal 13,10
or use binary  1101b,1010b

in short is 
0Dh = carriage return
0Ah = line feed

p