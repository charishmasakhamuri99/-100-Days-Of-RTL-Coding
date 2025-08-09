🧠 Theory Explanation
1. Vectors with Negative Indices
Verilog allows declaration of vectors with negative and reversed indices (e.g., [-4:3]). This syntax defines an 8-bit vector containing bits -4, -3, ..., 3. The order doesn’t impact synthesis—it simply defines 8 contiguous bit positions 
2. Identical Ranges, Direct Mapping
Because both vec_a and vec_b use the same indexed range:
verilog
CopyEdit
reg signed [-4:3] vec_a;
reg signed [-4:3] vec_b;
When assigning vec_a = vec_b;, every bit from index -4 to 3 is copied directly—no truncation or shifting occurs.
3. Signed vs. Unsigned
The signed keyword tells the simulator to treat arithmetic operations and comparisons with two’s complement semantics. Though this example only performs bitwise assignment, signedness clarifies interpretation when using negative numeric constants .
4. Monitoring a Negative-Indexed Bit
Accessing vec_a[-3] is valid and prints the state of that specific bit. Negative indices are simply part of the defined vector indices, not an error .
5. Combinational Logic with always @(*)
Using always @(*) ensures vec_a updates immediately in response to changes in vec_b, modeling a combinational relationship.

