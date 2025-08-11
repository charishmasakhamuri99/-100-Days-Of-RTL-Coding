🧠 1. Blocking (=) vs Non Blocking (<=) Assignments
🔹 Blocking (=)
•	Sequential execution within an always block: each statement completes before the next one starts 
•	Immediate update: RHS is evaluated and LHS is updated instantly.
•	Useful for combinational logic, not recommended for sequential/clocked logic 

🔹 Non Blocking (<=)
•	Parallel scheduling: RHS values are captured at the time-step start; LHS updates occur together at the end 
•	Ideal for sequential, clocked logic 
•	For swapping:
🔄 2. How Input Handling Works in the Swap
•	With non-blocking, both inputs (a, b) are sampled at the same time at the clock's rising edge. There is no intermediate overwrite, so the transfer is reliable.
•	With blocking + temp, b is saved first, then swapped—so the input to every subsequent stage is explicitly controlled and temporally ordered.
⏱️ 3. Timing Semantics and Race Avoidance

•	Blocking operations occur immediately and sequentially, so the order of statements matters—this can cause unintended feedback or race conditions if used wrongly in sequential logic.
•	Non-blocking ensures that all registers update in lockstep at the end of the cycle. This prevents races and reflects actual hardware—flops only change on clock edges 
•	Rule of thumb:
o	Use <= in clocked always blocks (sequential hardware).
o	Use = in combinational always blocks (always @*) 
