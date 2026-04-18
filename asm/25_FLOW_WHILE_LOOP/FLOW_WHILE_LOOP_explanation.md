!!! It is supposed to be tested in Debug by going to memory address 0x2000 (the start of the program memory) and modifying the values there.

This program contains an implementation of a while() loop. It is achieved by using conditional jumps and labels. The first loop is going to be executed as long as Var1 = 3. The second loop will be executed forever. In C, the program would look like this:

```c

while(Var1 = 3) {
    Var2 = 1;
}

while(1) {
    Var2 = 2;
}

```

Concepts covered:
- C while() implementation
