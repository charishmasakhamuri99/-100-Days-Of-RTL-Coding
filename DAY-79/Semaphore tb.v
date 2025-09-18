module semaphore_example;

// Declare a semaphore handle
semaphore sema;

// Initialize semaphore with 1 key (binary semaphore for mutual exclusion)
initial begin
    sema = new(1);
end

// Task simulating a process using the shared resource
task automatic process_task(string name);
    begin
        $display("[%0t] %s: Waiting to get the semaphore key", $time, name);
        sema.get(1);  // Acquire 1 key; blocks if not available
        $display("[%0t] %s: Got the semaphore key, entering critical section", $time, name);

        // Simulate work in critical section
        #10;

        $display("[%0t] %s: Releasing semaphore key", $time, name);
        sema.put(1);  // Release the key back to semaphore

        $display("[%0t] %s: Exited critical section", $time, name);
    end
endtask

// Run two processes in parallel competing for the semaphore
initial begin
    fork
        process_task("Process A");
        process_task("Process B");
    join

    $finish;
end
endmodule
