// Code your design here
module gray2bin #(
  parameter N = 4
) (
  input  wire [N-1:0] gray,
  output wire [N-1:0] binary
);
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : gen_convert
      // Each output bit is XOR of all gray bits from MSB down to that bit
      assign binary[i] = ^( gray[N-1:i] );
    end
  endgenerate
endmodule
