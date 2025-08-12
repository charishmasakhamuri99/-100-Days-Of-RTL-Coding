`timescale 1ns / 1ps

module slicer_tb;
  reg [31:0] data_in;
  reg [1:0]  index;
  wire [7:0] byte_out;

  slicer DUT (
    .data_in(data_in),
    .index(index),
    .byte_out(byte_out)
  );

  integer i;
  reg [7:0] expected;

  initial begin
    data_in = 32'hDEADBEEF;
    $display("Stimulus: data_in = %h", data_in);
    for (i = 0; i < 4; i = i + 1) begin
      index = i;
      #5;
      expected = data_in[8*i +: 8];
      $display("index=%0d => byte_out=%02h (expected %02h)", i, byte_out, expected);
      if (byte_out !== expected) begin
        $error("Mismatch: index %0d, got %02h, expected %02h", i, byte_out, expected);
      end
    end
    $display("All checks passed.");
    #5 $finish;
  end
endmodule
