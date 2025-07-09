`timescale 1ns/1ps
module tb_parallel_adder;
  reg [1:0] a, b;
  wire [2:0] c;

  // Instantiate the design
  parallel_adder uut (
    .a(a),
    .b(b),
    .c(c)
  );

  // Generate VCD file for waveform
  initial begin
    $dumpfile("parallel_adder.vcd"); // VCD output file
    $dumpvars(0, tb_parallel_adder); // Dump all variables in this module
  end

  // Apply test inputs
  initial begin
    $display("Time\t a\t b\t c");
    $monitor("%0t\t %b\t %b\t %b", $time, a, b, c);

    a = 2'b00; b = 2'b00; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b11; b = 2'b11; #10;

    $finish;
  end
endmodule
