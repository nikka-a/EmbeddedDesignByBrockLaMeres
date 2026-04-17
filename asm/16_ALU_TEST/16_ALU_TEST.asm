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

            mov.b   #00010000b, R4
            bit.b   #10000000b, R4          ; is bit 7 a 1? Z = 1 => no
            bit.b   #00010000b, R4          ; is bit 4 a 1? Z = 0 => yes 

            mov.b   #99, R5                  
            cmp.b   #99, R5                 ; is R5 = 99? Z = 0 => yes
            cmp.b   #77, R5                 ; is R5 = 77? Z = 1 => no

            mov.b   #-99, R6
            tst.b   R6                      ; is R6 a 0? Z = 0 => no
                                            ; is R6 negative? N = 1 => yes
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
