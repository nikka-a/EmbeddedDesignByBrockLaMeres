#include <msp430.h> 


int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;
	
	// Set up ports

	P1DIR |= BIT0;              // Config p1.0 as output (LED1)
	P1OUT &= ~BIT0;             // Clear P.1 initially

	P4DIR &= ~BIT1;             // Config p4.1 as input
	P4REN |= BIT1;              // Enable resistor
	P4OUT |= BIT1;              // Make resistor a pull UP
	P4IES |= BIT1;              // Make sensitivity to H-to-L

	PM5CTL0 &= ~LOCKLPM5;

	// Set up IRQ

	P4IE |= BIT1;               // Enable 4.1 IRQ
	__enable_interrupt();       // Enable Maskable IRQ
	P4IFG &= ~BIT1;             // Clear P4.1 IRQ Flag

	while (1) {}
	return 0;
}

// Interrupt Service Routines

#pragma vector = PORT4_VECTOR
__interrupt void ISR_Port4_S1(void) {

    P1OUT ^= BIT0;
    P4IFG &= ~BIT1;
}
