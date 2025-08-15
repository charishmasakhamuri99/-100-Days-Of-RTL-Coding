🔍 What is a Ring Counter?
A Ring Counter is a type of shift register where the output of the last flip-flop is connected back to the input of the first flip-flop. It circulates a single 1 or 0 through the register bits in a circular fashion.
🔁 Working Principle:
•	It’s an n-bit shift register where only one flip-flop is set to 1 at a time, and this 1 circulates with every clock pulse.
•	For example, a 4-bit ring counter will go through:
1000 → 0100 → 0010 → 0001 → 1000 → ...

🧠 Design Explanation:
We use:
•	A clock and reset
•	A register to store the current state
•	On reset: initialize to 1000
•	On every rising edge of clock: shift left and wrap the MSB to LSB
