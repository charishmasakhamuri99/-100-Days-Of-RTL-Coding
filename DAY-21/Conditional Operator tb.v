// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module mux2to1_tb;
  reg I0, I1, S;
  wire Y;

  // Instantiate the module under test
  mux2to1 uut (
    .I0(I0),
    .I1(I1),
    .S(S),
    .Y(Y)
  );

  initial begin
    $display("Time   S I0 I1 | Y");
    $display("-----------------");

    // test vector sequence
    {S, I0, I1} = 3'b000; #10;
    $display("%4dns:  %b  %b  %b | %b", $time, S, I0, I1, Y);

    {S, I0, I1} = 3'b001; #10;
    $display("%4dns:  %b  %b  %b | %b", $time, S, I0, I1, Y);

    {S, I0, I1} = 3'b100; #10;
    $display("%4dns:  %b  %b  %b | %b", $time, S, I0, I1, Y);

    {S, I0, I1} = 3'b101; #10;
    $display("%4dns:  %b  %b  %b | %b", $time, S, I0, I1, Y);

    $finish;
  end
endmodule
