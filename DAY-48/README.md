
•  MSB selects width (e.g., 8 or 16).
•  On each posedge clk:
•	If reset low: out <= 0
•	Else if enable high:
o	dir == 0: shift left → out <= {out[MSB 2:0], d}
o	dir == 1: shift right → out <= {d, out[MSB 1:1]}
•	If enable low: maintain current state .
This TB:
•	Resets the design
•	Enables shifting
•	Flips input data,
•	Switches direction halfway,
•	Observes output behavior .

✅ Key Takeaways
•	Parameterized width via parameter MSB
•	Control signals: en and dir
•	Serial behavior: serial-in, serial-out shifting
•	Reset logic for clean simulation starts
•	Directed testbench monitors functionality across modes

🛠️ How to Verify & Extend
Task	Tip
Validate waveforms	Run TB in simulation tool and observe shifting bits
Extend width	Change MSB parameter to 4, 8, 16, etc.
Add parallel load	Enhance with load control and load_data input
Add serial outputs	Provide msb_out, lsb_out for convenience


