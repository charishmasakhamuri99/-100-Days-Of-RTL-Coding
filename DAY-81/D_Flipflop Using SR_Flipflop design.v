// Code your design here
module sr_flipflop(
  input S,
  input R,
  input clk,
  output reg Q,
  output reg Qbar
);
  always @(posedge clk) begin
    case ({S, R})
      2'b01: begin Q = 0; Qbar = 1; end
      2'b10: begin Q = 1; Qbar = 0; end
      2'b00: ; // hold state
      default: begin Q = 1'bx; Qbar = 1'bx; end // invalid (S=R=1)
    endcase
  end
endmodule

module d_flipflop_using_sr(
  input D,
  input clk,
  output Q,
  output Qbar
);
  wire S, R;
  assign S = D;
  assign R = ~D;
  sr_flipflop sr1(
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q),
    .Qbar(Qbar)
  );
endmodule
