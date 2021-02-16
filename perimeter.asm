;************************************************************************************************************************************
;Program name: "Rectangle Perimeter". This program calculates and display a rectangle's perimeter and area length.                  *
;Copyright (C) 2021 Michael Nguyen.                                                                                                *
;                                                                                                                                   *
;This file is part of the software program "Rectangle Perimeter".                                                                   *
;Rectangle Perimeter is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                            *
;Floating IO is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied                  *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.             *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                                    *
;************************************************************************************************************************************




;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
; Author Information
;   Author name: Michael Nguyen
;   Author email: 16mnguyen10@gmail.com
;
; Program Information
;   Program name: Rectangle Perimeter
;   Programming Languyages: One modules in C++ and one module in X86
;   Date program began:       2021-January-25
;   Date program last update: 2021-February-12
;   Date of reorganization of comments: 2021-February-12
;   Files in this program: rectangle.cpp, perimeter.asm
;   Status: Finished.   The program was tested with no error
;
;This file
;   File name: perimeter.asm
;   Language: X86
;   Assemble: nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm


;===== Begin code area ================================================================================================
extern printf
extern scanf
global perimeter

; Declaring Constants
null equ 0
newline equ 10


segment .data                   ; Initialized data

welcome db "This program will compute the perimeter and the average side length of a rectangle.", 10, 0
promptforheight db "Enter the height: ", 0
promptforwidth db "Enter the width: ", 0
promptforaverage db "The length of the average side is ", 0
promptforending db "I hope you enjoyed your rectangle", 10, 0
secondpromptforending db "The assembly program will send the perimeter to the main function.", 10, 0
perimeteroutput db "The perimeter is %3.1lf", 10, 0
stringoutputformat db "%s", 0
integerinputformat db "%lf", 0      ; This is to allow user to input int
averagelength db "The length of the average side is %3.3lf", 10, 0
functionreceived db "The main function received this number %3.1lf and has decided to keep it.", 10, 0

segment .bss                    ; Uninitialized data

segment .text                   ; Instructions
    
perimeter:
; Back up
push rbp                                                    ;Backup rbp
mov  rbp,rsp                                                ;The base pointer now points to top of stack
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags

; Even out the pushes
push qword -1

;============= Begin section to welcome user ==========================================================================
; Output the welcome message
mov qword rdi, stringoutputformat
mov qword rsi, welcome
mov qword rax, 0
call printf
; DISPLAY:
; Welcome to an assembly program by random name.                                     <-- This is called in the cpp file
; This program will compute the perimeter and the average side length of a rectangle.

;============= End of section for welcome user ========================================================================

;============= Begin section for height and width =====================================================================
; Prompt for height
push qword 0
mov rax, 0
mov rdi, promptforheight   ; "Enter the height: "
call printf
pop rax

; User input for height
push qword 0
mov rax, 1
mov rdi, integerinputformat
mov rsi, rsp
call scanf
movsd xmm11, [rsp]
pop rax

; Prompt for width
push qword 0
mov rax, 0
mov rdi, promptforwidth     ; "Enter the width: "
call printf
pop rax

; User input for width
push qword 0
mov rax, 1
mov rdi, integerinputformat
mov rsi, rsp
call scanf
movsd xmm12, [rsp]
pop rax

;============= End section for height and width ======================================================================= 

;============= Begin section to Perimeter & Average Side ============================================================== 
; Formula for Perimeter of Rectangle: P = 2(L+W)
; Prompt and Calculating Perimeter
push qword 0
addsd xmm13, xmm11
addsd xmm13, xmm12
addsd xmm13, xmm13

mov rax, 1
movsd xmm0, xmm13
movsd xmm1, xmm0
mov rdi, perimeteroutput
call printf
pop rax

; Prompt and Calculating Average Length (FORMULA: Area = Perimeter/4)
push qword 0
mov r8, 4
cvtsi2sd xmm14, r8
divsd xmm13, xmm14

mov rax, 1
movsd xmm0, xmm13
mov rdi, averagelength
call printf
pop rax
;============= End section for Perimeter & Average Side ===============================================================

;============= Prepare to exit from this program ====================================================================== 
; Display ending messages
mov qword rdi, stringoutputformat
mov qword rsi, promptforending
mov qword rax, 0
call printf
mov qword rdi, stringoutputformat
mov qword rsi, secondpromptforending
mov qword rax, 0
call printf

push qword 0
mov rax, 1
mulsd xmm13, xmm14
movsd xmm0, xmm13
mov rdi, functionreceived
call printf
pop rax

; DISPLAY:
; I hope you enjoyed your rectangle
; The assembly program will send the perimeter to the main function.
; The main function received this number (Perimeter number) and has decided to keep it.

;===== Restore original values to integer registers ===================================================================
pop rax                                                     ; Remove the extra -1 from the stack
popf                                                        ; Restore rflags
pop rbx                                                     ; Restore rbx
pop r15                                                     ; Restore r15
pop r14                                                     ; Restore r14
pop r13                                                     ; Restore r13
pop r12                                                     ; Restore r12
pop r11                                                     ; Restore r11
pop r10                                                     ; Restore r10
pop r9                                                      ; Restore r9
pop r8                                                      ; Restore r8
pop rcx                                                     ; Restore rcx
pop rdx                                                     ; Restore rdx
pop rsi                                                     ; Restore rsi
pop rdi                                                     ; Restore rdi
pop rbp                                                     ; Restore rbp

mov qword rax, 0                            
ret                                         
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
