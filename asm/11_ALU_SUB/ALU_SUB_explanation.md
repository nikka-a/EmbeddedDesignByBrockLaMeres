This file contains an example of an arithmetic operation ```sub```. The MSP430 does not have a subtraction circuit, instead it performs two's complement on ```src``` and adds it to ```dst```. It utilises two flags: C and Negative bit (N). C flag is asserted when no borrow occurred; when it is cleared, the borrow occurred. Negative bit is set when the result of an operation is negative, and cleared when the result is not negative (>= 0).

Concepts covered:
- ```sub``` logic in MSP430
- negative bit (N)
