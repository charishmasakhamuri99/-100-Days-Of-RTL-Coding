// Code your design here
// siso.v
module siso (
  input wire clk,
  input wire rst_n,      // active low reset
  input wire din,        // serial data input
  output wire dout       // serial data output
);

  reg [7:0] shift_reg;

  assign dout = shift_reg[7];

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      shift_reg <= 8'b0;
    else
      shift_reg <= {shift_reg[6:0], din};
  end
endmodule
