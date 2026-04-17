;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
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
; Main loop
;-------------------------------------------------------------------------------

main:
            mov.b   #00000000b, R4

            bis.b   #10000001b, R4           ; set bits 0 and 7
            bis.b   #01000010b, R4           ; set bits 1 and 6
            bis.b   #00100100b, R4           ; set bits 2 and 5
            bis.b   #00011000b, R4           ; set bits 3 and 4

            bic.b   #00011000b, R4           ; clear bits 3 and 4
            bic.b   #00100100b, R4           ; clear bits 2 and 5
            bic.b   #01000010b, R4           ; clear bits 1 and 6
            bic.b   #10000001b, R4           ; clear bits 0 and 7

            jmp     main

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------

            .global __STACK_END
            .sect   .stack

;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------

            .sect   ".reset"
            .short  RESET
