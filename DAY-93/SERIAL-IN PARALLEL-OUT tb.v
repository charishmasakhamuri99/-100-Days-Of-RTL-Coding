// Code your testbench here
// or browse Examples
//sipo_tb.v
`timescale 1ns/1ps

module sipo_tb;
  reg clk;
  reg rst_n;
  reg din;
  wire [3:0] dout;

  sipo dut (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .dout(dout)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst_n = 0; din = 0;
    #12;                // wait some time with reset active
    rst_n = 1;          // release reset
    din = 1; #10;       // 1
    din = 0; #10;       // 0
    din = 1; #10;       // 1
    din = 1; #10;       // 1
    #20;                // wait some cycles
    $finish;
  end

  initial begin
    $dumpfile("sipo.vcd");
    $dumpvars(0, sipo_tb);
    $monitor("time=%0t | din=%b | dout=%b ", $time, din, dout);
  end
endmodule
