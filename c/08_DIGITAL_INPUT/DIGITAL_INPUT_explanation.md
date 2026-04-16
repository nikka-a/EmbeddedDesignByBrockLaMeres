This file contains a demonstration of input-based output on MSP430. When a button (P4.1) is pressed, LED1 turns on. Otherwise, it does nothing. However, the demo video demonstrates a limitation of polling: it only determines current state of the port, not state transition. As a result, when holding the button continuously, LED1 turns on, goes through the delay loop and turns on again, even when no change in state of the button has appeared.

Concepts covered:
- polling
