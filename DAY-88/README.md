
1.	A JK Flip-Flop module implementation (JK_FF).
2.	A testbench module (tb_SR_FF_Using_JK) which tests the SR flip-flop behavior using the JK flip-flop module.
Here's a detailed theory explanation for the provided code and concepts:
Theory Explanation:
1. Flip-Flops:
Flip-Flops are basic memory elements used in sequential logic circuits. They store one bit of data and have outputs that depend not only on current inputs but also on previous inputs (i.e., they have state or memory).
2. JK Flip-Flop:
•	Inputs: J (set), K (reset), clk (clock), and rst_n (active low synchronous reset).
•	Output: Q (state output).
Operation:
•	The JK flip-flop is a refinement of the SR flip-flop. Unlike the SR flip-flop, the JK flip-flop has no invalid or forbidden states.
•	The behavior on each positive edge of the clock (posedge clk) is:
•	If reset (rst_n) is active (low), the output Q is reset to 0.
•	Otherwise, the output depends on inputs J and K:
•	J=0, K=0: No change (Q remains the same).
•	J=0, K=1: Reset Q to 0.
•	J=1, K=0: Set Q to 1.
•	J=1, K=1: Toggle Q (Q becomes ~Q).
This behavior is captured in the case statement.
3. Synchronous Reset:
•	rst_n is an active low synchronous reset.
•	When rst_n = 0 during the clock's positive edge, Q is reset to zero.
•	This type of reset synchronizes the reset signal with the clock edge, making timing predictable.
4. SR Flip-Flop Using JK Flip-Flop:
•	An SR flip-flop has inputs S (set) and R (reset).
•	However, it has an invalid state when both S=1 and R=1.
•	To overcome this, the JK flip-flop can be used to implement an SR flip-flop:
•	J input is connected to S.
•	K input is connected to R.
