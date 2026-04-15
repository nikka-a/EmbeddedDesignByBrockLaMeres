#include <msp430.h> 

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;    // stop watchdog timer
	
	int a = 2;                   // initialising variables
	int b = 3;
	int c = 4;
	int d = 5;

	while(1) {                   // infinite loop
	    b+=a;                    // arithmetic operations
	    d-=c;

	    b++;

	    d--;
	}


	return 0;
}
