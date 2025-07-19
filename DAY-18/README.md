🧠 What Is Gray Code?
Gray code, also called reflected binary code or unit-distance code, is a binary numbering system where any two successive values differ by exactly one bit 
Scaler

First described by George R. Stibitz around 1941, and later named after Frank Gray from Bell Labs in 1947 

🔁 The Reflection Construction Algorithm
Gray code has a natural recursive “reflection” building process:

Start with 1-bit Gray code: 0, 1.

For n-bit Gray code, take the (n−1)-bit list, prefix it with 0 in original order.

Then reflect (reverse) the list, prefix with 1, and append.
This ensures adjacent values differ by one bit 

→ Combined: 000,001,011,010,110,111,101,100
💡 Key Properties of Gray Code
Single-bit adjacency: Each code differs by only one bit from its neighbor (Hamming distance = 1).

Cyclic: The last Gray code differs from the first by one bit, maintaining wrap-around continuity 

Balanced transitions: Some Gray codes evenly distribute which bit flips across transitions, minimizing wear or errors 

Hamiltonian path on hypercube: Gray codes correspond to paths on an n-dimensional cube visiting each vertex exactly once 

🧮 Why Only One Bit Changes: Mathematical Insight
Using the binary-reflected Gray code, the MSB remains same between sequential values, while lower bits change according to adjacent binary bits comparison:
𝐺[𝑛−1]=𝐵[𝑛−1],𝐺[𝑖]=𝐵[𝑖+1]⊕𝐵[𝑖]G[n−1]=B[n−1],G[i]=B[i+1]⊕B[i]

Thus the Gray code is:gray=binary⊕(binary≫1)
gray=binary⊕(binary≫1)


This design ensures that each increment in binary flips exactly one Gray bit, preserving the one-bit-change rule.

🛠️ Why Gray Code Matters: Practical Applications
Rotary encoders & shaft position sensors
Prevents misinterpretation when mechanical contacts change, due to only one bit flipping per step 

Clock-domain crossing in digital design
When transferring multi-bit values between asynchronous clock domains (like FIFO pointers), Gray encoding avoids metastability by ensuring only one bit changes at a time 


Karnaugh map labeling
Gray code ordering simplifies logic simplification by ensuring adjacent cells differ by one bit, making grouping easier 

Digital communication / modulation (e.g. QAM)
Gray coding of constellation points reduces bit errors caused by adjacent symbol misidentification 
