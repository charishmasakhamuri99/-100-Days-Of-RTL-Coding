module fixed_pri_arbiter #(
  parameter N = 8
)(
  input wire [N-1:0] req,
  output wire [N-1:0] grant
);
  wire [N-1:0] higher;
  assign higher[0] = 1'b0;
  genvar i;
  generate
    for (i = 0; i < N-1; i = i + 1) begin
      assign higher[i+1] = higher[i] | req[i];
    end
  endgenerate
  assign grant = req & ~higher;
endmodule

module round_robin_arbiter #(
  parameter N = 8
)(
  input wire clk,
  input wire rst_n,
  input wire [N-1:0] req,
  output wire [N-1:0] grant
);
  reg [N-1:0] mask, mask_next;
  wire [N-1:0] masked_req, grant_unmasked, grant_masked;
  assign masked_req = req & mask;
  fixed_pri_arbiter #(N) arb0(.req(req),      .grant(grant_unmasked));
  fixed_pri_arbiter #(N) arb1(.req(masked_req), .grant(grant_masked));
  assign grant = (masked_req == 0) ? grant_unmasked : grant_masked;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      mask <= {N{1'b1}};
    else
      mask <= mask_next;
  end

  always @(*) begin
    if (grant == 0)
      mask_next = mask;
    else begin
      mask_next = {N{1'b1}};
      integer i;
      for (i = 0; i < N; i = i + 1) begin
        if (grant[i]) begin
          mask_next[i] = 1'b0;
          break;
        end
      end
    end
  end
endmodule
