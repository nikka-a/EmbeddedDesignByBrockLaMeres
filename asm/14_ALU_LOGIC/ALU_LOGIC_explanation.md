This file contains an example of logic operations on MSP430. The MCU provides four logical operations: ```inv```, ```and```, ```or``` (which is ```bis```. See [Bit set & clear](/asm/15_ALU_BITS_BITC)) and```xor```. These operations are also called bitwise operations, because they are used to modify each individual bit on an operand.

```inv``` performs a logical ```not``` operation on all the bits. 

```and``` performs a logical ```and``` on the operands and puts it back to ```dst```. Using a mask (a bit pattern), ```and``` allows bits in ```dst``` to be cleared. For that, a mask should contain ```0``` (since AND`ing anything with 0 will result in 0) on the desired bits. It also allows to check if a bit is 1 (since AND'ing with 1 will result in a 1 only if both of the operands are one), with the help of Zero flag (Z), which tells if the result of an operation zero or non-zero. 

```or``` (```bis```) performs a logical ```or``` on the operands and puts it back to ```dst```. Using a mask, ```or``` allows bits in ```dst``` to be set. For that, a mask should contain ```1``` (since OR`ing anything with 1 will result in 1) on the desired bits. 

```xor``` performs a logical ```xor``` on the operands and puts it back to ```dst```. Using a mask, ```xor``` allows bits in ```dst``` to be toggled. For that, a mask should contain ```1``` (since XOR`ing anything with 1 will toggle the ```dst```). 

Concepts covered:
- bitwise operations
- bit masking
