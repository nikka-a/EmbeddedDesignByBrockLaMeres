This file contains an example of interrupts in C. In this program, LED1 is turned on and off using a button (P4.1). After configuring GPIO, it is achieved by 

1. Setting up the peripherals (in this case, turning on the resistor and making it pull up)
2. Clearing the peripheral's interrupt flag (in this case, P4IFG)
3. Asserting the perhipherals interrupt enable (in this case, P4IE)
4. Asserting the global interrupt in the status register (using __enable_interrupt() function) 
5. Writing ISR (interrupt service routine) with a start address location and a ```reti``` instruction to denote its end
6. Initialising the vector address for the peripheral (using #pragma directive)

Concepts covered:
- GPIO configuration
- Interrupts and interrupts routines
- MSP430 specific functions in C
- ```#pragma``` directive
