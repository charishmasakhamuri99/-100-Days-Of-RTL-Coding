📘 1. What Is a Struct?
A struct in SystemVerilog is a composite (or aggregate) data type that groups multiple variables of possibly different types under one name, similar to C-style structs 
Unlike arrays, which hold homogeneous data types, structs are ideal for logically bundling related but heterogeneous fields—such as signals of a bus protocol, transaction packets, or record entries 
2. Packed vs. Unpacked Structs
•	Unpacked Struct (default):
Declares fields independently in memory; not synthesizable as a contiguous vector. Flexible and suitable for testbench data or complex types like strings and enums 
•	Packed Struct:
Defined with struct packed, it tightly maps all fields into a contiguous bit vector. Synthesizable and supports bit-level operations and vector assignment. The first field represents the most significant bits Packed structs allow slicing and arithmetic across the entire vector and are often used for control/status registers or protocol fields 
3. Initialization, Assignment & Access
•	Dot notation: Access fields like mystruct.field1.
•	Aggregate assignment: Use '{…} to initialize fields in declared order.
•	Copying struct instances: Value-based copy; one instance's change doesn’t affect the other 
4. Important Behaviors & Constraints
•	Packed struct bit ordering: The first member becomes the most significant bits, with subsequent members following in decreasing significance. This structure matches flat vector layouts for easy bit slicing 
•	Field-level safety: Structs prevent misuse of arbitrary bit vectors; assignment must respect matching layouts or types 
