✅ What is a Parallel Adder?
A parallel adder is a digital circuit that adds two binary numbers simultaneously, using multiple full adders (one per bit position). In a 2-bit parallel adder, each input is 2 bits wide, and the addition is performed bitwise in parallel.

🧠 Concept of 2-bit Binary Addition
If:

Input A = a1a0 (2-bit)

Input B = b1b0 (2-bit)

Then the addition is:
   a1 a0
+  b1 b0
---------
  c2 c1 c0
c0 is the sum of LSB bits (a0 + b0)

c1 is the sum of MSB bits + carry from lower bit

c2 is the final carry-out (if any)

So the output is 3 bits (c2 c1 c0) to hold the full sum

✅ Why Output is 3 Bits?
The maximum value from adding two 2-bit numbers is:

11 (binary) = 3 (decimal)
+
11 (binary) = 3 (decimal)
--------------------------
      110 (binary) = 6 (decimal)
So the result needs 3 bits to represent values from 0 to 6.

✅ Testbench – Purpose
The testbench is a simulation environment where:

Inputs (a and b) are provided manually

The output (c) is monitored to verify correctness

🧪 Simulation Steps
Inputs are applied in sequence: different combinations of 2-bit values for a and b.

Wait time (#10): allows signal propagation in simulation.

Waveform and Console Output: used to check if the adder behaves correctly.

Waveform File (VCD): captures signal transitions to visualize timing and output changes.

📈 Waveform Explanation
In waveform:

Time progresses along the X-axis

Signals (a, b, and c) are plotted

You see a and b changing every 10ns

Corresponding changes in c happen immediately (since adder is combinational)

✅ Use Cases of Parallel Adder
Arithmetic units in ALUs (Arithmetic Logic Units)

Digital signal processing (DSP)

Counters, timers, and control systems

✅ Summary
Component	Purpose
2-bit adder	Adds two 2-bit binary numbers
3-bit output	Captures sum including carry
Testbench	Simulates the design with inputs and checks output
Waveform (VCD)	Visualizes how inputs and output behave over time
