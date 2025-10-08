
A 4-bit synchronous counter is a sequential digital circuit that goes through a fixed sequence of binary states in synchronization with a clock signal. In this counter, all flip-flops are triggered by the same clock edge (rising or falling), ensuring simultaneous state changes.

Working Principle
•	Structure:
•	Contains 4 flip-flops (one for each bit: Q0 = LSB, Q3 = MSB).
•	All flip-flops share the same clock line → synchronous operation.
•	The flip-flop states change according to binary counting rules.
•	Counting Sequence:
•	The counter increments its binary value on each clock pulse:
0000(0) → 0001(1) → 0010(2) → … → 1111(15) → back to 0000
•	Flip-Flop Toggling:
•	LSB Flip-Flop (Q0): Toggles on every clock pulse.
•	Q1: Toggles when Q0 changes from 1→0 (every 2nd pulse).
•	Q2: Toggles on every 4th pulse.
•	Q3 (MSB): Toggles on every 8th pulse.
