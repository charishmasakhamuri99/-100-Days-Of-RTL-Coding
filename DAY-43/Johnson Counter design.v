module johnson_counter(
  out,
  reset,
  clk
);
  input clk, reset;
  output [3:0] out;

  reg [3:0] q;

  always @(posedge clk) begin
    if (reset)
      q = 4'd0;
    else begin
      q[3] <= q[2];
      q[2] <= q[1];
      q[1] <= q[0];
      q[0] <= (~q[3]);
    end
  end

  assign out = q;
endmodule


module ring(
  input rst,clk,
  output reg [3:0] out
);
  
  always@(posedge clk or negedge rst) begin
    if(rst) begin
      out[3:0]=4'b0001;
    end
      else begin
        out[3]<=out[2];
        out[2]<=out[1];
        out[1]<=out[0];
        out[0]<=(out[3]);
      end
  end
endmodule
