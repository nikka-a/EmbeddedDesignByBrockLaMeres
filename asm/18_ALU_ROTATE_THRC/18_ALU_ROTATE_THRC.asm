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
            mov.b   #00000001b, R6
            clrc
            rlc.b   R6        ; 00000010b
            rlc.b   R6        ; 00000100b
            rlc.b   R6        ; 00001000b
            rlc.b   R6        ; 00010000b
            rlc.b   R6        ; 00100000b
            rlc.b   R6        ; 01000000b
            rlc.b   R6        ; 10000000b
            rlc.b   R6        ; 00000000b, c = 1
            rlc.b   R6        ; 00000001b

            mov.b   #10000000b, R7
            clrc
            rrc.b   R7        ; 01000000b
            rrc.b   R7        ; 00100000b
            rrc.b   R7        ; 00010000b
            rrc.b   R7        ; 00001000b
            rrc.b   R7        ; 00000100b
            rrc.b   R7        ; 00000010b
            rrc.b   R7        ; 00000001b
            rrc.b   R7        ; 00000000b, c = 1
            rrc.b   R7        ; 10000000b

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
