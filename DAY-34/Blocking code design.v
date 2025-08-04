module blocking (
  output reg a, b, c
);
  initial begin
    a = 1;
    b = a;      // uses updated 'a'
    c = b;      // uses updated 'b'
    $display("blocking: a=%0d, b=%0d, c=%0d", a, b, c);
  end
endmodule
