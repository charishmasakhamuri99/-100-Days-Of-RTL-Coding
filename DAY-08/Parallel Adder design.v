// 2-bit Parallel Adder
module parallel_adder (
  input  [1:0] a,
  input  [1:0] b,
  output [2:0] c
);
  assign c = a + b;
endmodule
