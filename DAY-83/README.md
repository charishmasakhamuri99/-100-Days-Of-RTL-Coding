•	A T flip-flop (Toggle flip-flop) has one input T and a clock. It toggles its output state (Q) on each clock pulse, if T=1. If T=0, it holds the state.
•	The SR flip-flop has two inputs: S (Set) and R (Reset), with outputs Q and Q'. S=1 sets Q=1, R=1 resets Q=0, and when both are 0, the output holds its previous state. The combination S=1 and R=1 is invalid in basic SR flip-flops.
•	To build a T flip-flop from an SR flip-flop:
•	The S and R inputs are controlled by the current output Q and the T input.
•	The equations for the inputs are:
•	S=T⋅Q‾S=T⋅Q (Set if T=1 and Q=0)
•	R=T⋅QR=T⋅Q (Reset if T=1 and Q=1)
•	When T=1, either S or R becomes 1 to toggle Q on the clock edge:
•	If Q=0, S=1S=1 sets the flip-flop (Q goes to 1)
•	If Q=1, R=1R=1 resets the flip-flop (Q goes to 0)
•	When T=0, S and R are both 0, so the output Q holds its state.
•	This logic ensures the flip-flop output toggles on each clock cycle when T=1, implementing the characteristic behavior of a T flip-flop using SR inputs.
•	The flip-flop works synchronously with the clock, updating its state at positive clock edges.
