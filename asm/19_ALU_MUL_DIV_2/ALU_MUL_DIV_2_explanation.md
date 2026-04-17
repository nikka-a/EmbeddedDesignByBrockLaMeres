This file contains an example of how rotates ```rla``` and ```rrc``` can be used to multiply or divide a binary number by two. When a binary number is rotated to the left by one bit and the vacated LSB position is filled with 0, its value is doubled. When a binary number is rotated to the right by one bit and the vacated MSB position is filled with 0, its value is divided by 2. However, for it to be divided correctly, the C flag should be cleared before each rotation so the MSB is filled with 0. The limitation of this instruction is that, once the original bits are lost, the precision is lost.

Concepts covered:
- LSB & MSB
- division and multiplication by 2 
