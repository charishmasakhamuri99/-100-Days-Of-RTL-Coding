module testbench;
  // Declare the queue of integers
  int queue[$];

  // Temporary variables to hold values popped from queue
  int front, back;

  initial begin
    // Initialize the queue with values
    queue = {10, 20, 30};
    $display("Initial queue: %p", queue);

    // Push elements to the back/front
    queue.push_back(40);   // queue: {10, 20, 30, 40}
    queue.push_front(5);   // queue: {5, 10, 20, 30, 40}
    $display("After push operations: %p", queue);

    // Pop elements from the front/back and assign to declared variables
    front = queue.pop_front();  // front = 5, queue: {10, 20, 30, 40}
    back = queue.pop_back();    // back = 40, queue: {10, 20, 30}
    $display("After pop operations: %p", queue);
    $display("Front: %0d, Back: %0d", front, back);

    // Insert at index 1
    queue.insert(1, 15);        // queue: {10, 15, 20, 30}
    $display("After insert: %p", queue);

    // Remove element at index 2
    queue.delete(2);            // queue: {10, 15, 30}
    $display("After delete: %p", queue);

    // Queue size
    $display("Queue size: %0d", queue.size());

    $finish;
  end
endmodule
