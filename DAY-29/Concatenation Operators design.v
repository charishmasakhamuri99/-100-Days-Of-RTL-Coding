module concat_example(
  input  wire [1:0] A,
  input  wire [2:0] B,
  input  wire       bit_in,
  output wire [6:0] result
);
  // Concatenate A (2 bits), B (3 bits), bit_in (1 bit), then replicate bit_in twice to make total 7 bits
  assign result = { A, B, bit_in, {2{bit_in}} };
endmodule
