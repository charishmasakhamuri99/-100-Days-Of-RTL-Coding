module decoder3to8(sel,d);
  input [2:0]sel;
  output [7:0]d;
  assign d=8'b00000001<<sel;
endmodule


module mux8to1(in,sel,y);
  input [7:0]in;
  input [2:0]sel;
  output y;
  wire [7:0]w1;
  decoder3to8 u1(sel,w1);
  
  assign y=w1[0]?in[0]:1'bZ;
  assign y=w1[1]?in[1]:1'bZ;
  assign y=w1[2]?in[2]:1'bZ;
  assign y=w1[3]?in[3]:1'bZ;
  assign y=w1[4]?in[4]:1'bZ;
  assign y=w1[5]?in[5]:1'bZ;
  assign y=w1[6]?in[6]:1'bZ;
  assign y=w1[7]?in[7]:1'bZ;
endmodule
