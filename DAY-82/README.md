
D Flip-Flop Module
•	The D flip-flop is a basic sequential logic circuit used to store a single bit of data.
•	It captures the input value D at the rising edge of the clock signal (clk) and holds this value stable until the next clock edge.
•	Asynchronous reset (rst) is also included: when rst is asserted (high), the output Q is immediately reset to 0 regardless of the clock.
•	The code uses an always block sensitive to the positive edge of clk or rst.
•	If rst is high, Q is set to 0.
•	Otherwise, on the rising edge of clk, Q is updated to the input D.
•	This means the output Q follows the input D but only updates on clock edges, effectively "sampling" the input at discrete time points.
SR Flip-Flop Using D Flip-Flop Module
•	An SR (Set-Reset) flip-flop stores a bit that can be set or reset explicitly.
•	The SR flip-flop here is implemented by using the D flip-flop module as a building block.
•	The logic for D input to the D flip-flop is designed from the SR inputs S (Set) and R (Reset) and the internal output Q_int.
•	D = S OR (NOT R AND Q_int):
•	If S (Set) is high, D is set to 1, which will set Q on the next clock.
•	If R (Reset) is high, NOT R is 0, so D becomes 0 unless S is high, thereby resetting the output on the next clock.
•	When both S and R are low, the output holds its previous state (Q_int).
Theoretical Concepts Summarized
•	Sequential Logic: Both modules are sequential circuits because their output depends not only on the current input but also on the past inputs stored in the flip-flop state.
•	Edge-Triggered: The D flip-flop updates state on the rising edge of clk.
•	Asynchronous Reset: The D flip-flop's state can be reset asynchronously (immediately) when rst is high.
•	Functional Abstraction: The SR flip-flop is built on a lower-level D flip-flop by defining the D input in terms of S, R, and the current output state.

