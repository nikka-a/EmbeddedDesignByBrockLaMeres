;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stack pointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
main:
            mov.w   #371, R4
            mov.w   #465, R5

            add     R4, R5                  ; R5 = R4 + R5 [Regular 16-bit addition]

            mov.w   #0FFFEh, R6
            add.w   #0001h, R6              ; R6 = 1 + R6 [Max value before overflow] 

            mov.w   #0FFFFh, R7
            add.w   #1h, R7                 ; R7 = 1 + R7 [Overflow, C flag is set]

            mov.b   #255, R8
            mov.b   #1, R9
            add.b   R8, R9                  ; R9 = 255 (R8) + 1 (R9) [Overflow, C flag is set]

            mov.b   #-1, R10
            add.b   #1, R10                 ; R10 = R10 (-1) + 1 [Signed addition]

            mov.b   #127, R11
            add.b   #127, R11               ; R11 = R11 (127) + 127 [Signed overflow, V flag is set]

            jmp     main

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
