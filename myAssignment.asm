TITLE Program involving the jumps and bolean expressions (myAssignment.asm)

;Author: Unarine Nemangwela
;Student no: 202110155
;Date: 30 August 2022

INCLUDE IRVINE32.inc 

.data                                  ;initialized labels
nameMsg BYTE "Enter your name: ",0
ageMsg BYTE "Enter your age: ",0
userName BYTE 20 DUP(0),0
votingMsg BYTE ", you are allowed to vote.",0
notVotingMsg BYTE ", you are not yet allowed to vote.",0

.data?                                 ;uninitialized labels
age DWORD ?

.code                                  ;procedures
nameAndAge PROC                        ;procedure for prompting user's name and age

mov edx, OFFSET nameMsg
call writeString
mov edx, OFFSET userName
mov ecx, SIZEOF userName
call readString

call Crlf
mov edx, OFFSET ageMsg
call writeString
call readInt
mov age, eax
call Crlf

ret
nameAndAge ENDP

isVoting PROC                      ;display that the user is allowed to vote

mov edx, OFFSET userName
call writeString
mov edx, OFFSET votingMsg
call writeString

ret
isVoting ENDP

isNotVoting PROC                      ;display that the user is not allowed to vote

mov edx, OFFSET userName
call writeString
mov edx, OFFSET notVotingMsg
call writeString

ret
isNotVoting ENDP

main PROC

call ClrScr
call nameAndAge                   ; collect name and age

cmp age, 18                       ;jump to isVoting if age>=18
jge isVoting

cmp age, 18                       ;jump to isNotVoting if age<18
jL isNotVoting

exit
main ENDP
END main