module orr_tb;
  parameter n=8;
  reg [(n-1):0] a,b;
  wire [(n-1):0] y;
  or_gate u1(.a(a),.b(b),.y(y));
  initial begin
    a=8'b1111_0000;b=8'b1010_1010;#10;
    $display("y=%0b",y);
    a=8'b1101_0000;b=8'b1010_1010;#10;
    $display("y=%0b",y);
    a=8'b1001_0000;b=8'b1010_1010;#10;
    $display("y=%0b",y);
  end
endmodule
