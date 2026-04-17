This file contains an example of test instructions on MSP430. The MCU has three instructions: ```bit``` (bit test), ```cmp``` (compare), ```tst``` (test).

```bit``` intruction performs a logical ```and``` (See [Logic](/asm/14_ALU_LOGIC)) with the mask provided in ```src``` on the value in```dst```. It is used to check if provided bits are 1s using Z flag. If the Z flag was not asserted, then the bits are 1s. If it was asserted, the bits of interest are 0s.

```cmp``` instruction performs an arithmetic ```sub``` operation (See [Subtraction](/asm/11_ALU_SUB)) with the value provided in ```src``` on the value in ```dst```. However, it will only change the status flags and leave ```dst``` unchanged. If the subtraction result resulted in 0, the Z flag will be asserted. If the result was anything else, then the Z flag will not be asserted.

```tst``` instruction subtracts 0 from ```dst``` and updates the status flags. This is used to check if a value is negative or zero. If the value is zero, Z flag will be asserted. If it is negative, N flag will be asserted.

Concepts covered:
- test instructions
