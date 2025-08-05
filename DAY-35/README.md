• Non-blocking assignment (<=)
•	Evaluates RHS of all such statements in a block at the same time, then updates all LHS simultaneously at the end of the time-step.
•	Enables modeling of parallel updates in sequential logic (e.g., registers on a clock edge).
•	Prevents “ripple” updates within the same block.

• Non-blocking part (x <= 1; y <= x; z <= y;)
At time 5:
•	RHS values are sampled immediately: 1, old x, old y.
•	Assignments are scheduled, not executed yet.
•	Thus the $display shows old values (possibly 0 or x).

⚠️ Common Pitfalls & Best Practices
1.	Never mix = and <= in the same always block unless you're fully aware of interleaved behavior — mixing causes mismatches between simulation and actual hardware.
2.	Use <= in clocked blocks (e.g., always @(posedge clk)).
3.	Use = in combinational blocks (e.g., always @*) and in initial code for testbenches and initialization.
4.	Testbench flows: blocking helps set up known states, while non-blocking models behavior based on timing or clocks.



✅ Summary
•	= (blocking) assigns immediately and sequentially — great for combinational logic.
•	<= (non-blocking) defers assignment — essential for register behavior in the same clock cycle.
•	Use them correctly to model hardware accurately and avoid race conditions or simulation mismatches.
