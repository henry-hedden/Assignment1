; File Name:  henrh.asm
; Written by: Henry Hedden
; Challenges: array syntax, division
; Time Spent: 3 hrs
;
; Test Case: (17 + 21 + 24 + 80 + 32) / 5
; Predicted Results: 34 (22h)
; Actual Results: 22h
; Do they match?  Yes
;
; Revision History:
; Date:              Revised By:         Action:
; ------------------------------------------------------------------
; (10/15/17)        HH                   Created
; (10/15/17)        HH                   Declared array and constant
; (10/15/17)        HH                   Calculated average age


.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
ages    BYTE 17, 21, 24, 80, 32 ; declare array
average BYTE ?
ARRAY_LENGTH = 5 ; declare constant for array length

.code
_main PROC
mov ax, 0 ; clear ax register
mov bh, 0 ; clear top of bx register
mov bl, ARRAY_LENGTH ; move length into bl register

add al, [ages]  ; add all elements of array into al register
add al, [ages + 1]
add al, [ages + 2]
add al, [ages + 3]
add al, [ages + 4]

cwd
idiv     bx     ; divide bx into al
mov average, al ; move al into average

INVOKE ExitProcess, 0
_main ENDP
END
