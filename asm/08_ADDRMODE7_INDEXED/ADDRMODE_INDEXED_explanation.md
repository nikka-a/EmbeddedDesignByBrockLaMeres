The file contains an example of Indexed Mode Addressing. It is similar to [Indirect Register Mode](.asm/06_ADDRMODE5_INDIRECTREGISTER): the register keeps an address pointed to a memory location, however, an off-set is provided. The off-set is added to the value (address) held in the register. It can be used in both ```src``` and ```dst``` operands. Parenthesis around the register are used to indicate an off-set: ```2(R16)```. 

Concepts covered:
- data movement using indexed mode
