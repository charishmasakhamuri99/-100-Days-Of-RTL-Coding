module FA_tb;
reg a,b,c;
wire sum,carry;
FA u1(.a(a),.b(b),.c(c),.sum(sum),.carry(carry);
Initial begin
$monitor(“a=%0b,b=%0b,c=%0b,sum=%0b,carry=%0b”,a,b,sum,carry);
a=0;b=0;c=0;
#10;a=0;b=0;c=1;
#10;a=0;b=1;c=0;
#10;a=0;b=1;c=1;
#10;a=1;b=0;c=0;
#10;a=1;b=0;c=1;
#10;a=1;b=1;c=0;
#10;a=1;b=1;c=1;
$finish;
end
endmodule
