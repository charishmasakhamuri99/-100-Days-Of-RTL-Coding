1. Inheritance
Inheritance in SystemVerilog lets you define a derived (child) class that extends a base (parent) class, inheriting its data members and methods. The derived class can:
•	Reuse existing features without touching the base.
•	Add new members or override existing behavior 
Key points:
•	Only single-inheritance is allowed; multiple parent classes aren’t supported 
•	Multilevel chains (a child of a child) are supported 

2. extends Keyword
Use class Derived extends Base; to set up the inheritance relationship.
This provides:
•	Access to all accessible members from the base class.
•	Seamless integration of new and overridden members in the child 
3. Method Overriding & super
•	Override a base method by declaring it again in the derived class.
•	Use super.method() to call the parent version from within the override, preserving base functionality 4. Constructors and super.new()
•	Each class can have its own function new(...).
•	If the parent defines new(...), the child’s constructor must explicitly call it via super.new(args); as the first statement 
•	If not explicitly declared, SystemVerilog automatically chains constructors and calls the base one.

5. Polymorphism with virtual
•	Declaring a method virtual in the base class enables dynamic dispatch.
•	A parent-class handle pointing to a child object will execute the child's overridden version of the method at runtime 
•	This is key for writing flexible, extensible testbench code.
6. Dynamic Casting ($cast)
•	Up-casting (child → base) works implicitly.
•	Down-casting (base → child) requires using $cast(child_handle, base_handle), which returns success/failure.
Useful for accessing child-specific fields from a base handle
