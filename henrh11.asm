; File Name:  henrh11.asm
; Written by: Henry Hedden
; Challenges: data types, division
; Time Spent: 5 hrs
;
; Test Case:         1995 * 9 / 5
; Predicted Results: 3591 (E07h)
; Actual Results: E07h
; Do they match?  Yes
;
; Revision History:
; Date:             Revised By:          Action:
; ------------------------------------------------------------------
; (10/12/17)        HH                   Created
; (10/14/17)        HH                   Declared and assigned variables
; (10/14/17)        HH                   Multiplication
; (10/15/17)        HH                   Division

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
lucky   WORD ?
month   BYTE ?
day	    BYTE ?
year    WORD ?

.code
_main PROC

mov ah,    0  ; clear top half of ax and bx registers
mov bh,    0
mov al,    9
mov month, al ; assign 9 to month
mov bl,    5
mov day,   bl ; assign 5 to day
mov cx,    1995
mov year,  cx ; put year in the eax register

imul ax,   cx ; multiply ax by year
cwd
idiv       bx ; divide bx by ax
mov lucky, bx ; move the quotient into lucky

INVOKE ExitProcess, 0
_main ENDP
END
