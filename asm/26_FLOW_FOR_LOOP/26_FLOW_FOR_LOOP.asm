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

            mov.w    #0, R4                  ; move 0 (counter) to R4

for1:
            mov.w    R4, Var1                ; move R4 in Var1
            inc      R4                      ; increment R4 by 1
            cmp.w    #4, R4                  ; R4 = 4 ?
            jnz      for1                    ; if R4 is not 4, continue for1

;--------------------------------------------------------------------------------
            mov.w    #10, R4                 ; move 10 (counter) to R4

for2:
            mov.w    R4, Var1                ; put R4 in Var1
            decd     R4                      ; decrement R4 by 2
            tst.w    R4                      ; is R4 => 0 ?
            jge      for2                    ; if R4 is more or equal to 0, continue for2

end_for2:
            jmp      main

;-------------------------------------------------------------------------------
; Memory Allocation
;-------------------------------------------------------------------------------

            .data
            .retain

Var1:       .space   2

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
