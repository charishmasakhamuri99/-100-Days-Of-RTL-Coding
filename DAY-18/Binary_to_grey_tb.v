module tb;
  reg[3:0] b;
  wire[3:0] g;
  binary_to_gray u1(.b(b),.g(g));
  initial begin
    b = 4'b1010; #10;
    b = 4'b0111; #10;
    b = 4'b0010; #10; 
    b = 4'b0011; #10;
  end
  initial begin
    $monitor("b=%b,g=%b",b,g);
  end
endmodule
