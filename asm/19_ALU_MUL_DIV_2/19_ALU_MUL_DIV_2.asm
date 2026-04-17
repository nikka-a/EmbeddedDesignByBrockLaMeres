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

            mov.b   #25, R8                  ; 25 = 00011001b
            clrc
            rla.b   R8                       ; 50 = 00110010b
            rla.b   R8                       ; 100 = 01100100b
            rla.b   R8                       ; 200 = 11001000b
            rla.b   R8                       ; MSB lost! 144 = 10010000b

            mov.b   #224, R9                 ; 224 = 11100000b
            clrc
            rrc.b   R9                       ; 112 = 01110000b
            clrc
            rrc.b   R9                       ; 56 = 00111000b
            clrc
            rrc.b   R9                       ; 28 = 00011100b
            clrc
            rrc.b   R9                       ; 14 = 00001110b
            clrc
            rrc.b   R9                       ; 7 = 00000111b
            clrc
            rrc.b   R9                       ; MSB lost! 3 = 00000011b
            clrc
            rrc.b   R9                       ; 1 = 00000001b
            clrc
            rrc.b   R9                       ; 0 = 00000000b

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
