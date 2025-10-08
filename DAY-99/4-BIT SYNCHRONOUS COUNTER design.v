// sync_counter_4bit.v
module sync_counter_4bit (
  input wire clk,
  input wire rst_n,
  output reg [3:0] q
);
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      q <= 4'b0000;      // Reset to 0
    else
      q <= q + 1'b1;     // Increment counter
  end
endmodule
