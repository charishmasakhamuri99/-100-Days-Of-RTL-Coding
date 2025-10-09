// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module mod12_counter_tb;
  reg clk;
  reg rst_n;
  wire [3:0] count;

  mod12_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .count(count)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    // Apply reset
    rst_n = 0;
    #12;
    rst_n = 1;
    #150;
    $finish;
  end

  initial begin
    $dumpfile("mod12_counter.vcd");
    $dumpvars(0, mod12_counter_tb);
    $monitor("[%0t] Count = %d (bin %b)", $time, count, count);
  end
endmodule
