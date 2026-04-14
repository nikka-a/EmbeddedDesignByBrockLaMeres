#include <msp430.h> 


int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;    // stop watchdog timer
	
	int i = 0;                   // initialise loop counter
	int one = 0;                 // initialise boolean-like variable 1
	int two = 0;                 // initialise boolean-like variable 2

	while (1) {                  // infinite loop
	    for (i = 0; i < 5;i++) { // iterate 5 times
	        switch(i) {          // switch-case on i
	        case 1:              // if i is equal to 1
	            one = 1;         // set the one flag
	            two = 0;         // reset the two flag
	            break;           // stop switch case

	        case 2:              // if i is equal to 2
	            two = 1;         // set the two flag
	            one = 0;         // reset the one flag
	            break;           // stop switch case
            
	        default:             // for other values
	            one = 0;         // reset flag one
	            two = 0;         // and flag two
	            break;           // stop switch case
	        }
	    }
	}

	return 0;                    // this program will not reach this statement
}
