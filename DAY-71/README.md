Explanation of the SystemVerilog Queue Example
1. What is a SystemVerilog Queue?
A queue in SystemVerilog is a dynamic, ordered collection of elements, similar to an array, but with flexible sizing. Queues are commonly used for modeling FIFO (First In, First Out) structures, temporary storage, or any situation where elements need to be added and removed from both ends.
Key Features:
•	Dynamic size: Automatically expands and contracts as elements are added or removed.
•	Random access: Elements can be accessed by index.
•	Powerful methods: Methods such as push_front, push_back, pop_front, pop_back, insert, delete, and size enable powerful manipulation.
Operations Demonstrated:
•	Initialization:
queue = {10, 20, 30};
Initializes queue to three integer values.
•	Pushing (Adding) Elements:
•	queue.push_back(40); adds 40 at the end (right).
•	queue.push_front(5); adds 5 at the start (left).
•	Popping (Removing) Elements:
•	front = queue.pop_front(); removes the first (leftmost) element and stores it in front.
•	back = queue.pop_back(); removes the last (rightmost) element and stores it in back.
•	Inserting and Deleting:
•	queue.insert(1, 15); inserts 15 at index 1 (second position).
•	queue.delete(2); removes the element at index 2.
 Practical Use Cases
•	Testbenches use queues to drive sequences of data.
•	Bus modeling (e.g., AXI, PCIe FIFOs) often employ queues for in-flight transactions.
•	Scoreboarding in verification environments tracks packet/data order.
 Summary Table: Key Queue Methods Used
Method	Action
push_back(val)	Adds val to the end of the queue
push_front(val)	Adds val to the front of the queue
pop_front()	Removes & returns the first item
pop_back()	Removes & returns the last item
insert(idx, val)	Inserts val at index idx
delete(idx)	Removes the element at index idx
size()	Returns the current length
