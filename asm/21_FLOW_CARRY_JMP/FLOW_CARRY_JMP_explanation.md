This file contains an example of conditional ```jc``` (jump if carry) ```jnc``` (jump if not carry) instructions.
Conditional jump instructions alter the value in PC when certain condition exist in status status flags within the status register.
```jc``` instruction will alter the value in PC if C = 1. Otherwise it will move on to the next instruction.
```jnc``` will alter the value in PC if C = 0. Otherwise it will move on to the next instruction.
Concepts covered:
- carry based jumps
