// Code your design here
`timescale 1ns/1ps

module mux2to1 (
  input  wire I0,
  input  wire I1,
  input  wire S,
  output wire Y
);
  // Conditional operator selects between I1 and I0
  assign Y = S ? I1 : I0;
endmodule
