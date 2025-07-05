module FS_tb;
  reg a,b,c;
  wire diff,borrow;
  integer i;
  FS u1(.a(a),.b(b),.c(c),.diff(diff),.borrow(borrow));
  initial begin
    $monitor("a=%0b,b=%0b,c=%0b,diff=%0b,borrow=%0b",a,b,c,diff,borrow);
    for(i=0;i<=7;i=i+1)
    begin
      {a,b,c}=i;
      #10;
    end
    
    $finish;
  end
endmodule
