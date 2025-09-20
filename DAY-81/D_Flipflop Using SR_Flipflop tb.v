// Code your testbench here
// or browse Examples
module tb_d_flipflop_using_sr();
  reg D, clk;
  wire Q, Qbar;
  d_flipflop_using_sr dut (
    .D(D),
    .clk(clk),
    .Q(Q),
    .Qbar(Qbar)
  );

  initial begin
    $monitor("time=%0t | D = %b | clk = %b | Q = %b | Qbar = %b", $time, D, clk, Q, Qbar);
    D = 0; clk = 0;
    #5 D = 1;
    #10 clk = 1;   // rising edge
    #10 clk = 0;
    #10 clk = 1;   // rising edge
    #20 $finish;
  end

  // Simple clock generator (optional, for more cycles)
  // always #5 clk = ~clk;
endmodule
