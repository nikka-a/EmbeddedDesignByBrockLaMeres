#include <msp430.h> 

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
    // Set up Ports
    P1DIR |= BIT0;              // Configure P1.0 (LED1) as an output
    PM5CTL0 &= ~LOCKLPM5;       // Turn on GPIO system
    P1OUT &= ~BIT0;             // Turn LED1 off

    int i = 0;

    while (1) {
        P1OUT ^= BIT0;          // toggle LED1

        for (i = 0; i < 0xFFFF; i++) {
            // do nothing
        }
    }

    return 0;
}
