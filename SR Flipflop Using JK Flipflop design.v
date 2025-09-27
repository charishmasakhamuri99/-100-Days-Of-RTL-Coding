module JK_FF(
  input clk,        // Active low synchronous reset
  input rst_n,
  input J,
  input K,
  output reg Q
);

  always @(posedge clk) begin
    if (!rst_n)
      Q <= 1'b0;
    else begin
      case ({J, K})
        2'b00: Q <= Q;      // No change
        2'b01: Q <= 1'b0;   // Reset
        2'b10: Q <= 1'b1;   // Set
        2'b11: Q <= ~Q;     // Toggle
      endcase
    end
  end
endmodule

module SR_FF_using_JK(
  input clk,
  input rst_n,
  input S,
  input R,
  output Q
);
  wire Q_int;

  // Direct mapping from SR to JK inputs
  JK_FF jkff (
    .clk(clk),
    .rst_n(rst_n),
    .J(S),
    .K(R),
    .Q(Q_int)
  );

  assign Q = Q_int;
endmodule
