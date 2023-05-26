REM make16a.bat
REM Special version for DOS & Windows 98 users who work only at a command prompt.

REM By: Kip R. Irvine
REM Revised 10/04/02

@echo off
cls

REM Assembles and links the current 16-bit ASM program.
REM 
REM Command-line options (unless otherwise noted, they are case-sensitive):
REM 
REM /nologo     Suppress the Microsoft logo display
REM -c          Assemble only, without linking
REM -Cp         Enforce case-sensitivity for all identifiers
REM -Zi		Include source code line information for debugging
REM -Fl		Generate a listing file
REM /CODEVIEW   Generate CodeView debugging information (linker)
REM %1.asm      The name of the source file, passed on the command line

REM The SETLOCAL command normally makes all environment changes (such as PATH)
REM temporary. This works in CMD.EXE (the Windows 2000 & Windows XP command-line
REM interpreter, but it does not work in COMMAND.COM (used by DOS and Windows 98).
REM As a stopgap solution, we have prepended the MASM directory to the paths of
REM the ML and LINK commands in this file. Customize these paths if your MASM
REM is not installed in the C:\Masm615 directory.

REM ******** The following lines can also be customized to suit your system setup:
SET INCLUDE=C:\Masm615\INCLUDE
SET LIB=C:\Masm615\LIB
REM *******************************************************************************

REM Invoke ML.EXE (the assembler). Customize for your MASM directory location:

C:\Masm615\ML /nologo -c -Fl -Zi %1.asm
if errorlevel 1 goto terminate

REM Run the 16-bit linker. Format:
REM       LINK objectfile,execfile,mapfile,library
REM Customize the following line for your MASM directory location:

C:\Masm615\LINK /nologo /CODEVIEW %1,,%1,Irvine16;
if errorlevel 1 goto terminate

REM Display all files related to this program:
DIR %1.*

:terminate
pause
