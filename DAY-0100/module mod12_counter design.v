module mod12_counter (
  input wire clk,
  input wire rst_n,        // active low reset
  output reg [3:0] count
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      count <= 4'b0000;
    else if (count == 4'd11)
      count <= 4'b0000;
    else
      count <= count + 4'b0001;
  end
endmodule
  
