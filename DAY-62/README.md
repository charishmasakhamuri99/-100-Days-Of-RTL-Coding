What’s an unpacked struct?
A struct is a grouping of variables (members) of different data types into one composite type.
•	Unpacked means each instance is stored separately and may contain padding or dynamic types like string—they’re not bit packed into vectors 
•	Since our struct uses string, it’s automatically unpacked (packed structs can only contain fixed-width, packable types like bit or logic) 
•	The testbench instantiates the DUT (struct_example) to run its initial block.
•	#10; gives time for the DUT’s $display to execute, then finishes simulation cleanly.

Why unpacked vs packed matters
Aspect	Unpacked struct	Packed struct
Member types	Any data type (strings, ints, arrays…)	Only fixed-width, “packable” types like bit, logic, enums 
Memory layout	Separate items, possible padding	Tightly packed into a bit-vector 
Use cases	Complex data in testbenches, grouping diverse fields	Hardware with exact bit layouts—e.g. registers, protocol packets 
Convenience	Easy to access and manipulate rich data types	Supports bit wise ops, concatenation, stream assignment

 How this example fits
•	We wanted a convenient grouping of a string, salary, and ID field for simulation.
•	Unpacked struct is ideal for testbench and simulation clarity.
•	Packed structs aren’t usable here due to the string field.

