A multiplexer (MUX) is a combinational digital circuit that selects one of many input signals and passes it to a single output, based on the value of control signals called select lines (or selector inputs). It's often referred to as an "N-to-1 selector" or a "data selector."
•	Inputs:
o	in[3:0]: Four parallel data inputs.
o	sel[1:0]: Two-bit select signal (00–11).
•	Output:
o	out: The selected input bit.
•	Key line: assign out = in[sel];
o	This uses Verilog’s indexed vector feature.
o	When sel = 2'b10, it selects in[2], etc.
o	It's shorthand for the classic 4:1 mux logic 
•	Sets up a simulation dump (.vcd) for waveform viewing.
•	Uses $monitor to log changes in real time.
•	Applies a mix of input patterns and cycles through all select values.
•	Ensures out always matches the selected input bit—classic combinational coverage 

🖼 3. Expected Waveform Explanation
Your waveform viewer (e.g., GTKWave, ModelSim, Vivado) should display:
•	Top 4 lines: in[3] in[2] in[1] in[0]
•	Middle: sel[1] sel[0]
•	Bottom: out
Observations:
•	At each 10 ns interval, sel changes.
•	The out signal instantly (zero delay in RTL sim) reflects in[sel].
•	Over all combinations, it accurately selects the correct bit of in based on sel.
This confirms the mux operates correctly as a pure combinational circuit.

✅ 4. Reinforcement & Variations
•	Equivalent versions:
o	Data-flow with ternary (?:).
o	Gate-level or structural implementations using 2:1 mux chaining 
•	Why indexed selection is powerful: reduces possibility of logic errors and is compact.
•	Production tip:
o	For ASIC/FPGA synthesis, this style synthesizes into optimal multiplexing hardware.

Summary
•	Design uses a succinct out = in[sel] approach, leveraging Verilog indexing.
•	Testbench covers essential combinations ensuring correctness.
•	Waveform should show exact bit-for-bit output selection.
•	Multiple modeling styles exist, but indexing is most elegant for simple muxes.
