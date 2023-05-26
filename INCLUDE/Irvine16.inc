; Irvine16.inc - Include file for programs using
; the Irvine16.lib (Real-address mode library).

; Last update: 12/11/02

.NOLIST

.model small,stdcall
.stack 200h		 ; changed 10/21/02
.386

ClrScr PROTO
Crlf PROTO
Delay PROTO
DumpMem PROTO
DumpRegs PROTO
GetCommandtail PROTO			; added 08/26/02. Capitalization changed 10/28/02
GetMaxXY PROTO			; added 10/20/02
GetMseconds PROTO		 ; added 10/21/02
Get_Time PROTO
Gotoxy PROTO
IsDigit PROTO
Randomize PROTO
RandomRange PROTO
Random32 PROTO
ReadHex PROTO
ReadInt PROTO
ReadChar PROTO
ReadString PROTO
WaitMsg PROTO
WriteBin PROTO
WriteBinB PROTO		; added 12/11/02
WriteChar PROTO
WriteDec PROTO
WriteHex PROTO
WriteHexB PROTO		; added 12/11/02
WriteInt PROTO
WriteString PROTO

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


exit EQU <.EXIT>
@cmdline EQU <OFFSET __98765765cmdline>

;-----------------------------------
; STANDARD 4-bit COLOR DEFINITIONS
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


;--------------------------------------------------
; Structures
;--------------------------------------------------

; CursorPosStruc and VideoInfoStruc are used by INT 10h, Function 1Bh
; (Get Video Information).See the GetMaxXY procedure for details.
; (Added 10/21/2002)

CursorPosStruc STRUCT
	Ycoord BYTE ?
	Xcoord BYTE ?
CursorPosStruc ENDS

VideoInfoStruc STRUC
	supportedInfoPtr     DWORD ?
	videoMode            BYTE ?
	numCharColumns       WORD ?
	videoBufferLen       WORD ?
	videoBufferStartPtr  WORD ?
	cursors CursorPosStruc 8 DUP(<>)	; video pages 0-7
	cursorStartLine      BYTE ?
	cursorEndLine        BYTE ?
	activeDisplayPage    BYTE ?
	adapterBasePortAddr  WORD ?
	currentRegister3B8or3D8 BYTE ?
	currentRegister3B9or3D9 BYTE ?
	numCharRows          BYTE ?
	characterScanHeight  WORD ?
	activeDisplayCode    BYTE ?
	inactiveDisplayCode  BYTE ?
	numberOfColors       WORD ?
	numberOfVideoPages   BYTE ?
	numberOfScanLines    WORD ?
	primaryCharBlock     BYTE ?
	secondaryCharBlock   BYTE ?
	miscStateInfo        BYTE ?
	                     BYTE 3 DUP(?)
	videoMemAvail        BYTE ?
	savePointerStateInfo BYTE ?
	                     BYTE 13 DUP(?)
VideoInfoStruc ENDS



; ExtGetDskFreSpcStruc is used by INT 21h Function 7303h
; (Get Disk Free Space):

ExtGetDskFreSpcStruc STRUC
    StructSize                WORD  ?
    Level                     WORD  ?
    SectorsPerCluster         DWORD ?
    BytesPerSector            DWORD ?
    AvailableClusters         DWORD ?
    TotalClusters             DWORD ?
    AvailablePhysSectors      DWORD ?
    TotalPhysSectors          DWORD ?
    AvailableAllocationUnits  DWORD ?
    TotalAllocationUnits      DWORD ?
    Rsvd                      DWORD 2 DUP (?)
ExtGetDskFreSpcStruc ENDS

; TimeRecord structure. Will be copied from an include file.

TimeRecord STRUCT
	hours    BYTE ?
	minutes  BYTE ?
	seconds  BYTE ?
	hhss     BYTE ?
TimeRecord ENDS

.LIST