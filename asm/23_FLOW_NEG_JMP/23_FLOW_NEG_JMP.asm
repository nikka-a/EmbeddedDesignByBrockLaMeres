```asm id="z91ke"
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

            mov.b   #0, R4                  ; put 0 to R4

main:
            mov.b   #-1, R5                 ; N = 1
;           mov.b   #0, R5                  ; N = 0
            tst.b   R5                      ; check if R5 is negative or positive

            jn      ItIsNegative            ; jump if N = 1
            jmp     ItIsPositive            ; jump if N = 0

ItIsNegative:
            mov.b   #1, R4                   ; put 1 to R4
            jmp     main                     ; go to main

ItIsPositive:
            mov.b   #2, R4                   ; put 2 to R4
            jmp     main                     ; go to main

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
```
