✅ What is a Comparator?
A comparator is a digital circuit that compares two binary numbers and produces outputs based on their relative magnitudes.

For a 2-bit comparator, we compare two 2-bit binary numbers A[1:0] and B[1:0].

🧠 Logical Operations
The comparator evaluates and gives three outputs:

A_gt_B: A is greater than B → Output is 1 when A > B

A_eq_B: A is equal to B → Output is 1 when A == B

A_lt_B: A is less than B → Output is 1 when A < B

🔧 Design Module Theory
module comparator_2bit (
    input [1:0] A, B,
    output A_gt_B, A_eq_B, A_lt_B
);
This module takes two 2-bit inputs: A and B.

It outputs three 1-bit comparison results.

assign A_gt_B = (A > B);
assign A_eq_B = (A == B);
assign A_lt_B = (A < B);
Uses continuous assignments (assign) to perform:

Greater than: Checks if value of A > B

Equal to: Checks if value of A == B

Less than: Checks if value of A < B

Since Verilog supports binary comparison operators, no need for logic gates here — it's handled with simple relational operators.

🧪 Testbench Theory
The testbench simulates all necessary combinations of inputs for A and B to verify correctness.

reg [1:0] A, B;
Declares registers to simulate input signals A and B.

$monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);
Continuously displays values of inputs and outputs at each time step when changes occur.

A = 2'b00; B = 2'b00; #10;
A = 2'b01; B = 2'b00; #10;
...
Applies different test combinations to validate:

A == B (equal case)

A > B (greater case)

A < B (lesser case)

🖥️ Waveform Understanding
Time (ns)	A	B	A > B	A == B	A < B
0	00	00	0	1	0
10	01	00	1	0	0
20	01	01	0	1	0
30	10	11	0	0	1
40	11	10	1	0	0
50	10	10	0	1	0

Each row shows the result of the comparator logic after inputs change.

🧾 Applications of 2-bit Comparator
Used in digital systems to compare counters, registers, memory addresses.

Essential in sorting algorithms, priority encoders, and control units.
