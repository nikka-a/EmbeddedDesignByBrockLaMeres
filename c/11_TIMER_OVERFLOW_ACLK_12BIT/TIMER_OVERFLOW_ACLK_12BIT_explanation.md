This program contains an example of a timer overflow interrupt using ACLK in MSP430. The ACLK clock source is used for Timer_B, which is by default a 16-bit timer, however it is possible to change the counter length to 12-, 10- and 8-bit. Since the ACLK is 32.768kHz frequency, the overflow period is calculated by 2^12/32.768 = 125ms. The LED1 is toggled every time the timer overflows.

The program is structured this way:
1. Setting up LED1
2. Turning on GPIO
3. Configuring the timer into continuous mode and making counter length to 12-bit
4. Enabling IRQs
5. Creating an ISR to toggle LED1

Concepts covered:
- timer length
- clock sources
- interrupts
