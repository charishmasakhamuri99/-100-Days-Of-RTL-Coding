📦 1. SystemVerilog Package (func_pkg)
•	Purpose: A package allows you to declare functions, tasks, types, and parameters in a shared namespace, enabling code reuse across multiple modules or 
•	This wraps your combinational logic in a globally accessible container. Import it using:
This eliminates duplication and clarifies scope .

🔢 2. Combinational Function (my_func)

•	function automatic logic [7:0] my_func(...):
o	Declares a pure combinational function returning an 8-bit logic type.
o	automatic ensures reentrancy and thread safety, preventing shared state across invocations.
o	Using logic [7:0] is preferable for synthesis compatibility over byte.
•	Function Body:
This is a single, blocking assignment that ensures all bits are assigned in all execution paths—avoiding accidental latch inference 





🧰 3. Dynamic Arrays (vectorA, vectorB)
o	[] signifies a dynamic unpacked array: its size is determined at runtime 
o	The '{'...'}' initializer synthesizes and populates the array at elaboration.
•	Benefits:
o	Flexible sizing and initialization.
o	Supports operations like .size(), .delete(), new[N], and copy-on-resize 
🔁 4. foreach Loop

o	Automatically iterates over all valid indices of vectorA—clean, safe, and avoids off-by-one errors .
o	SystemVerilog handles this elegantly even for multi-dimensional arrays
🧠 5. Combinational Logic in Testbench
•	The function call result = my_func(a, b); re-evaluates logic instantaneously—no time control statements or events used.
•	Since it's invoked inside an initial block (without always_comb), you're manually stepping through test cases without relying on event-driven simulation semantics.
