This file contains an example of unconditional program flow instructions ```jmp``` and ```br```. Such instruction modify the Porgram Counter (PC) using address labels that point to the memory address locations.
```br``` instruction simply moves the value of ```src``` into PC. It can point to any location within the MSP430 memory system. It almost always uses immediate mode addressing (See [Immediate Mode Addressing](/asm/03_ADDRMODE2_IMMEDIATE)). It takes three words.

```jmp``` is another unconditional program flow instruction. As ```br```, it alters the PC, however, instead of moving the value of ```src```, it interprets ```src``` as a signed off-set to apply to PC. It is calculated during assembly by subtracting the currect value of PC with the address label. Then a 10-bit off-set is is formed to be used as part of the operand. This limits the ```jmp``` to only the -512 to +512 addressed around the current value of PC, but it is faster, taking only one word. If a ```jmp``` is outside the range, a "jmp out of range" error will appear. It almost always uses symbolic mode addressing (See [Symbolic Mode Addressing](/asm/05_ADDRMODE4_SYMBOLIC)).

Concepts covered:
- unconditional jumps
- PC
