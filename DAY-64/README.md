1. Memory Modeling in Verilog
•	Declaration:
verilog
CopyEdit
reg [15:0] mem [0:3];
Models a simple 4-word × 16-bit memory using a one-dimensional reg array. Each index corresponds to a separate 16-bit location – similar to small RAM or register file in hardware. 
o	On active‐low reset (rstn == 0), all memory entries are cleared synchronously at the rising edge of clk.
o	When wr is asserted, the new write data (wdata) is stored into mem[addr] on the next clock pulse.
This is a typical method to reset and write memory in hardware—each memory cell is implemented using flip-flops. Asynchronous 
Continuously outputs the memory content at address addr, without waiting for a clock. A combinational read path is common in many memory structures, though FPGA block RAMs may enforce synchronous read only. 
Reset & Write Sequence:
o	Reset is held for 10 ns at start to initialize all memory cells to zero.
o	A loop writes unique data (e.g., 16'hA0A0 + i) to each address 0–3, with proper handshake between write enable (wr) and clock cycles to ensure timing.
•	Read Cycle & Verification:
o	After writing, the testbench cycles through each memory address.
o	Captures and displays data for comparison to confirmation.
This style—writing known patterns and reading them back—is the basis of functional verification.

Synchronous vs Asynchronous Access
•	Synchronous Write + Reset: Ensures data is only changed on clock edges, reducing timing hazards and guaranteeing deterministic behavior. Every memory bit changes in sync with clk. 
•	Asynchronous Read: Offers immediate visibility of stored data when addr changes. This can simplify debugging, but may limit mapping to block RAM in some FPGA architectures. 

