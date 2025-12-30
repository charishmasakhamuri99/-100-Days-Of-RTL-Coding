module full_adder_n #(parameter N = 8) (
    input  [N-1:0] a,
    input  [N-1:0] b,
    input          cin,
    output [N-1:0] sum,
    output         cout
);

  wire [N:0] carry;
  assign carry[0] = cin;
  assign cout     = carry[N];

  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : fa_loop
      // sum bit
      assign sum[i] = a[i] ^ b[i] ^ carry[i];

      // carry out
      assign carry[i+1] = (a[i] & b[i]) | (b[i] & carry[i]) | (a[i] & carry[i]);
    end
  endgenerate

endmodule
