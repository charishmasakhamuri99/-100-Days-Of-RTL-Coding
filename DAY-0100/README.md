Definition
A Modulo-12 counter is a sequential counter that cycles through 12 distinct states (0 to 11 in decimal, i.e., 0000 to 1011 in binary) before repeating from 0 again.
It is called modulo-12 because:
Number of unique states=12Number of unique states=12

How It Works
•	Since 24=1624=16 states are available in a 4-bit binary counter, but we only need 12, the counter is forced to reset when it reaches decimal 12 (1100 in binary).
•	The counter increments on each clock pulse.
•	When it detects the count value = 11 (decimal), the next clock cycle resets it back to 0.
•	The reset can be implemented:
•	Synchronously: Reset signal to the storage elements on the same clock edge as the count is updated (as we did in the Verilog code).
•	Asynchronously: Decoding logic immediately clears flip-flops when count = 12 without waiting for a clock edge.

State Transition Table (Up Counting)
Clock Pulse	Count (Binary)	Count (Decimal)
0	0000	0
1	0001	1
2	0010	2
...	...	...
10	1010	10
11	1011	11
12	0000	0 (repeat)

Key Features
•	Synchronous Operation: All flip-flops are clocked together (if designed as a synchronous counter), allowing higher speed and predictable timing.
•	Fixed Modulus: Modulus (number of states) is 12, less than 2n2n, so some binary states are unused.
•	Reset Mechanism: The counter is designed to detect when the count reaches 12 and then reset.

Applications
•	Timekeeping: Since 12 hours is a common time cycle (e.g., wall clocks).
•	Frequency Division: A mod-12 counter can divide an input clock frequency by 12.
•	Digital Systems Requiring Mod-N Counts: Common in control circuits, rotary encoders, etc.
