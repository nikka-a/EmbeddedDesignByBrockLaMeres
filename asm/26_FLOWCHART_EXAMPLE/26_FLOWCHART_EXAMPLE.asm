;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls  C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def     RESET                   ; Export program entry-point to
                                             ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                            ; Assemble into program memory.
            .retain                          ; Override ELF conditional linking
                                             ; and retain current section.
            .retainrefs                      ; And retain any sections that have
                                             ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w    #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w    #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

main:
            mov.w    Var1, R4                ; move Var1 to R4
            add.w    Var2, R4                ; add Var2 to R4
            jc       Carry                   ; if C flag was asserted jump to Carry
            jnc      NoCarry                 ; if not, jump to NoCarry

Carry:

            mov.w    #0, Fit                 ; move 0 to Fit
            jmp      Done                    

NoCarry:
            mov.w    #1, Fit                 ; move 1 to Fit
            jmp      Done

Done:

            jmp      main

;-------------------------------------------------------------------------------
; Memory Allocation
;-------------------------------------------------------------------------------

            .data
            .retain

Var1:       .space   2
Var2:       .space   2
Fit:        .space   2

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global  __STACK_END
            .sect    .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect    ".reset"                ; MSP430 RESET Vector
            .short   RESET
