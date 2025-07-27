The case equality operator (===) in Verilog is used to compare two operands bit-by-bit, including when their bits can be logical 0, logical 1, unknown (x), or high-impedance (z). This makes it distinct from the normal equality operator (==), which cannot reliably compare x and z values.

Key Features of Case Equality (===)
Bit-Exact Comparison: Checks if every bit in both operands is identical, including x and z.

No 'x' Result: The result is always 1 (true) if all bits match (even if both are x or both are z at the same position), otherwise 0 (false). It does not yield an x result even if inputs contain unknowns.

Case Inequality (!==): The logical opposite; returns 1 if any bit differs, 0 if all bits match, including x and z.

Why Use Case Equality?
Reliability in Testbenches: Useful for checking uninitialized or intentionally unknown values (such as x or z), which is a common scenario in testbenches and design verification.

Precise Comparison with Unknowns: Ordinary equality (==, !=) may produce an ambiguous x if either operand contains x or z, making it unsuitable for certain verification cases.

Example
2'b10 === 2'b10 → 1 (equal, bit for bit)

2'bx1 === 2'bx1 → 1 (both have x at the same position)

2'b10 === 2'bx1 → 0 (bits differ in at least one place)

2'b10 == 2'bx1 → x (uncertainty due to presence of x in operands)
