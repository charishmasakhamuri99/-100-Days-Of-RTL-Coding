module priority_encoder (
  input  [7:0] D,
  output reg [2:0] Y
);

always @(*) begin
  casez (D)
    8'b1xxx_xxxx: Y = 3'b111; // D7 has highest priority
    8'b01xx_xxxx: Y = 3'b110; // then D6
    8'b001x_xxxx: Y = 3'b101; // D5
    8'b0001_xxxx: Y = 3'b100; // D4
    8'b0000_1xxx: Y = 3'b011; // D3
    8'b0000_01xx: Y = 3'b010; // D2
    8'b0000_001x: Y = 3'b001; // D1
    8'b0000_0001: Y = 3'b000; // D0
    default:      Y = 3'bxxx; // no input or undefined
  endcase
end

endmodule
