module mailbox_example;
  mailbox mbx = new();
  task automatic producer();
    int msg;
    repeat (5) begin
      msg = $urandom_range(100, 200);
      mbx.put(msg);
      $display("[%0t] Producer put: %0d", $time, msg);
      #10; // Simulate some delay
    end
  endtask
  task automatic consumer();
    int msg;
    repeat (5) begin
      mbx.get(msg);
      $display("[%0t] Consumer got: %0d", $time, msg);
      #15; // Simulate some delay
    end
  endtask
  initial begin
    fork
      producer();
      consumer();
    join
    $finish;
  end
endmodule
