;****************************************************************************************************************************
;Program name: "Assignment 2".  This program greets a user by their inputted name  *
;and title.  Copyright (C) 2021  Gabriel Gamboa                                                                                 *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Gabriel Gamboa
;  Author email: gabe04@csu.fullerton.edu
;
;Program information
; Program name: Assignment 2
;  Programming languages X86 with one module in C
;  Date program began 2021-Sep-24
;  Date program completed 2021-Sep-29
;
;Purpose
;  This program takes 2 floating numbers which represent 2 sides of a triangle as
;  inputs and returns the area of the triagle and the hypotenuse.
;Project information
;  Files: pythagoras.c, triangle.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Linux: nasm -f elf64 -l hello.lis -o hello.o hello.asm


;============================================================================================================================================================


;===== Begin code area ============================================================================================================
extern printf
extern scanf
extern fgets
extern strlen
extern stdin
global rtriangle

segment .data
align 16
promptname db "Please enter your last name: ", 0
prompttitle db "Please enter your title (Mr, Ms, Nurse, Engineer, etc): ", 0
enjoy_message db "Please enjoy your triangles %s %s.", 10, 0      ;originally: enjoy_message db "Please enjoy your triangles %s %s.", 0
;align 16
trianglesidesprompt db "Please enter the sides of your triangle separated by ws:",0
area_message db "The area of this triangle is %5.9lf square units.", 10, 0       ;lf???
hypotenuse_message db "The length of this hypotenuse is %5.9lf units.", 10, 0
invalid_input_message db "Invalid input run program.", 10, 0
;good_bye db "The floating module will return the large number to the caller.  Have a nice afternoon",10,0
two_float_format db "%lf %lf",0
;align 16
stringformat db "%s", 0
threestringformat db "%s, %s, %s", 0
;output_two_float db "The two numbers are %5.3lf and %5.3lf.",10,0
;output_three_float db "The three numbers in ascending order are %7.5lf, %7.5lf, and %7.5lf",10,0
align 64
segment .bss  ;Reserved for uninitialized data

programmers_name resb 32                        ;32 byte space created
programmers_title resb 32                       ;32 byte space created

segment .text ;Reserved for executing instructions.

rtriangle:

;=============================================================================================
;back up data in registers
push rbp
mov  rbp,rsp
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




;push qword 0                                       ;causes a segfault in printf - why?
;ADDED STUFF HERE
;=========== Prompt for user's name =================================================================================================================================

mov qword  rax, 0                                           ;No floats used
mov        rdi, stringformat                                ;
mov        rsi, promptname                                  ;"Please enter your last name: "
call       printf                                           ;C++ printf() function handles the output

;===== Obtain the programmer's name =============================================================================================================================================


mov qword rax, 0                                            ;no floats in scanf?
mov       rdi, programmers_name                             ;Start of array address to rdi
mov       rsi, 32                                           ;Size of input available to fgets for inputs
mov       rdx, [stdin]                                      ;rdx gets the inputting thing
call      fgets                                             ;gets a line of text less than 31 chars or stops when NULL is reached

;remove new line character from input of programmer name
mov rax, 0                                              ;No floats used
mov rdi, programmers_name                               ;Once the name is in rdi we can call strlen to get the length of the name. rdi is parameter in strlen
call strlen                                             ;call the C function strlen to get length
mov r14, rax                                            ;r14 contains the length of the string. I guess it's stored in rax after strlen is called
mov r15, 0                                              ;i was having bugs and heard this helps, not sure if this was ultimately what did the trick
mov [programmers_name + r14 -1],r15                     ;new line character is 1 less than the last character in the string so that's where the -1 comes in
                                                        ;we replace it with 0 so that's why we do the ,r15
                                                        ;i don't know why we have to put in the [hello.programmers_name + r14 - 1]
                                                        ;or what the brackets are for. I'd think it would work without the hello.programmers_name, assuming the length is stored in r14
;=========== Prompt for programmer's title =================================================================================================================================

mov qword  rax, 0                                           ;No floats used
mov        rdi, stringformat                                ;
mov        rsi, prompttitle                                 ;"Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): "
call       printf                                           ;C++ printf() function handles the output

;===== Obtain the programmer's title =============================================================================================================================================


mov qword rax, 0                                            ;no floats in scanf?
mov       rdi, programmers_title                            ;Start of array address to rdi
mov       rsi, 32                                           ;Size of input available to fgets for inputs
mov       rdx, [stdin]                                      ;rdx gets the inputting thing
call      fgets                                             ;gets a line of text less than 31 chars or stops when NULL is reached

;remove new line character from input of programmer title
mov rax, 0                                              ;No floats used
mov rdi, programmers_title                              ;Once the title is in rdi we can call strlen to get the length of the name. rdi is parameter in strlen
call strlen                                             ;call the C function strlen to get length
mov r14, rax                                            ;r14 contains the length of the string. I guess it's stored in rax after strlen is called
mov r15, 0                                              ;i was having bugs and heard this helps, not sure if this was ultimately what did the trick
mov [programmers_title + r14 -1],r15                    ;new line character is 1 less than the last character in the string so that's where the -1 comes in
                                                        ;we replace it with 0 so that's why we do the ,r15
                                                        ;i don't know why we have to put in the [hello.programmers_title + r14 - 1]
                                                        ;or what the brackets are for. I'd think it would work without the hello.programmers_name, assuming the length is stored in r14
;============================================================================================================================================================================================



