🧠 1. 4 State vs. 2 State Logic
•	4-state variables (logic, legacy reg, wire) can represent 0, 1, X (unknown), and Z (high impedance). This models real hardware scenarios like uninitialized signals or tri-state buses 
•	2-state types (bit, int, etc.) only hold 0 or 1, enabling faster simulation when X/Z semantics aren’t needed.

2. logic Replaces reg and wire
•	logic is a universal 4-state data type that can be assigned in both procedural blocks (initial/always) and continuous assignments (assign) 
•	This obsoletes Verilog’s confusing duality of wire (nets, continuous only) and reg (procedural storage only), offering a simpler, unified alternative 
3. Driver Rules & Multiple Sources
•	A signal declared as logic must have a single driver. If multiple drivers are needed (like a multiplexer or tri-state bus), use a net (wire) so the tool can resolve and arbitrate based on driver strengths 
he provided SystemVerilog code is a simple testbench module designed to initialize, stimulate, and observe signal changes within a simulation, which is crucial for verifying digital designs before hardware implementation.

Testbench Structure
The module tb_logic declares two signals: a 4-bit logic vector named data and a single logic bit named enable.

The initial begin block generates the stimulus by assigning values to signals and introducing delays using the #5; statement, simulating the passage of time in the testbench.

Display and Observation
The $display statement prints the current simulation time and the values of data and enable, which assists in real-time debugging during simulation runs.

By changing enable based on the state of data, the module emulates basic behavioral logic for verification purposes.

Waveform Generation
To generate waveforms, additional system tasks like $dumpfile("tb_logic.vcd"); and $dumpvars(0, tb_logic); are included. These commands instruct the simulator to record all signal changes into a VCD (Value Change Dump) file, which can be visualized using waveform viewers such as GTKWave or ModelSim.

Waveforms provide a graphical representation of signal transitions and relationships over time, making it easier to spot timing issues, logic errors, or unexpected behavior.

Purpose in Digital Design
Testbenches like this are critical in the design flow: they are non-synthesizable and used strictly for simulation and verification.

Observing both textual output and visual waveforms helps engineers ensure correct design functionality before moving to more costly physical prototyping.
