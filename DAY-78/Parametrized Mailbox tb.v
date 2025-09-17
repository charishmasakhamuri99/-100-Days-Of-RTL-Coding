module mailbox_example;

// Declare a parameterized mailbox of type string with bounded size 3
mailbox #(string) mb = new(3);

// Task to put data into the mailbox
task process_A();
  string name;
  begin
    name = "Alice";
    mb.put(name);
    $display("Put data = %s", name);

    name = "Bob";
    mb.put(name);
    $display("Put data = %s", name);

    name = "Carol";
    mb.put(name);
    $display("Put data = %s", name);
  end
endtask

// Task to get data from the mailbox
task process_B();
  string name;
  begin
    mb.get(name);
    $display("Retrieved data = %s", name);

    mb.get(name);
    $display("Retrieved data = %s", name);

    mb.get(name);
    $display("Retrieved data = %s", name);
  end
endtask

// Run both tasks in parallel
initial begin
  fork
    process_A();
    process_B();
  join
  $finish;
end

endmodule
