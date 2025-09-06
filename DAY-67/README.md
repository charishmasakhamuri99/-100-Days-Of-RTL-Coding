🧬 1. What Is Inheritance?
Inheritance in SystemVerilog’s object-oriented paradigm allows a derived class to automatically gain the properties and methods of a base (parent) class, while also being able to add new members or override existing ones It promotes code reuse, modularization, and extensibility, enabling you to extend functionality without altering the original base class.

🔁 2. Extending vs. Overriding
•	Extending: A derived class may introduce new variables and methods not present in the base class.
•	Overriding: The derived class can provide its own implementation for methods inherited from the base class. However, unless marked virtual, calls through a base-class handle will still invoke the base version.
🧠 3. Constructor Chaining
SystemVerilog requires explicit calls to a parent’s constructor if it has parameters. The derived constructor uses super.new(...) as its first action, ensuring proper initialization of inherited members If no constructor is defined explicitly, SystemVerilog generates a default that chains automatically.

⚙️ 4. Polymorphism & Virtual Methods
•	Upcasting: A derived object can be referenced by a base-class handle, enabling generic code usage 
•	Dispatch behavior:
o	Non virtual methods: Resolved statically at compile-time — always invoke the base implementation when called via a base handle.
o	virtual methods: Support dynamic dispatch, executing the derived-class version even through a base-class refeerence

🔄 5. Multi-level Inheritance & super
Inheritance can span multiple class levels. The super keyword lets a derived class explicitly call its immediate parent’s implementation—useful when overriding but still wanting base behavior included .

