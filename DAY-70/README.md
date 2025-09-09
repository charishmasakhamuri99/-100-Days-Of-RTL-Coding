🎯 What Are Parameterized Classes & Why Use Them?
Parameterized classes are like templates in C++. They let you define a generic class blueprint that can be specialized at compile time by providing values or types. The combination of the class name and its parameters forms a unique class specialization.
Why they're useful:
•	Promote code reuse and reduce duplication—for instance, building FIFOs or transactions of various widths or types from a common template.
•	Provide compile-time flexibility, enabling different behavior or storage depending on parameterization.

🔧 Types of Parameters
1.	Value Parameters (int SIZE = 8):
o	Define fixed constants or widths.
o	Example: something #(int size = 8) allows instantiation with different size values. Each distinct size creates a new class specialization 
2.	Type Parameters (type T = int):
o	Allow the class to operate generically over different data types.
o	Example: stack #(type T = int) can be instantiated as stack#(bit[3:0]) for 4-bit vectors, or stack#(real) for real numbers 

🧱 Class Specialization & Type Safety
Each unique parameterization defines a distinct class type. A handle for something#(8) is not compatible with something#(16)—they are separate classes 

📝 Constructor Behavior
Unlike some templates in other languages, all parameters—value or type—must be known at elaboration time, before simulation. You cannot pass parameter values or types dynamically at runtime; they’re fixed when you declare the object specialization 
🔄 Inheritance & Parameterized Classes
Parameterized classes integrate gracefully with inheritance. You can extend a parameterized class directly, or pass its parameters along to the base. This enables layered generic design patterns 
✅ Summary Table
Feature	Description
Value parameter	Customize constants like bus widths
Type parameter	Generalize class for different data types
Specialization	Each unique parameterization produces a new class
Compile-time binding	Parameters fixed during elaboration
Inheritance-compatible	Can extend parametrized classes, pass along parameters
UVM relevance	Core to reusable, typed sequences, agents, transactions

