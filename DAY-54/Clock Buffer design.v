module clock_buffer (
  input wire clk_in,
  output wire clk_out
);

  // Simple buffer: passes input to output
  assign clk_out = clk_in;
endmodule
