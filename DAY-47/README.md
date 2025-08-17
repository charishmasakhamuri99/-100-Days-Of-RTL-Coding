A N-bit comparator compares two binary numbers and returns outputs based on their relative magnitude. The basic design involves comparing each bit of two N-bit numbers in a pairwise manner, generating outputs for whether the numbers are equal, or if one is greater than the other.
N-bit Comparator Design
The design of an N-bit comparator can be broken down into several parts:
1.	Inputs:
o	Two N-bit numbers, A[N-1:0] and B[N-1:0].
2.	Outputs:
o	A > B (1 bit) - High if A is greater than B.
o	A < B (1 bit) - High if A is less than B.
o	A == B (1 bit) - High if A is equal to B.
3.	Logic:
o	For A == B, check if each bit of A equals the corresponding bit of B from MSB to LSB.
o	For A > B, propagate a "greater than" flag whenever a higher bit in A exceeds B.
o	For A < B, similarly, propagate a "less than" flag when a lower bit in A exceeds B.
Explanation of Testbench:
•	The testbench is designed for a 4-bit comparator (N = 4).
•	Several test cases are applied, comparing different values for A and B to verify the correctness of the comparator.
•	Each test case is followed by a delay (#10) to allow the signals to propagate before printing the results.
•	The $display statement outputs the results of the comparison (A > B, A < B, A == B).
