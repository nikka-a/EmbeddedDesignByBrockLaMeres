#include <msp430.h>         

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer
	
	int count = 0;            // initialise a counter to 0

	while(1) {                // infinite loop 
	    count++;              // increment the counter
	}

	return 0;                 // this program will not reach this statement
}
