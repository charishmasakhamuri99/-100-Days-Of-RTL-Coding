module slicer (
  input wire [31:0] data_in,
  input wire [1:0]  index,     // selects which byte: 0..3
  output reg [7:0]  byte_out
);
  always @* begin
    byte_out = data_in[8*index +: 8];  // dynamic part-select
  end
endmodule
