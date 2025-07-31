module replication_op (
  input  wire [1:0] a,
  input  wire [2:0] b,
  output wire [7:0] rep_a4,
  output wire [7:0] rep_b3,
  output wire [9:0] combined
);
  assign rep_a4    = {4{a}};         // replicate 'a' four times: 2 × 4 = 8 bits
  assign rep_b3    = {3{b}};         // replicate 'b' three times: 3 × 3 = 9 bits (but truncated to 8)
  assign combined  = { {3{a}}, {2{b}} }; // 3×2 bits + 2×3 bits = 6+6 = 12-bit vector; here using only lower 10 bits
endmodule
