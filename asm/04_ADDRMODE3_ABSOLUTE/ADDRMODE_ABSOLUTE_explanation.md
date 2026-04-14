The file contains an example of Absolute Mode Addressing. In this mode, both ```src``` and ```dst``` use 16-bit address, and it allows direct access to specified memory addresses of the MSP430. The provided address is the actual address in memory. It is denoted by ```&```. 
Memory is allocated using ```.data``` directive. ```.retain``` makes sure the data is kept even if not used. 
After initialising word (16-bit) variables with ```.short```, the program reserves 2-byte spaces, which is specified with ```.space```.

Concepts covered:
- data movement using absolute mode addressing
- data movement using mixed addressing (absolute & register)
- memory allocation
- data initialisation and reservation
- directives
