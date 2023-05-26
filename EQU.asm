TITLE how to use EQU and TEXTEQU for const labels (EQU.asm)

Include Irvine32.inc 

continueMsg TEXTEQU <"Do you wish to continue (Y/N)?">
rowSize = 5

.data
prompt1 BYTE continueMsg
count TEXTEQU %(rowSize * 2)		; evaluates the expression
setupAL TEXTEQU <mov al,count>

.code
setupAL		; generates: "mov al,10"
