// ripple_counter_5bit_tb.v
`timescale 1ns/1ps
module ripple_counter_5bit_tb;
  reg clk;
  reg rst_n;
  wire [4:0] q;

  ripple_counter_5bit uut (
    .clk(clk),
    .rst_n(rst_n),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // stimulus
  initial begin
    $display("=== Starting Simulation for 5-bit Ripple Counter ===");
    rst_n = 0;
    $display("[%0t] Applying reset...", $time);
    #25;
    rst_n = 1;
    $display("[%0t] Releasing reset, counter starts counting...", $time);
    #500;
    $display("[%0t] Simulation finished.", $time);
    $finish;
  end

  // Continuous monitor
  initial begin
    $dumpfile("ripple_counter_5bit.vcd");
    $dumpvars(0, ripple_counter_5bit_tb);
    $monitor("[%0t] clk=%b | rst_n=%b | Count Binary=%b | Decimal=%0d",
              $time, clk, rst_n, q, q);
  end
endmodule
