This file contains an example of an arithmetic operation ```subc``` performed by the ALU of MSP430. The ALU in this particular MCU is 16-bit, so subtracting larger numbers requires multi-word subtraction: subtracting the lower 16 bits, and then the upper. It is made possible by the use of Carry Bit (C flag). In this case, it represents borrow or no borrow instead of carry or no carry. ```subc``` does the same as the [sub instruction](./asm/11_ALU_SUB), but includes the C flag in the operation.

Concepts covered:
- arithmetic instruction ```subc```
- example usage of the C flag
