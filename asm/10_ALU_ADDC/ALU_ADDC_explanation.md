This file contains an example of an arithmetic operation ```addc``` performed by the ALU of MSP430. The ALU in this particular MCU is 16-bit, so adding larger numbers requires multi-word addition: adding the lower 16 bits, and then the upper. It is made possible by the use of Carry Bit (C flag). ```addc``` does the same as the [add instruction](./asm/09_ALU_ADD), but includes the C flag in the operation.

Concepts covered:
- arithmetic instruction ```addc```
- example usage of the C flag
