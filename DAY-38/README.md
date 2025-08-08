🔁 1. Truncation: Assigning Wider to Narrower
When you assign a wider vector (e.g., [8:0] vec_b) to a narrower vector (e.g., [6:0] vec_a), Verilog performs implicit truncation:
•	Only the least significant bits (LSBs) fitting the target width are retained.
•	Higher-order bits are discarded silently (though some tools may issue a warning) Example:

🔍 2. Zero-Extension vs Truncation
•	Assigning a smaller vector to a larger one results in zero-extension (MSBs are filled with 0) 
•	Assigning a larger vector to a smaller one results in truncation: the MSBs that don't fit are dropped .
Visual summary:
Scenario	Result
5 bit → 7 bit (a = b;)	Zero-extend
9 bit → 7 bit (a = b;)	Truncate MSBs

✂️ 3. Part-Select: Accessing Specific Bits
Your $monitor prints vec_a[2], the third bit from the LSB, illustrating bit slicing or part-select:
•	Useful for checking specific bit-level behavior after assignment 
⚙️ 4. Using always @(*) for Combinational Logic
Even though your code may live in an initial block for testing, combinational logic is best modeled in:
verilog
CopyEdit
always @(*) begin
  vec_a = vec_b;
end
This ensures vec_a is updated immediately whenever vec_b changes, simulating hardware’s parallel behavior 
📋 5. Why It Matters
•	✅ Predictable resizing of data: smaller-to-larger zero extends; larger-to-smaller truncates.
•	⚠️ Silent truncation can cause unintended data loss—good practice is to use explicit slices or concatenations for clarity.
•	🛠 Combinational patterns (always @(*)) help implement real-time logic in hardware.
