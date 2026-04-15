The file contains an example of Indirect Register Mode Registering. In this mode, a CPU register is used to provide an address of where a value is stored. It is the same as the concept of a pointer in C. To indicate that a register is being used as a pointer into memory ```@``` is used. It is only valid in ```src``` operand. The same memory allocation is needed as in [04_ADDRMODE3_ABSOLUTE](./asm/04_ADDRMODE3_ABSOLUTE) and [05_ADDRMODE4_SYMBOLIC](./asm/05_ADDRMODE4_SYMBOLIC) exercises.

Concepts covered:
- data movement using indirect register mode
- C-like pointer in ASM
