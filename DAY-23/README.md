🧠 Key Concept
Bitwise operators in Verilog perform independent logical operations on corresponding bits of multi-bit operands, synthesizing directly to hardware gates 
🔪 Operator List & Functions
Operator	Description
~	Bitwise NOT: inverts each bit (1→0, 0→1) 

&	Bitwise AND: result bit is 1 only if both input bits are 1 

^	Bitwise XOR: result bit is 1 if input bits differ 

~^ / ^~	Bitwise XNOR: complement of XOR 


These are multi-bit operations, unlike logical operators (&&, ||) which yield a single bit 

If operands have different widths, the shorter is zero-extended before the operation 
alchitry.com

⚙️ Reduction vs Bitwise
Bitwise (e.g., a & b): operates pairwise bit-to-bit, output is same width as inputs.

Reduction (e.g., &a, ~|a): applies operation across all bits of one operand, producing a single-bit result 

🏗️ Hardware Interpretation
Each bitwise operator corresponds to an array of logic gates:

a & b → vector of AND gates

~a → vector of NOT gates

Mixed-width ops require padding the smaller operand with zeros 


🔀 Common Use Cases
Masking: isolate or clear bits, e.g. data = data & 8'hF0 clears the lower nibble 


Flag combining: merge multiple status bits, e.g., flags = r[0] | r[1] | ….

Checksum-type logic: use XOR to detect parity.

🔄 Precedence & Comparison
Bitwise operators have higher precedence than logical ones.

Avoid mixing & with && without parentheses to ensure correct interpretation 


Logical operators evaluate to 1-bit Boolean results (0 or 1), while bitwise preserve vector widths
