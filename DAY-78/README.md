•	Mailbox Basics: A mailbox is a built-in SystemVerilog mechanism used to pass messages or data items safely between concurrently running processes or threads, typically in testbenches. It acts internally like a FIFO queue where one process puts data and another gets it.
•	Parameterized Mailbox: Using mailbox #(type) declares a mailbox that accepts only data of a specific type, enhancing type safety and clarity. For example, mailbox #(string) only holds strings, and mailbox #(transaction) only holds transaction objects.
•	Bounded vs. Unbounded: The mailbox can be bounded (with fixed size, e.g., new(3)) or unbounded (no size limit, new()). In bounded mailboxes, a put() blocks if the mailbox is full; in unbounded, put() never blocks due to space.
•	Synchronization and Blocking Behavior:
•	The put() method blocks if the mailbox is full (only for bounded mailboxes) until space is freed.
•	The get() method blocks if the mailbox is empty until data arrives.
This blocking ensures automatic synchronization between producer and consumer without additional signaling.
•	Parallel Execution with fork-join: The producer (putting data) and consumer (getting data) run concurrently using fork...join, allowing seamless data exchange in simulation.
