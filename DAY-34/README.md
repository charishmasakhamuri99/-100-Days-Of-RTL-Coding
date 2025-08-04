👇 Blocking Assignment (=)
•	Executes sequentially, mimicking typical software statements.
•	RHS is evaluated and assigned to LHS immediately, before moving to the next statement. 
•	Use blocking for combinational logic and in initial blocks for setup or testbenches. 
🔄 Blocking Part (a = 1; b = a; c = b;)
•	a = 1; immediately sets a = 1.
•	b = a; sees the updated a, so b = 1.
•	c = b; likewise sees b = 1, so c = 1.
•	Output: blocking: a=1, b=1, c=1

⚙️  Why It Matters
•	Blocking assignments are immediate and predictable; essential for combinational logic and testbench setup.
•	Non-blocking assignments enable proper modeling of hardware registers and flip-flops, preventing unintended data propagation or race conditions. 
📋  Simulation Flow Summary
1.	Blocking section executes and completes all updates before the first $display.
2.	Delay of #5.
