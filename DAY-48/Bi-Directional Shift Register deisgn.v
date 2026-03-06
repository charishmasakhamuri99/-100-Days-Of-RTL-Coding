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


module bd #( parameter N=8) (
  input logic in,clk,en,dir,rst,
  output reg [N-1:0] out);
  
  always@(posedge clk or negedge rst) begin
    if(!rst) begin
      out[N-1:0]<='0;
    end
    else if(en) begin
      case(dir)
        
        1'b0: out<={in,out[N-2:0]};//right
        1'b1: out<={out[N-1:1],in};//left
        default: out<= out;
      endcase
      end
  end
endmodule
        
