An associative array in SystemVerilog is a dynamic, sparse, and dictionary-like data structure that allows indexing with arbitrary data types such as int, string, or other scalar types. Unlike fixed-size arrays, associative arrays do not require the size or indices to be known at compile time.
Key Characteristics
1.	Dynamic and Sparse
•	The number of elements can grow or shrink at runtime.
•	Only the assigned indices consume memory; unassigned indices do not consume resources.
2.	Flexible Indexing
•	Indices can be integers, strings, or any scalar type, unlike packed or fixed arrays which are always indexed by integers.
•	This makes associative arrays ideal for cases where data keys are not sequential numbers but meaningful strings or sparse keys.
3.	No Predefined Size
•	No need to declare the size upfront; elements can be added or removed dynamically.
4.	Common Operations
•	Assigning values: Like arrays, but at any valid index at runtime.
•	Iteration: Using foreach to iterate over all existing keys only.
•	Existence checking: .exists(key) returns whether a particular key is currently assigned.
•	Number of entries: .num() returns how many elements are currently stored.
•	Max size: .size() returns size range based on the type but less meaningful for associative arrays.
5.	Use Cases
•	Storing sparse datasets where index ranges are large or unknown.
•	Mapping string keys to values like symbol tables or configuration parameters.
•	Handling hardware designs requiring look-up tables or caches keyed by arbitrary identifiers.

