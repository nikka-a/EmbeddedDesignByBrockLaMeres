This file contains working code to blink the MCU's LED1 using a software delay loop. As stated in the [ASM example](/asm/01_BLINKY), the delay is highly unreliable due to its dependence on CPU optimisation and clock frequency, so it should not be used in real embedded systems. A better approach would be using a hardware timer or interrupts, which both provide the necessary accuracy independent of code execution.

Concepts covered:
- bit masking in C
  
