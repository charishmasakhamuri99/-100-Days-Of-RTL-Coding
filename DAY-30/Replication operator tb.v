`timescale 1ns/1ps

module tb_replication_op;
  // Test inputs
  reg [1:0] a;
  reg [2:0] b;
  // Outputs
  wire [7:0] rep_a4;
  wire [7:0] rep_b3;
  wire [9:0] combined;

  // Instantiate the DUT
  replication_op uut (
    .a(a),
    .b(b),
    .rep_a4(rep_a4),
    .rep_b3(rep_b3),
    .combined(combined)
  );

  initial begin
    $display(" time | a   b   | rep_a4     | rep_b3     | combined");
    $display("----------------------------------------------");
    // Test cases
    a = 2'b10; b = 3'b101; #5;
    $display("%4dns | %b %b | %b | %b | %b", $time, a, b, rep_a4, rep_b3, combined);

    a = 2'b11; b = 3'b010; #5;
    $display("%4dns | %b %b | %b | %b | %b", $time, a, b, rep_a4, rep_b3, combined);

    $finish;
  end
endmodule
