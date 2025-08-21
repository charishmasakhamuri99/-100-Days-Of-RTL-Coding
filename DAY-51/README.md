💡 Objective:
To find the Greatest Common Divisor (GCD) of two 8-bit numbers using the Euclidean subtraction method implemented via a Finite State Machine (FSM).
🧠 Concept Used:
The Euclidean Algorithm (subtraction method):
•	Given two numbers a and b, the GCD is calculated by repeatedly subtracting the smaller number from the larger:
o	If a > b, do a = a - b.
o	If b > a, do b = b - a.
o	Continue until a == b. At that point, GCD = a = b.

⚙️ FSM States Explanation:
We define 4 states for the FSM:
1. IDLE:
•	Purpose: Wait for the start signal.
•	Action: Do nothing until start becomes 1.
2. LOAD:
•	Purpose: Load the input values a_in and b_in into internal registers a and b.
•	Action: Assign a = a_in, b = b_in.
3. COMPARE:
•	Purpose: Perform the GCD algorithm logic using subtraction.
•	Action:
o	If a > b: subtract b from a.
o	If b > a: subtract a from b.
o	Repeat until a == b.
4. DONE:
•	Purpose: Output the result (GCD) and raise the done flag.
•	Action: When a == b, assign gcd = a and set done = 1.



🔁 FSM Transitions:
Current State	Input Condition	Next State
IDLE	start = 1	LOAD
LOAD	always	COMPARE
COMPARE	a == b	DONE
COMPARE	a ≠ b	COMPARE
DONE	always	IDLE

🛠 Working Flow Example:
Let’s say a_in = 56, b_in = 98.
•	LOAD: a = 56, b = 98.
•	COMPARE:
o	b > a → b = b - a → b = 42
o	b > a → b = b - a → b = -14 (repeat until a == b)
•	When a == b = 14, DONE state is reached and gcd = 14.
