#include <msp430.h> 

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;     // stop watchdog timer
	
	int i = 0;                    // initialise counter
	int it_is_two = 0;            // initialise boolean-like flag

	while(1) {                    // infinite loop
	    for (i = 0; i < 5; i++) { // iterate 5 times
	        if (i == 2) {         // check if counter is 2
	            it_is_two = 1;    // raise the flag
	        }
	        else {                // if not
	            it_is_two = 0;    // reset the flag
	        }
	    }
	}

	return 0;                     // this program will not reach this statement       
}
