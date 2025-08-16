1. Design: 4-bit Even Parity Generator
A parity generator outputs one extra bit so that the total number of 1’s (data + parity) is even. The logic is just the XOR of all data bits:
✅ 3. Why It Works
•	XOR across bits yields 1 if an odd number of inputs are 1, else 0.
•	For even parity, that value is exactly the bit needed to make the total count even. 
•	The testbench confirms behavior across all combinations.
•	Parity checker is similar — XOR all bits including the received parity bit, and an error is signaled if the result is not zero for even parity. 
•	2D parity (row+column) is more advanced.
TL;DR Summary
Module	Key Logic
parity_gen	p = XOR of all data bits
tb_parity_gen	loops through data; displays parity
•	Even parity: p = ^d[7:0]
•	Odd parity: p = ~(^d)
•	Checker: XOR of data + parity should_be 0 → OK; else error.
