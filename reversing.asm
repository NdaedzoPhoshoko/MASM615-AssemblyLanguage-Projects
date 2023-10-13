TITLE Reversing String  (reversing.asm)
INCLUDE Irvine32.inc 

.data
aString BYTE "Assembly Language",0
StringSize BYTE ?
messageToShow BYTE "SHowing reversed text: ",0

.code
main PROC
mov StringSize, lengthof aString-1
movzx ecx, StringSize      ; set loop counter to length of string aString 
mov edx, 0                       ; set edx=0

Loop1:
  mov al, [aString+edx]            
  movzx ax, al                   
  push ax                        ; saving character read to stack
  inc edx                        ; incrementing index 0,1,2,3,...,lengthof-1
  loop Loop1                     ; repeat until all charaters are pushed
    
movzx ecx, StringSize      ; set loop counter to length of string aString
mov edx, 0                       ; set edx=0

Loop2:
 pop ax                          ; saving character read from stack
 mov [aString+edx], al
 inc edx                         ; incrementing index 0,1,2,3,...,lengthof-1
 loop Loop2                      ; repeat until all charaters are popped

mov edx, OFFSET messageToShow
call writeString
mov edx, offset aString
call writeString
exit
main ENDP
END main