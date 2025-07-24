// Code your design here
module bitwise_operations (
  input  logic        clk,
  input  logic [6:0]  a,
  input  logic [6:0]  b,
  input  logic [1:0]  op,
  output logic [6:0]  q
);
  always @(posedge clk) begin
    case (op)
      2'b00: q <= a & b;
      2'b01: q <= a | b;
      2'b10: q <= a ^ b;
      2'b11: q <= ~(a | b);  // NOR
      default: q <= 7'b0;
    endcase
  end
endmodule
