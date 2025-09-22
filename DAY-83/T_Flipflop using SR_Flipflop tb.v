module tb_t_flipflop_using_sr;
  reg T;
  reg clk;
  reg rst;
  wire Q;

  // Instantiate the T flip-flop module
  t_flipflop_using_sr uut (
    .T(T),
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units period
  end

  initial begin
    // Initialize inputs
    rst = 1; T = 0;
    #15 rst = 0; // Release reset

    // Apply T inputs and check Q toggle on clock edges
    #10 T = 1; // Toggle
    #20 T = 0; // Hold
    #10 T = 1; // Toggle
    #10 T = 1; // Toggle
    #20 T = 0; // Hold
    #30 $finish; // End simulation
  end

  // Optional: monitor signals
  initial begin
    $monitor("At time %t, rst=%b, T=%b, Q=%b", $time, rst, T, Q);
  end
endmodule
