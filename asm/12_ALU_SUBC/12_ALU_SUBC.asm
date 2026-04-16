;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
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
RESET       mov.w   #__STACK_END, SP        ; Initialize stackpointer
StopWDT     mov.w   #WDTPW | WDTHOLD, &WDTCTL ; Stop watchdog timer

;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

main:

            mov.w   #Var1, R4               ; make a pointer to memory of Var1 in R4
            mov.w   #Var2, R5               ; =//= of Var2 in R5
            mov.w   #Diff12, R6             ; =//= of Diff12 in R6

            mov.w   0(R4), R7               ; put contents of 2000h in R7
            mov.w   0(R5), R8               ; put contents of 2004h in R8
            sub.w   R8, R7                  ; sub lower 16-bits
            mov.w   R7, 0(R6)               ; put the lower 16-bits in 2008h
                                            ; using the address pointer in R6

            mov.w   2(R4), R7               ; put contents of 2002h in R7
            mov.w   2(R5), R8               ; put contents of 2006h in R8
            subc.w  R8, R7                  ; sub upper 16-bits with carry
            mov.w   R7, 2(R6)               ; put the upper 16-bits in 200Ah
                                            ; using the address pointer in R6

            jmp     main

;-------------------------------------------------------------------------------
; Memory Allocation
;-------------------------------------------------------------------------------

            .data
            .retain

Var1:       .long   0E4651FFFh
Var2:       .long   11112222h

Diff12:     .space  4

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
