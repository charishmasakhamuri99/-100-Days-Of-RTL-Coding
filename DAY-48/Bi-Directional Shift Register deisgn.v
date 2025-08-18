module shift_reg #(parameter MSB = 8) (
  input  logic d,
  input  logic clk,
  input  logic en,
  input  logic dir,
  input  logic rstn,
  output logic [MSB-1:0] out
);

  always_ff @(posedge clk) begin
    if (!rstn)
      out <= '0;
    else if (en) begin
      if (dir == 0)
        out <= {out[MSB-2:0], d};
      else
        out <= {d, out[MSB-1:1]};
    end
  end
endmodule
