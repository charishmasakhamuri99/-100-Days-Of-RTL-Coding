🧠 What Is Polymorphism?
Polymorphism — literally “many forms” — enables a base-class handle to refer to objects of different derived classes, and invoke their specific behaviors at runtime rather than compile time. In SystemVerilog, this is achieved using virtual methods within a class hierarchy 

🔍 Key Concepts in SV Polymorphism
1. Virtual Methods
Declaring a function or task as virtual in the base class signals that derived classes may override it. This transforms the method call into a late-bound operation, allowing correct override execution during simulation 
2. Polymorphic Handles
When a base-class handle (e.g., Shape sb) references an instance of a derived class (Circle, Square, etc.), a call to a virtual method on the handle resolves to the overridden implementation in the actual object class 
3. Dynamic Dispatch
SystemVerilog uses a mechanism akin to a vtable (virtual method table). At runtime, the simulator selects the correct method version based on the object’s actual class type—not just the declared type of the handle 
4. Up and Down Casting
•	Up-casting (derived → base) is implicit and safe — e.g., assigning Circle to a Shape handle.
•	Down-casting (base → derived) requires using $cast(child_handle, base_handle). This returns true if the conversion is valid at runtime and prevents type incompatibility issues 



💡 Why It's Useful
✅ Code Reuse & Extension
Base classes can define broad interfaces (like a generic draw()), while derived classes customize the implementation. This encourages modular, extensible design.
✅ Flexible Testbenches
In environments like UVM, many components (like sequences and drivers) rely on polymorphism to handle various subtypes using a unified interface 
✅ Runtime Selection
Tests or configurations can choose at runtime which subtype to instantiate—without changing hierarchical code—simply by using polymorphic handles.
