1. SR Flip-Flop Module (sr_flipflop)
•	Basics:
•	The SR flip-flop (Set-Reset flip-flop) is a bistable storage element with two inputs—Set (S) and Reset (R)—and one output (Q).
•	It stores a single bit of data, changing its output according to inputs at the positive edge of the clock or asynchronously resetting when rst is asserted.
•	Behavior:
•	If reset (rst) is high, the flip-flop immediately sets the output QQ to 0, overriding inputs.
•	On the rising edge of the clock (when rst is low):
•	If S=1,R=0S=1,R=0, set Q=1Q=1
•	If S=0,R=1S=0,R=1, reset Q=0Q=0
•	If S=0,R=0S=0,R=0, hold QQ at its previous state (no change)
•	If S=1,R=1S=1,R=1, this is an invalid condition, leading to an undefined state Q=xQ=x. This situation should be avoided.
2. T Flip-Flop Using SR Flip-Flop (t_flipflop_using_sr)
•	Goal:
•	Implement a Toggle (T) flip-flop, which toggles (inverts) its output at every rising clock edge when T=1T=1, or holds the output unchanged when T=0T=0.
•	Conversion from T to SR inputs:
The T flip-flop can be constructed using an SR flip-flop by controlling inputs SS and RR based on TT and the current state QQ as:
S=T⋅Q‾,R=T⋅QS=T⋅Q,R=T⋅Q
•	When T=1T=1, either the set or reset input goes high depending on QQ:
•	If current Q=0Q=0, then S=1S=1, causing the flip-flop to set Q=1Q=1 on the rising clock edge.
•	If current Q=1Q=1, then R=1R=1, causing the flip-flop to reset Q=0Q=0.
•	Thus, when T=1T=1, output QQ toggles.
•	When T=0T=0, both S=0S=0 and R=0R=0, so the flip-flop holds the current state QQ.
•	Operation:
•	On every rising clock edge, the SR flip-flop updates its output based on SS and RR.
•	Given how SS and RR are derived, the output QQ toggles every clock cycle if T=1T=1, and holds if T=0T=0.
3. Testbench (tb_t_flipflop_using_sr)
•	Purpose:
•	Verifies that the T flip-flop correctly toggles or holds output QQ based on the input TT.
•	Simulates asynchronous reset rstrst, clock signal generation, and applies varied TT inputs.
•	Behavior In Test:
•	The reset signal initializes Q=0Q=0.
•	TT is toggled between 0 and 1 to check that the flip-flop toggles output on rising clock edges when T=1T=1, and maintains the output when T=0T=0.
•	Monitors signals to ensure correct response.