;===================Recieve sides of Triangle===================================================================================================================================================
;Display a prompt message asking for inputs
;push qword 99                        ;why segfault here? does align 16 align all array data declarations?
mov rax, 0                            ;format for printf, no floats used
mov rdi, trianglesidesprompt          ;"Please enter the sides of your triangle separated by ws: "
call printf                           ;prints out trianglesideprompt
;pop rax


;push qword 99 ;Get on boundary
;Create space for 2 float numbers
push qword -1                 ;creates space for a float number
push qword -2                 ;creates space for another float number
mov rax, 0                    ;format for printf, no floats used
mov rdi, two_float_format      ;"%lf%lf"
mov rsi, rsp                   ;rsi points to first quadword on the stack
mov rdx, rsp
add rdx, 8                     ;rdx points to second quadword on the stack
call scanf

movsd xmm12, [rsp]            ;xmm12 contains first side of triangle entered
movsd xmm13, [rsp+8]          ;xmm13 contains second side of triangle inputted
pop rax                        ;Reverse the previous "push qword -2"
pop rax                        ;Reverse the previous "push qword -1"
;pop rax                        ;Reverse the previous "push qword 99"


;----add if else check for 0's or negatives HERE-------------------
xorpd xmm9, xmm9                ;fast way of creating 0.0 in a register.  I think xmm's automatically contain any float number, so xoring it by itself will create 0.0
ucomisd xmm12, xmm9             ;compares two floats and stores it in rflags
ja validInput                   ;create a jump condition based off what ucomisd stored in rflags. If side inputted is greater than 0 then we jump to validInput
mov rax, 0                      ;format for printf
mov rdi, stringformat           ;format for printf
mov rsi, invalid_input_message  ;output invalid input message if input is<= 0
call printf                     ;print out invalid input message
jmp finish                      ;jump to finish if input is invalid

validInput:                     ;signifier to start code here if jump conition is satisfied
xorpd xmm9, xmm9                ;fast way of creating 0.0 in a register.  I think xmm's automatically contain any float number, so xoring it by itself will create 0.0
ucomisd xmm13, xmm9             ;compares two floats and stores it in rflags
ja valid                        ;create a jump condition based off what ucomisd stored in rflags. If side inputted is greater than 0 then we jump to validInput
mov rax, 0                      ;format for printf
mov rdi, stringformat           ;format for printf
mov rsi, invalid_input_message  ;output invalid input message if input is<= 0
call printf                     ;print out invalid input message
jmp terminate                   ;jump to terminate if input is invalid
valid:                          ;signifier to start code here if jump condition is satisfied
;----------------------------------------------------
;================================== End of input triangle sides ====================================


;============= Begin arithmetic section  ===============================================================

;create float
push qword 2            ;push qword onto stack so we can convert it to float format to use in our calculations
cvtsi2sd xmm15, [rsp]   ;convert 2 to 2.0 and store it in xmmm15
pop rax                 ;why do we need to pop rax. what is in it?

;area block             ;float 1 in xmm12, float 2 in xmm13, 2.0 in xmm15
;push qword 0            ;why do we do this?
mov rax, 1              ;1 floating point number will be passed into printf
mov rdi, area_message   ;"The area of this triangle is %5.9lf square units."
divsd xmm12, xmm15      ;xmm12 contains half its original value  -area = 1/2base*height
movsd xmm14, xmm13      ;make a copy of xmm13 to xmm14
mulsd xmm14, xmm12      ;computes the area of the right triangle and stores it in xmm14
movsd xmm0,xmm14        ;printf prints out starting in xmm0?
call printf
;pop rax


;hypotenuse block
;push qword 0
mov rax, 1                      ;1 floating point number will be passed into printf
mov rdi, hypotenuse_message     ;The length of the hypotenuse is %5.9lf units
mulsd xmm12, xmm15              ;undo divide xmm12 by 2 to get original value in xmm12. side 1 is in xmm12, side 2 is in xmm13
movsd xmm14, xmm12              ;move value of float 1 into xmm14
movsd xmm15, xmm13              ;move value of float 2 into xmm15
mulsd xmm14, xmm12              ;multiply xmm12 by xmm14 (side 1 by intself) to get a^2 value in xmm14
mulsd xmm15, xmm13              ;multiply xmm13 by xmmm15 (side 2 by intself) to get b^2 value in xmm15
addsd xmm15, xmm14              ;add 2 a^2 and b^2 to get c^2  value in xmm15 (pythagorean theorem)
sqrtsd xmm11, xmm15             ;c (hypotenuse) value now in xmm11
movsd xmm0,xmm11                ;printf prints out starting in xmm0?
call printf
;pop rax




;============= End of arightmetic section ==============================================================



;============================================================================================================

;ADDED STUFF HERE

;===== Reply to the user w/ title and name and ask about their day ==================================================================================================================================================
;push qword 0
;push word 0          ;why did this block segfault?
;push qword 99
mov qword  rax, 0                                           ;No floats used
mov        rdi, enjoy_message                             ;"Please enjoy your triangles %s %s. "
mov        rsi, programmers_title
mov        rdx, programmers_name
call       printf                                           ;C printf() function handles the output
;pop rax

;mov rax, 0
;mov rdi, enjoy_message
;call printf



;pop rax
finish:                         ;invalid input jumps to this part
terminate:                      ;invalid input jumps to this part
movsd xmm0, xmm11              ;hypotenuse return to caller.

;=================================================================================================================

;END ADDED STUFF


;===== Restore backed up registers ===============================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
