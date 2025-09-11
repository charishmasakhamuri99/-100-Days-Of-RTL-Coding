1. What is a Clocking Block in SystemVerilog?
A clocking block is a construct introduced in SystemVerilog to help synchronize handshake and signal sampling with a specific clock event in testbenches and verification environments. It defines a timing domain or interface where signals are sampled and driven relative to a clock edge.
2. Why Use Clocking Blocks?
•	Timing clarity and synchronization: Groups related signals and associates them to a clock's edge.
•	Improved readability: Signals are accessed through the clocking block, clearly indicating their synchronization.
•	Control of timing skews: You can specify input and output skews (delays before and after clock edge with which inputs are sampled and outputs driven).
•	Simplifies timing bugs: For example, it ensures outputs are driven only after the clock edge in a non-blocking manner, 
3. How Signals Are Accessed and Assigned
•	Inputs inside the clocking block (like data_in) are sampled by reading  Sampling occurs respecting input skew (1 ns before clock edge).
•	Outputs (like enable) must be driven using nonblocking assignments (<=) to avoid race conditions and guarantee proper sequencing after the clock edge (respecting output skew).
4. Summary
Concept	Explanation
Clocking block	Groups signals synchronized to a clock edge
Clocking event	The exact clock edge that defines when signals change or sampled
Input skew	Time before clock edge inputs are sampled
Output skew	Time after clock edge outputs are driven
Nonblocking <=	Required for driving clocking block outputs
@(cb) event	Waits for the clocking event (e.g., posedge clk)
