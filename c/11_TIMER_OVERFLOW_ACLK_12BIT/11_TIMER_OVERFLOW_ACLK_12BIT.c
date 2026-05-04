#include <msp430.h> 

int main(void)
{
  WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer
  // set up ports
  P1DIR |= BIT0;            // set P1.0 as an output
  P1OUT &= ~BIT0;           // clear LED1
  PM5CTL0 &= ~LOCKLPM5;     // enable GPIO

  TB0CTL |= TBCLR;          // reset timer
  TB0CTL |= TBSSEL__ACLK;   // choose ACLK
  TB0CTL |= MC__CONTINUOUS; // set it in continuous mode
  TB0CTL |= CNTL_1;         // make it 12-bit
 
  TB0CTL |= TBIE;           // local enable for TB0 overflow
  __enable_interrupt();     // global enable for IRQs
  TB0CTL &= ~TBIFG;         // clear interrupt flag
	
  while(1) {}               // infinite loop

  return 0;                 // the program will not reach this statement
}

#pragma vector = TIMER0_B1_VECTOR; // link ISR with the TIMER0_B1 interrupt 

__interrupt void ISR_TB0_Overflow(void) // ISR for TIMER0_B1
{
    P1OUT ^= BIT0;           // toggle LED1
    TB0CTL &= ~TBIFG;        // clear interrupt flag
}
