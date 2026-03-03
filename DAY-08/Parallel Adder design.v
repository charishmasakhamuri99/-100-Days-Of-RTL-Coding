// 2-bit Parallel Adder
module parallel_adder (
  input  [1:0] a,
  input  [1:0] b,
  output [2:0] c
);
  assign c = a + b;
endmodule

module fa(
  input a,
  input b,
  input cin,
  output sum,
  output ca
);
  assign sum=a^b^cin;
  assign ca=((a&b)|(b&cin)|(cin&a)) ;
endmodule

module pa(
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [3:0] s,
  output carry
);
  wire c1,c2,c3;
  fa f1(a[0],b[0],cin,s[0],c1);
  fa f2(a[1],b[1],c1,s[1],c2);
  fa f3(a[2],b[2],c2,s[2],c3);
  fa f4(a[3],b[3],c3,s[3],carry);
endmodule
