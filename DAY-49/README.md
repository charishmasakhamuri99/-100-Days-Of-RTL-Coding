🔁 1. Master–Slave JK Flip-Flop: Concept & Working
•	Structure: Two latches in series:
o	Master latch: operates when clock = 1
o	Slave latch: operates when clock = 0 (driven by inverted clock) 
•	Why it's used: Prevents the race-around condition seen in simple JK flip-flops when J = K = 1 and the clock is held high—this configuration ensures toggling only occurs across a full clock pulse.
•	Truth Table:
J	K	Qₙ₊₁	Action
0	0	Qₙ	Hold
0	1	0	Reset
1	0	1	Set
1	1	¬Qₙ	Toggle
			
•	Timing:
o	During clock high, the master latch captures J/K inputs, the slave is inert.
o	When the clock falls, the slave latch transfers the master's output to Q, completing one full cycle of behavior 
Why this works:
•	Master latch follows J/K behavior during clock high.
•	Slave latch transfers stable master output during clock low, avoiding toggling loops 
What it verifies:
•	Correct reset behavior.
•	Covering all input states: hold, reset, set, and toggle.
•	Observes correct edge sequencing with two-phase latch 

