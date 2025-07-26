// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_relational_op;
  reg  [7:0] a, b;
  wire       gt, lt, ge, le;

  // Instantiate the design under test (DUT)
  relational_op dut (
    .a(a),
    .b(b),
    .gt(gt),
    .lt(lt),
    .ge(ge),
    .le(le)
  );

  initial begin
    $display("a    b    gt lt ge le");
    // Test cases
    a = 8'd45; b = 8'd9;   #10 $display("%2d   %2d   %b  %b  %b  %b", a, b, gt, lt, ge, le);
    a = 8'd45; b = 8'd45;  #10 $display("%2d   %2d   %b  %b  %b  %b", a, b, gt, lt, ge, le);
    a = 8'd9;  b = 8'd8;   #10 $display("%2d   %2d   %b  %b  %b  %b", a, b, gt, lt, ge, le);
    a = 8'd8;  b = 8'd9;   #10 $display("%2d   %2d   %b  %b  %b  %b", a, b, gt, lt, ge, le);
    $stop;
  end
endmodule
