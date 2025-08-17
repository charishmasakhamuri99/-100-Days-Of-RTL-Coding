module n_bit_comparator #(parameter N = 4) (
  input [N-1:0] A,      // N-bit input A
  input [N-1:0] B,      // N-bit input B
  output A_gt_B,        // Output if A > B
  output A_lt_B,        // Output if A < B
  output A_eq_B         // Output if A == B
);

  wire [N-1:0] equal;
  wire [N-1:0] greater;

  assign equal = (A == B) ? 1'b1 : 1'b0;
  assign greater = (A > B) ? 1'b1 : 1'b0;

  assign A_eq_B = (equal == 1);
  assign A_gt_B = (greater == 1);
  assign A_lt_B = ~A_gt_B & ~A_eq_B;

endmodule
