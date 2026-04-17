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
            mov.b   #0, R4                  ; move 0 to R4

main:
            mov.b   #254, R5                ; move 254 to R5
            add.b   #1, R5                  ; add 1 to R5, C = 0
;           add.b   #2, R5                  ; add 2 to R5, C = 1
            jc      CarrySet                ; jump if carry is set
            jnc     CarryClear              ; jump if carry is cleared

CarrySet:
            mov.b   #1, R4                  ; move 1 to R4
            jmp     main                    ; go to main

CarryClear:
            mov.b   #2, R4                  ; move 2 to R4
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
