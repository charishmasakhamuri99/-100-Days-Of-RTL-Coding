📚 Theoretical Notes (with code mapping)
1.	Indexed part-select:
Uses the form [base +: WIDTH] to extract WIDTH bits beginning at base (where base = 8 * index, and WIDTH = 8).
This avoids illegal dynamic-range errors like [8*i+7: 8*i], which synthesizers reject 
2.	Constant width requirement:
The width (8 here) must be a compile-time constant. Only base (i.e., 8*i) may be a runtime expression.
3.	Self-checking testbench:
Compares DUT output (byte_out) against a computed expected value and raises an error if they don't match — a recommended best practice 
Understanding Vector Slice Assignment
1. Part-Select (Static Slicing)
A part-select allows selection of a contiguous group of bits (a slice) from a fixed-width vector.

Both the start and end indices are compile-time constants.

This provides straightforward, static extraction of bits from a signal.

2. Indexed (Variable) Part-Select
Introduced in SystemVerilog (e.g., Verilog-2001 onward), indexed part-selects allow dynamic start positions while keeping width constant.

Syntax: vector[base +: width] or vector[base -: width].

The base can be a variable (runtime-evaluated).

The width must be a positive, constant integer. 


+: selects bits ascending from the base; -: selects descending from the base.

For instance:

vector[x +: y] corresponds to vector[x + y - 1 : x].

vector[x -: y] corresponds to vector[x : x - y + 1]. 


3. Why the Restriction on Width?
Allowing variable widths would introduce dynamic bus-sizing—complicating synthesis and type-checking.

Maintaining a constant width ensures that the hardware structure remains fixed and predictable.

Thus, dynamic start positions with fixed width strike a balance between flexibility and hardware synthesis feasibility. 


4. Array Slice vs Part-Select (Theoretical Distinction)
Part-select operates within a single packed vector—extracting a contiguous range of bits.

Array slice refers to selecting elements (not bits) from an unpacked or multi-dimensional array. 


These are different concepts, both providing slicing capabilities but on different kinds of data.
