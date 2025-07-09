📘 Theory Explanation of Universal Shift Register (Based on Given Verilog Code)
A Universal Shift Register is a digital storage device capable of performing multiple operations on data, including:

Parallel Load

Shift Left

Shift Right

Hold (No Change)

It is called "universal" because it supports all four basic operations that can be performed on register data.

🧠 Core Components in the Design
Inputs:

clk: Clock signal to synchronize operations.

resetn: Active-low reset; clears the register to 0000 when resetn = 0.

sel[1:0]: 2-bit control signal to select the operation:

00 → Hold

01 → Shift Right

10 → Shift Left

11 → Parallel Load

data_in[3:0]: 4-bit input for parallel loading.

Output:

data_out[3:0]: Current content of the register.

🛠️ Operation Explained
Each clock cycle (on the positive edge) performs an action based on the sel signal:

sel	Operation	Explanation
00	Hold	The current register value is retained (data_out remains unchanged).
01	Shift Right	All bits shift right; MSB is filled with 0, LSB is lost.
10	Shift Left	All bits shift left; LSB is filled with 0, MSB is lost.
11	Parallel Load	The value from data_in is loaded directly into the register.

🔁 Reset Behavior
The reset is asynchronous and active-low:

When resetn = 0, register immediately resets to 0000, regardless of the clock.

When resetn = 1, the register operates as per the sel value on the rising edge of clk.

🧪 Testbench Highlights
The testbench:

Initializes the register.

Simulates each operation (load, shift, hold).

Uses $dumpfile and $dumpvars to generate a waveform (.vcd) for GTKWave visualization.

Shows transitions at every 10ns interval for each operation.

📌 Summary
A Universal Shift Register is a flexible digital block used in serial-parallel conversions, data buffering, and communication systems. It combines multiple functionalities in a single module controlled via a 2-bit sel input. This design is compact and can easily be extended for wider data widths (like 8-bit or 16-bit) by changing the vector sizes.




