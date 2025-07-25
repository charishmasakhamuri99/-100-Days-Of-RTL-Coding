module logical_ops(
  input  wire [7:0] in1,
  input  wire [7:0] in2,
  output wire       y_and,
  output wire       y_or,
  output wire       y_not1,
  output wire       y_logic
);
  assign y_and   = in1 && in2;
  assign y_or    = in1 || in2;
  assign y_not1  = !in1;
  // example: (in1 equals in2) AND in1!=0 OR in2 non-zero
  assign y_logic = ((in1 == in2) && (in1 != 0)) || (in2 != 0);
endmodule

