🧠 1. What is an ALU?
The Arithmetic Logic Unit (ALU) is the essential computational component of a CPU. As a combinational logic circuit, it takes binary operands and control signals, performs an operation (like addition or AND), and outputs results without needing a clock 

. It's often connected to registers via multiplexers and can complete an operation in a single clock cycle.

🔧 2. Core Structure
A typical 4-bit ALU consists of two main sub-units 
a) Arithmetic Unit
Built from a chain of full adders where each bit addition can include a carry-in and generate a carry-out.

By manipulating inputs to these adders (e.g., using 2’s complement for B), the ALU can perform:

A + B

A – B (via A + (~B + 1))

A multiplexer chooses the final output (D[3:0]) based on the select lines.

b) Logic Unit
Contains parallel logic gates (AND, OR, XOR, NAND, etc.) for bitwise operations.

A multiplexer selects between logic operation outputs based on control signals (S1, S2) 

🏷️ 3. Operation Selection
Control inputs (OP or S) determine which operation the ALU executes:

Arithmetic examples: 000 → add, 001 → subtract

Logic examples: 010 → AND, 011 → OR, 100 → XOR

A multiplexer at the final stage selects the desired output.

🚩 4. Status Flags
These 1-bit flags provide essential result information:

Flag	Purpose
Carry (C)	Indicates an unsigned overflow—a carry-out from the MSB. For subtraction, indicates borrow 

Overflow (V)	Indicates signed overflow—when adding two same-sign numbers produces a different-sign result
Zero (Z)	Set when all result bits are zero
Negative (N)	Typically the MSB of the result, indicating a negative two’s complement number

Key points:

For unsigned math, check Carry (C) only; Overflow (V) is irrelevant.

⚙️ 5. Detecting Overflow
A signed overflow occurs when:

Adding two positives → result should be positive but MSB turns negative.

Adding two negatives → result should be negative but MSB turns positive.
It’s typically detected as V = C_in ⊕ C_out at the sign bit boundary 
✅ 6. Operation Summary
The inputs A[3:0], B[3:0], plus control signals, enter the arithmetic and logic sub-units.

Results from both sub-units → go to a final multiplexer controlled by OP/S.

The chosen result is output, and flags are updated accordingly.

📚 7. Why It Matters
The ALU is the workhorse of CPUs—handling computations, addresses, conditions, and logic decisions. Even every modern CPU core contains multiple ALUs to execute operations in parallel 
School of Engineering & Applied Science
. Though real CPUs use advanced features (like carry-lookahead and pipeline techniques), the fundamental theory remains rooted in constructing a 4-bit ALU from full adders, logic gates, multiplexers, and flag logic 

🔄 Summary
A 4-bit ALU combines arithmetic and logic via multiplexed outputs.

Built from full adders (arithmetic) and gates (AND/OR/XOR/etc.).

Flags like carry, overflow, zero, and negative provide operation context.

Enables both signed and unsigned operations.
