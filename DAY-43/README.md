🧠 What Is a Johnson Counter?
A Johnson counter, also called a twisted ring, creeping, or switch-tail counter, is a synchronous shift register counter. It consists of n flip flops in series, with the inverted output of the last stage (Q̅ₙ) fed back into the input of the first stage (D₁) 
⚙️ Core Operation & State Sequence
•	Initialization: Typically starts at all-zero state (e.g., 000...0).
•	Feedback: On each rising clock edge, bits shift right, and the inverted last bit cycles in at the leftmost stage .
•	Sequence (n=4 example):
0000 → 1000 → 1100 → 1110 → 1111 → 0111 → 0011 → 0001 → 0000 …
Produces 2n distinct states (here, 8 states) before repeating 
🔢 Counting Capacity and Modulus
•	Modulus: A Johnson counter with n flip flops has a mod 2n cycle (i.e., 2n states) 
•	Efficiency: Uses the same hardware as a ring counter but offers double the state count 
•	Unused States: Though the flip flop array is 2ⁿ in capacity, only 2n states are employed, leaving many invalid/unreachable states.
✅ Advantages
1.	Hardware efficient
2.	Self starting
3.	Gray like transitions
4.	Self decoding 
