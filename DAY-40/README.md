🧠 Theory & Explanation
1. Signed Vectors and 2’s Complement Representation
•	Declaring signed tells Verilog to interpret MSB as the sign bit (two’s complement).
•	For instance, vec_b = -69 in 8-bit means binary 101111011 (actually 8 bits: 10111011). The storage is two’s complement of 69.
2. Vector Width Mismatch: Sign-Extension
•	vec_b is 8 bits ([-4:3]). vec_a is 10 bits ([-4:5]).
•	Assigning vec_a = vec_b in signed mode sign-extends vec_b, filling MSBs with its sign bit (bit index 3) .
o	If vec_b[3] = 1, MSBs of vec_a are filled with 1.
o	If 0, filled with 0.
3. Example Walkthrough
Time	vec_b (decimal)	vec_b (8-bit binary)	vec_a (10-bit binary)	vec_a (decimal)
0	−69	10111011	1110111011	−69
10	−15	11110001	111111110001	−15
20	−128	10000000	111000000000	−128
4. Accessing vec_a[-3]
•	Negative indices are valid in Verilog and select specific bits from your signed vector, useful for bitwise inspection .
5. Significance of Signedness
•	Signed arithmetic requires all operands be declared signed for correct treatment 
•	Assigning signed to signed preserves sign in arithmetic and comparisons.
✅ Key Takeaways
1.	Declare signed to correctly interpret negative numbers.
2.	Width mismatch in signed context → sign-extension (not zero-extension).
3.	Negative bit indices ([-4:5]) define vector ranges but are syntactic—they create indexed bits, not negative positions 
4.	Monitoring with %d and %b shows decimal and binary interpretation, highlighting how sign-extension preserves value.

