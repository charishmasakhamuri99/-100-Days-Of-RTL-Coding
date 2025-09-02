🎯 What is a Packed Struct?
A packed struct packs multiple bitfields contiguously into a single vector—much like defining bitfields in C—making it ideal for hardware-oriented representations such as registers or bus packets. Declared using typedef struct packed { ... } name;
•	All members must be packed data types like bit, logic, or enums—no dynamic types like string. 
•	The ordering is MSB first: the first member defined occupies the most significant bits, and subsequent members fill lower bits. 
🧠 Why Use Packed Structs?
Feature	Packed Struct
Memory layout	Dense, no padding—like a single bit-vector packed tightly. 
Bitwise operations	Supports treating the whole struct as a vector—allows slicing, merging, or vector assignment. 
Hardware-friendly	Perfect for representing hardware-level interfaces (e.g., protocol frames or register maps). 

🔧 Key Properties
1.	Contiguous, gapless layout
All fields follow in memory exactly in sequence, forming a compact vector. 
2.	Vector equivalence
Since it's like a bit-vector, you can assign it directly:
3.	Bitwise slicing/concatenation
Enables easy read/write of sub-fields or bundling with other vectors. 
4.	Type restrictions
o	Only packed data types allowed (e.g., bit, logic, enums).
o	No string, dynamic arrays, etc. 
o	Packed structs are unsigned by default, though you can add signed if desired.

🏁 Summary
•	Packed struct = tight, vector-like representation of multiple fields.
•	All fields are contiguous and directly accessible at both field-level and whole-vector level.
•	Ideal for synthesizable hardware constructs—registers, bus frames, protocol descriptors.
•	Not suited for dynamic or mixed-type data storage—use unpacked structs or other data structures in those cases.
