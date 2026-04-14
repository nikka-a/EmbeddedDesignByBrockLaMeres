#include <msp430.h> 

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer
	
	int i = 0;                // initialise counter to 0
	int count = 0;            // initialise count variable to 0        

	while (1) {               // infinite loop

	    for(i = 0; i < 10; i++) { // iterate 10 times
	        count = i;        // assign value of i to count   
	    }
	}
	return 0;                 // this program will not reach this statement 
}
