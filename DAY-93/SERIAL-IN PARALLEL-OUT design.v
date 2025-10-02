//sipo.v
module sipo (
  input wire clk,        // active low reset
  input wire rst_n,
  input wire din,        // serial data input
  output reg [3:0] dout  // parallel data output
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      dout <= 4'b0000;
    else
      dout <= {dout[2:0], din};
  end

endmodule
