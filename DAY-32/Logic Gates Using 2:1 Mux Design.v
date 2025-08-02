module l_g(a, b, sel, y);
  input a, b;
  input sel;
  output reg y;

  always @(*) begin
    case (sel)
      3'b000: y = a & b;
      3'b001: y = a | b;
      3'b010: y = a ^ b;
      3'b011: y = ~(a & b);
      3'b100: y = ~(a ^ b);
      3'b101: y = ~a;
      3'b110: y = a;
      default: y = 1'b0;
    endcase
  end
endmodule
