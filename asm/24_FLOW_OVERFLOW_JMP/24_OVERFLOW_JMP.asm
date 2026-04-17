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
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

init:

            mov.b   #0, R4

main:
;           mov.b   #100, R5                ; put 100 into R5
;           cmp.b   #1, R5                  ; compare 1 to R5, V and N = 0 (because 100 - 1 = 99)

            mov.b   #-100, R5               ; put -100 into R5 
            cmp.b   #99, R5                 ; compare 99 to -100, V = 0, N = 1 (because -100 - 99 = -199)

            jge     ItIsGreaterOrEqual      ; jmp if greater or equal
            jl      ItIsLessThan            ; jump if less than

ItIsGreaterOrEqual:
            mov.b   #1, R4
            jmp     main                    ; go to main

ItIsLessThan:
            mov.b   #2, R4
            jmp     main                    ; go to main

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
