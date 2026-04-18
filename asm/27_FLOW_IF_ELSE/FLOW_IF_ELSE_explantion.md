This file contains an implementation of if else statement. It is achieved by [```cmp``` instruction](/asm/16_ALU_TEST) and labels. The program compares R15 with 10, which updates status flags. If R15 is equal to 10, it is reset to 0. If not, it is incremented. 
```c
int var = 0;

while(1) {

    if (var == 10) var = 0;
    else var++;

}

```
