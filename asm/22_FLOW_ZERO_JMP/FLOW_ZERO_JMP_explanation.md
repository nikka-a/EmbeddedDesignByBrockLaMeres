This file contains an example of a zero-based conditional jump ```jz``` (jump if zero) and ```jnz``` (jump if not zero). They work the same as [carry-based jumps](/asm/21_FLOW_ZARRY_JMP). They alter the value of PC depending on the status of the Z flag. ```jz``` will alter the PC when Z = 0, otherwise it will move on to the next instruction. ```jnz``` will alter the PC when Z = 1, otherwise it will move on to the next instruction.

Concepts covered:
- zero-based conditional jumps
