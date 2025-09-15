A mailbox in SystemVerilog is a thread-safe communication mechanism used for data exchange between parallel processes or components, especially in testbenches for verification. It acts like a queue (FIFO - first-in, first-out), allowing one process (the producer) to put data into the mailbox and another process (the consumer) to retrieve data from it.
Core Concepts
•	Synchronization: Mailboxes ensure synchronized data transfer. This means when a process tries to get data from an empty mailbox, it waits (blocks) until data is available. Similarly, if a process tries to put data into a full (bounded) mailbox, it waits until space is available.
•	Unbounded vs. Bounded:
•	Unbounded mailbox: No limit to how many items it can hold. mailbox mbx = new();
•	Bounded mailbox: Has a fixed storage capacity. If full, any further put() calls will block. mailbox mbx = new(5); means only 5 items can be stored at a time.


Main Methods
•	put(item): Place an item in the mailbox. Blocks if the mailbox is full (for bounded mailboxes).
•	get(var): Retrieves and removes the next item. Blocks if empty.
•	try_put(item) / try_get(var): Non-blocking versions of put/get, returning success/failure status instead of waiting.
•	peek(var) / try_peek(var): Look at the next item without removing it.
•	num(): Returns the number of messages currently in the mailbox.
Summary
A mailbox provides a simple yet robust way to synchronize and safely exchange data between independent processes running in parallel, making it essential for reliable testbench design



