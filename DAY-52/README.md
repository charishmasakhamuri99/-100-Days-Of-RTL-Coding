📘 What is Single Port RAM?
A Single Port RAM is a memory that:
•	Has one address/data port
•	Allows either read or write, but not both at the same time
•	Uses the same clock for controlling both operations
It is commonly used in simple embedded systems or hardware accelerators where memory access is not concurrent.

⚙️ Components of the Design:
1. Parameters
•	DATA_WIDTH: Width of each memory word (e.g., 8 bits)
•	ADDR_WIDTH: Number of address bits (e.g., 4 bits for 16 locations)
2. Inputs
•	clk: Clock signal (synchronous operation)
•	we: Write Enable (when 1, write to RAM; when 0, read from RAM)
•	addr: Address of the memory location to read or write
•	din: Input data to be written (used during write operation)
3. Output
•	dout: Data output (used during read operation)

🧠 How It Works
✅ Write Operation (when we = 1)
•	On rising edge of clk, the input din is written into memory at the location addr.
•	At the same clock edge, the dout will show the value at that address, which may reflect the new value depending on synthesis behavior.
✅ Read Operation (when we = 0)
•	On rising edge of clk, the data stored at addr is placed on dout.
