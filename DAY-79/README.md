A semaphore in SystemVerilog is a synchronization primitive used to control access to shared resources among multiple parallel processes or threads. It helps prevent race conditions and ensures mutual exclusion (mutex) or coordinated access by maintaining a fixed number of "keys" or permits.
Key Concepts:
1.	Semaphore Keys (Count):
•	A semaphore is initialized with a certain number of keys (or units). For example, new(1) means the semaphore has one key, allowing only one process to access the critical section at a time (binary semaphore).
•	If initialized with a number greater than 1, several processes can concurrently hold keys, useful for controlling access to limited identical resources.
2.	Acquire and Release Operations (get and put):
•	get(num_keys): Attempts to acquire the specified number of keys (units). If enough keys are available, it decrements the semaphore count by that number and allows the process to continue.
•	If keys are not available, the process blocks (waits) until keys are released by other processes. This ensures synchronization and mutual exclusion.
•	put(num_keys): Releases the specified number of keys back to the semaphore, increasing the count and potentially unblocking waiting processes.
3.	Blocking Behavior:
The get() method blocks when the desired keys are unavailable, preventing concurrent access beyond the permitted limit. This effectively serializes access when the semaphore count is 1 (binary semaphore).
4.	Mutual Exclusion Example:
When initialized with one key (new(1)), the semaphore acts as a mutex ensuring:
•	Only one process enters the critical section at a time.
•	Other processes trying to acquire the semaphore must wait (block).
•	When the process finishes, it releases the key, enabling another waiting process to proceed.





