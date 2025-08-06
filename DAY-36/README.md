🧠 Theory: Understanding the Data Types
1. reg [3:0] a
•	Holds a 4-bit value, ideal for flip-flops or combinational logic storage.
•	Can represent unknown (X) or high-impedance (Z) states. 
2. integer b
•	A 32-bit signed variable, suited for loops, counters, or general math. 
3. real c
•	A 64-bit floating-point type, precise enough for decimal operations. Assigning a real to an integer drops the fraction.
4. time t
•	An unsigned 64-bit integer capturing simulation time (in ticks, not decimals). Useful with $time. 
5. realtime rt
•	A 64-bit floating-point time variable, capturing time with fractions. Useful with $realtime.

🌐 Value Sets in Verilog
•	Most data types can represent four logic states: 0, 1, X (unknown), and Z (high-impedance). 
•	reg, integer, and time default to X at simulation startup. 
•	wire defaults to Z if unconnected. 
🔚 Summary
Data Type	Bits	Use Case
reg	Vector	Logic storage; supports multi-bit signals
integer	32-bit	Signed arithmetic, counters, loop indices
real	64-bit	Floating-point math
time	64-bit	Simulation-time captures (integer precision)
realtime	64-bit FP	Simulation-time with fractional precision
These variables are primarily simulation-only, aiding in debugging, timing capture, and mathematical operations—not synthesizable to hardware.
