
🧠 1. What Is an Enumeration?
•	An enum defines a new user-defined type made up of named constants (enumerators). It maps names to integer values for readability and strong typing 
•	Typical usage: typedef enum {IDLE, RUNNING, DONE} fsm_t;
Here, IDLE = 0, RUNNING = 1, DONE = 2 by default 
🔢 2. Value Assignment: Implicit & Explicit
•	Default behavior: the first enumerator gets value 0; subsequent ones auto-increment.
•	You can explicitly assign values at any position. Unspecified enumerators continue incrementally unless overridden 
Example chain:

🛡️ 3. Strong Typing Rules
•	Enumerated types are strongly typed. You cannot assign an arbitrary integer unless:
o	That integer matches one of the defined enumerator values, or
o	You use an explicit cast:

⚙️ 4. Built-in Enumeration Methods
SystemVerilog defines built-in methods for introspection and traversal:
•	first(): returns the first enumerator
•	last(): returns the last enumerator
•	next(N), prev(N): step ahead or back N values
•	num(): total number of enumerators
•	name(): string name of the current enumerator 

🧭 5. Why Use Enums?
•	Readability: Named constants replace magic numbers; easily understandable code
•	Maintainability: Changing mapped values in one place updates all use cases.
•	Type Safety: Helps catch invalid assignments early in simulation or compile time.
•	Error Detection: Forward declarations or unresolved typedefs cause errors, helping catch missing definitions They are particularly common in:
•	Finite State Machines (FSMs)
•	Protocol encoding / opcodes
•	Configuration parameters and modes
•	Replicating discrete options for test benches

