module fixed_pri_arbiter #(
  parameter N = 8
)(
  input wire [N-1:0] req,
  output wire [N-1:0] grant
);

  wire [N-1:0] higher;
  assign higher = 1'b0;
  genvar i;
  generate
    for (i = 0; i < N-1; i = i + 1) begin
      assign higher[i+1] = higher[i] | req[i];
    end
  endgenerate

  // Grant only the highest-priority (first '1' from LSB)
  assign grant = req & ~higher;
endmodule
