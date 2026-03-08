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


module grey_to_bin(b,g);
   input [3:0] g;
   output [3:0]b;
  assign b[3] = g[3];
  assign b[2]=b[3]^g[2];
  assign b[1] = b[2] ^ g[1];
  assign b[0] = b[1] ^ g[0];
endmodule 
