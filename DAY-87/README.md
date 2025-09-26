1. JK Flip-Flop Overview
A JK flip-flop is a sequential logic device with two inputs (J and K) and one output (Q). Its behavior on the clock edge is as follows:
•	J = 0, K = 0: Output remains unchanged (no change)
•	J = 0, K = 1: Output is reset to 0
•	J = 1, K = 0: Output is set to 1
•	J = 1, K = 1: Output toggles (flips) from its previous state
2. SR Flip-Flop Overview
An SR (Set-Reset) flip-flop also has two inputs (S and R) and one output (Q):
•	S = 0, R = 0: Output holds its previous value (no change)
•	S = 0, R = 1: Output is reset to 0
•	S = 1, R = 0: Output is set to 1
•	S = 1, R = 1: This is an invalid (forbidden) state as it leads to unpredictable output
3. Implementing JK Using SR Flip-Flop
To implement a JK flip-flop using an SR flip-flop, we need to express the behavior of the JK flip-flop in terms of SR inputs (S and R).
Logic Conversion:
•	S (Set) = J & ~Q : S is high when J is high and output Q is low (i.e., to set the output)
•	R (Reset) = K & Q : R is high when K is high and output Q is high (i.e., to reset the output)
These logic equations ensure:
•	When J=K=1 (toggle): one of S or R will always be 1 depending on the current state Q, which achieves toggling by alternately setting or resetting.
•	When J=K=0: neither S nor R is active, so Q holds its value.
•	When only J=1 or K=1, the circuit sets or resets Q accordingly.
4. How the Code Works
•	SR_FF Module:
This is a synchronous SR flip-flop with active-low reset. On each clock edge, based on S and R, Q is updated according to SR flip-flop rules (where S=R=1 yields an invalid state).
•	JK_FF_Using_SRFF Module:
This module connects J and K inputs to S and R using the conversion logic above, using the current Q feedback. An internal wire Q_int is used to compute the S and R values.
•	Testbench:
The testbench generates various input combinations of J and K, applies them to the circuit over time, and allows for observing the output Q in response to different JK input patterns.
5. Purpose and Behavior
By applying the logic:
•	The structure enables the SR flip-flop to mimic all behaviors of a JK flip-flop, including toggle, set, reset, and hold.
•	The circuit demonstrates how different flip-flops can be constructed from one another using appropriate combinational logic at their inputs.

