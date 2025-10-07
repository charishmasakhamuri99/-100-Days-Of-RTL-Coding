// sync_counter_3bit.v
module sync_counter_3bit (
  input wire clk,
  input wire rst_n,
  output reg [2:0] q
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      q <= 3'b000;      // reset to 0
    else
      q <= q + 1'b1;    // increment count
  end
endmodule
