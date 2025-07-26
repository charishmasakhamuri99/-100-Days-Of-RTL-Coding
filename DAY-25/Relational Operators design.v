// Code your design here
module relational_op (
  input  [7:0] a,
  input  [7:0] b,
  output        gt,  // a > b
  output        lt,  // a < b
  output        ge,  // a >= b
  output        le   // a <= b
);
  assign gt = (a > b);
  assign lt = (a < b);
  assign ge = (a >= b);
  assign le = (a <= b);
endmodule
