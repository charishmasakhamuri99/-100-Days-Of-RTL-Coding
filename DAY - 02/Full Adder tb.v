module FA_tb;
  reg a,b,c;
  wire sum,carry;
  integer i;
  FA u1(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  initial begin
    $monitor("a=%0b,b=%0b,c=%0b,sum=%0b,carry=%0b",a,b,c,sum,carry);
    for(i=0;i<=7;i=i+1)
    begin
      {a,b,c}=i;
      #10;
    end
    
    $finish;
  end
endmodule
