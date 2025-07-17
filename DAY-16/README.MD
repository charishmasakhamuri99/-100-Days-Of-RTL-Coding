🧠 What is a DEMUX?
A demultiplexer takes a single input signal and routes it to one of many output lines, using select lines to determine which output is active 


🔢 Select Lines
Since there are 8 outputs, we need 3 select lines (s[2:0]), because 
2
3
=
8
2 
3
 =8 . These are used to form a binary selector:

000 → output 0

001 → output 1

…

111 → output 7

📊 Truth Table Snapshot (1 × 8 DEMUX)
s2 s1 s0	y7 y6 y5 y4 y3 y2 y1 y0
0 0 0	0 0 0 0 0 0 0 i
0 0 1	0 0 0 0 0 0 i 0
…	…
1 1 1	i 0 0 0 0 0 0 0


This uses a case statement to directly connect the input to the appropriate output bus based on s.


Structural version: builds the logic gates explicitly, connecting data to exactly one output at a time. This mirrors the textbook design using AND/NOT gates to ensure only one high output .

The testbench cycles select lines from 0 to 7 while toggling data input, letting you verify that exactly one output matches the input in each state.

⚙️ Applications
Memory addressing: enabling one of many memory chips or registers.

Data routing: splitting a serial input into parallel lines (serial-to-parallel conversion).

Control signals: used in ALUs or communication systems to route data to specific destinations 

📚 Summary
Your 1:8 DEMUX design efficiently implements the combinational logic that routes one input to one of eight outputs, guided by 3 select lines:

Behavioral style for clarity and readability.

Structural style for explicit gate-level mapping.

Both follow the fundamental DEMUX principle and align with standard logic circuit construction, using AND/\NOT gates or decoders plus gating
