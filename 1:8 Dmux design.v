module demux_1_to_8_case (
    input  wire        i,
    input  wire [2:0]  sel,
    output reg  [7:0]  out
);
  always @(*) begin
    out = 8'b0;
    case (sel)
      3'b000: out[0] = i;
      3'b001: out[1] = i;
      3'b010: out[2] = i;
      3'b011: out[3] = i;
      3'b100: out[4] = i;
      3'b101: out[5] = i;
      3'b110: out[6] = i;
      3'b111: out[7] = i;
    endcase
  end
endmodule
