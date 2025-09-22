module sr_flipflop (
  input S,
  input R,
  input clk,
  input rst,
  output reg Q
);
  always @(posedge clk or posedge rst) begin
    if (rst)
      Q <= 1'b0;
    else begin
      case ({S, R})
        2'b00: Q <= Q;    // No change
        2'b01: Q <= 1'b0; // Reset
        2'b10: Q <= 1'b1; // Set
        2'b11: Q <= 1'bx; // Invalid state, avoid
      endcase
    end
  end
endmodule

module t_flipflop_using_sr(
  input T,
  input clk,
  input rst,
  output Q
);
  wire S, R;
  reg Q_int;

  assign S = T & ~Q_int;
  assign R = T & Q_int;

  sr_flipflop srff (
    .S(S),
    .R(R),
    .clk(clk),
    .rst(rst),
    .Q(Q_int)
  );

  assign Q = Q_int;
endmodule
