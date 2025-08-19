`timescale 1ns/1ps
module tb_seq_detector_1010;
  logic clk = 0;
  logic rst_n = 0;
  logic x;
  wire z;

  seq_detector_1010 uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // 100 MHz clock
  always #5 clk = ~clk;

  initial begin
    // waveform dump
    $dumpfile("tb.vcd");
    $dumpvars(0);
    rst_n = 0; #10;
    rst_n = 1;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 0; #10; // 1st detection: z=1
    x = 1; #10;
    x = 0; #10; // 2nd detection
    $finish;
  end

  initial begin
    $display("time clk rst_n x | z");
    $monitor("%0t %b %b %b | %b", $time, clk, rst_n, x, z);
  end
endmodule
