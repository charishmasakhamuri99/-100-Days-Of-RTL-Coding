🎯 What Is a Priority Encoder?
A priority encoder is a combinational logic circuit that takes multiple inputs (typically one-hot or sparse) and outputs a binary code of the highest-priority input that is asserted 
Unlike a basic encoder—which assumes at most one input is active and can produce incorrect outputs when multiple inputs are active—a priority encoder handles conflicts by always selecting the input with the highest designated priority, usually the largest index .

⚙️ How It Works
•	Inputs: N signals (e.g., D₀–D₇ for an 8:3 encoder)
•	Output: Log₂(N)-bit binary code (e.g., 3 bits for 8 inputs)
•	Priority Logic: If multiple inputs are active simultaneously, only the input with the highest priority (i.e., MSB first) is encoded 
🛠️ Truth Table Example (4-to-2 Priority Encoder)
I₃	I₂	I₁	I₀	Output (O₁O₀)	Valid
0	0	0	0	—	0
0	0	0	1	00	1
0	0	1	X	01	1
0	1	X	X	10	1
1	X	X	X	11	1
The Valid signal indicates when at least one input is asserted, avoiding ambiguity when all inputs are zero .
✅ Benefits Over Simple Encoders
•	Robustness: Correct outputs even when multiple inputs are active.
•	Determinism: Encodes only the highest-priority input, eliminating output ambiguity .
•	Useful flags: Often include a valid or enable signal to indicate if the input is meaningful .
