🔁 1. Task vs. Function
•	Tasks:
o	Can include time controls (#delay, @event) and multiple outputs via output/inout ports 
o	Allow blocking of simulation time, e.g., @(posedge clk).
o	Default to static storage, meaning variables persist across invocations; adding the automatic keyword makes them re-entrant, allocating fresh memory per call 
•	Functions:
o	Must execute within zero simulation time and cannot contain delays or event controls 
o	Return a single value, and their return value can be used directly in expressions 
🧠 2. Why Use a Task Here?
•	If your design involves timing, multi-output operations, or stepwise processing (e.g., in RTL pipelines), tasks are the right choice 
•	Tasks encourage modular, readable, and reusable code, especially when the code isn't pure combinational and spans cycles 
📚 3. Key Properties of Tasks
Feature	Task	Function
Timing controls	✅ allowed	❌ forbidden 
Multiple outputs	✅ via output/inout	❌ only single return
Zero-time execution	No	Must complete in zero time
Storage type	static default, automatic for per-call memory allocation 	variables are local and per-call
Reentrancy	Only if automatic	Always reentrant
Can be part of synthesis?	Yes, if no delays used 	Yes

🧩 4. automatic Keyword in Tasks
•	Declaring a task as automatic ensures local variables are freshly allocated every time the task is called—even if calls occur concurrently via fork/join .
•	Without automatic, tasks share state across calls, which can lead to unintended interference in concurrent scenarios
