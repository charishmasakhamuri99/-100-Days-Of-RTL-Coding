module HS_tb;
  reg a,b;
  wire c,s;
  HS u1(.a(a),.b(b),.c(c),.s(s));
   initial begin
     $monitor("time=%0t,a=%0b,b=%0b,c=%0b,s=%0b",$time,a,b,c,s);
     a=0;b=0;#10;
     a=0;b=1;#10;
     a=1;b=0;#10;
     a=1;b=1;#10;
     a=1;b=1;#10;
     $finish;
   end
endmodule
