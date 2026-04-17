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

main:
            mov.b   #00000001b, R4
            clrc                            ; C = 0
            rla.b   R4                      ; 00000010b
            rla.b   R4                      ; 00000100b
            rla.b   R4                      ; 00001000b
            rla.b   R4                      ; 00010000b
            rla.b   R4                      ; 00100000b
            rla.b   R4                      ; 01000000b
            rla.b   R4                      ; 10000000b
            rla.b   R4                      ; 00000000b, C = 1
            rla.b   R4                      ; 00000000b, C = 0

            mov.b   #10000000b, R5
            clrc                            ; C=0
            rra.b   R5                      ; 11000000b
            rra.b   R5                      ; 11100000b
            rra.b   R5                      ; 11110000b
            rra.b   R5                      ; 11111000b
            rra.b   R5                      ; 11111100b
            rra.b   R5                      ; 11111110b
            rra.b   R5                      ; 11111111b
            rra.b   R5                      ; 11111111b, C = 1

            jmp     main

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
