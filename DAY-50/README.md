🧠 1. Moore FSM Design for “1010” Detector
•	Moore machine: Output depends only on the current state (not directly on inputs).
•	Detects overlapping patterns (when final bits of one detection can start the next).
•	Requires 5 states—one extra state to generate the output pulse correctly
🧭 State Diagram & Naming
State	Meaning	Transition on x=1	Transition on x=0	z output
A	Start / no match yet	→ B	→ A	0
B	Saw 1	→ B	→ C	0
C	Saw 10	→ D	→ A	0
D	Saw 101	→ E	→ C	0
E	Detect “1010” (output state)	→ D	→ A	1
•	State E is the output state (z=1), and from there:
o	On x=1: transition to D to allow overlapping (last 1 may start new sequence).

o	On x=0: go back to A.

•	state_t is a 3-bit enum type for clarity.

•	always_ff captures and resets the FSM state.

•	always_comb handles both next-state and output logic.

•	Output z is high only in state E.

•	 Clock toggles every 5 ns.

•	  Reset pulse held low for 10 ns.

•	  Applies a test sequence that includes overlapping “1010” patterns.

•	  Outputs monitoring shows when z pulses for detections.
