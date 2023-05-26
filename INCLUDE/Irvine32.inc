; Include file for Irvine32.lib             (Irvine32.inc)

;OPTION CASEMAP:NONE		; optional: make identifiers case-sensitive

INCLUDE SmallWin.inc		; MS-Windows prototypes, structures, and constants

.NOLIST

; Last update: 11/18/02

;----------------------------------------
; Procedure Prototypes
;----------------------------------------
Clrscr PROTO		; clear the screen
Crlf PROTO		; output carriage-return / linefeed
Delay PROTO		; delay for n milliseconds
DumpMem PROTO		; display memory dump
DumpRegs PROTO		; display register dump
GetCommandtail PROTO		; get command-line string
GetDateTime PROTO,		; get system date and time
	startTime:PTR QWORD
GetMaxXY PROTO		; get console rows and columns
GetMseconds PROTO		; get milliseconds past midnight
Gotoxy PROTO		; set the cursor position
IsDigit PROTO		; return ZF=1 if AL is a decimal digit
Randomize PROTO		; reseed random number generator
RandomRange PROTO		; generate random integer in specified range
Random32 PROTO		; generate 32-bit random integer
ReadInt PROTO		; read signed decimal integer from console
ReadChar PROTO		; reach single character from console
ReadDec PROTO		; read unsigned decimal integer from console
ReadHex PROTO		; read hexadecimal integer from console
ReadString PROTO		; read string from console
SetTextColor PROTO		; set console text color
WaitMsg PROTO		; display wait message, wait for Enter key
WriteBin PROTO		; write integer to output in binary format
WriteBinB PROTO		; write binary integer in byte, word,or doubleword format
WriteChar PROTO		; write single character to output
WriteDec PROTO		; write unsigned decimal integer to output
WriteHex PROTO		; write hexadecimal integer to output
WriteHexB PROTO		; write hexadecimal integer in word or doubleword format
WriteInt PROTO		; write signed integer to output
WriteString PROTO		; write null-terminated string to output

; Copy a source string to a target string.
Str_copy PROTO,
 	source:PTR BYTE,
 	target:PTR BYTE

; Return the length of a null-terminated string..
Str_length PROTO,
	pString:PTR BYTE

; Compare string1 to string2. Set the Zero and
; Carry flags in the same way as the CMP instruction.
Str_compare PROTO,
	string1:PTR BYTE,
	string2:PTR BYTE

; Trim a given trailing character from a string.
; The second argument is the character to trim.
Str_trim PROTO,
	pString:PTR BYTE,
	char:BYTE

; Convert a null-terminated string to upper case.
Str_ucase PROTO,
	pString:PTR BYTE

;-----------------------------------
; Standard 4-bit color definitions
;-----------------------------------
black        = 0000b
blue         = 0001b
green        = 0010b
cyan         = 0011b
red          = 0100b
magenta      = 0101b
brown        = 0110b
lightGray    = 0111b
gray         = 1000b
lightBlue    = 1001b
lightGreen   = 1010b
lightCyan    = 1011b
lightRed     = 1100b
lightMagenta = 1101b
yellow       = 1110b
white        = 1111b
.LIST