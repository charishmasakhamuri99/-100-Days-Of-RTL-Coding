// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module siso_tb;
  reg clk;
  reg rst_n;
  reg din;
  wire dout;

  siso dut (
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
    rst_n = 0;
    din = 0;
    #12;
    rst_n = 1;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 0; #10;
    $finish;
  end

  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, siso_tb);
  end

  initial begin
    $monitor($time, " din=%b dout=%b shift_reg=%b", din, dout, dut.shift_reg);
  end
endmodule
