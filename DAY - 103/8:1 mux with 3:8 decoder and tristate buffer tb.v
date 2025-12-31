module tb;
  reg [7:0] in;
  reg [2:0] sel;
  wire y;
  mux8to1 u1(in,sel,y);
  initial
    begin
      in='b1010101010;
      $monitor("in=%0b sel=%b y=%b",in,sel,y);
      for(int i=0;i<16;i++) begin
        sel=i;#1;
      end
    end
endmodule
