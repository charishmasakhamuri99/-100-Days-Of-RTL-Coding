module parity_gen_4bit (
    input  wire [3:0] d,  // 4-bit data input
    output wire       p   // parity output
);

    assign p = d[0] ^ d[1] ^ d ^ d;

endmodule

module pg(
  input [3:0] in,
  output y
);
  assign y=~(^in);
endmodule
//converting even to odd parity
