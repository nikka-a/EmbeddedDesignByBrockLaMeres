The file contains an example of Immediate Mode Addressing. In this mode, the ```src``` is a numeric constant denoted by ```#```. The example includes binary, numeric, char, 16- and 8-bit operations. 

*When using HEX values, a ```0``` is needed after ```#``` when it starts with a letter (A-F). Example: ```mov.w #0BEEFh, R6```. Otherwise, the assembler will confuse it with a symbol, and an error will appear: 
> The following symbols are undefined:
> BEEF

Concepts covered:
- data movement using immediate mode addressing
