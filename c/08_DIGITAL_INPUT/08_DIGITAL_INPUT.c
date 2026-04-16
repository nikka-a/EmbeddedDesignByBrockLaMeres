#include <msp430.h> 

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
    // Set up ports
    P1DIR |= BIT0;              // Set P1.0 as an output (LED1)
    P1OUT &= ~BIT0;             // Clear LED1

    P4DIR &= ~BIT1;             // Set up P4.1 as an input (SW1)
    P4REN |= BIT1;              // Enable resistor
    P4OUT |= BIT1;              // Set resistor to PULL UP

    PM5CTL0 &= ~LOCKLPM5;       // Turn on GPIO

    int SW1;
    int i;

    while(1) {
        SW1 = P4IN;             // Read port4
        SW1 &= BIT1;            // Clear all bits except SW1 bit

        if (SW1 == 0) {         // Pressed
            P1OUT ^= BIT0;      // LED1 on
        }

        for(i = 0; i < 10000; i++) {
            // do nothing
        }
    }

    return 0;
}
