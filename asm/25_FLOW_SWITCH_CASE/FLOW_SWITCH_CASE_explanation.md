This file contains an example of a switch case implementation. It is achieved by using [```jz``` instruction](/asm/22_FLOW_ZERO_JMP), [```cmp``` instruction](/asm/16_ALU_TEST) and address labels. The program compares a value in R14, and if the Z flag was asserted (meaning the value was equal to the test value), it jumps to the appropriate label, where the value of R15 is changed. Breaks are implemented via unconditional [```jmp``` instruction](/asm/20_FLOW_JUMP_N_BRANCH). In C, the program would look like this:

```c
int var1 = 0;
int var2 = 0;

while(1) {

switch(var1) {

         case(0): var2 = 0x01;
                  break;
         case(1): var2 = 0x02;
                  break;
         case(2): var2 = 0x04;
                  break;
         case(3): var2 = 0x08;
                  break;
         default: var2 = 0x00;

    }
}

```

Concepts covered:
- C switch functionality
