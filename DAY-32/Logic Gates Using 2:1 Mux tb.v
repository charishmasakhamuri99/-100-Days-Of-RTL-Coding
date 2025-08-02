module tb;
  reg a, b;
  reg [2:0] sel;
  wire y;

  l_g uut(.y(y), .a(a), .b(b), .sel(sel));

  initial begin
    a = 1; b = 0;
    sel = 3'b000; #10;
    $display("AND: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

    sel = 3'b001; #10;
    $display("OR:  a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

    sel = 3'b010; #10;
    $display("XOR: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

    sel = 3'b100; #10;
    $display("NAND:a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

    sel = 3'b101; #10;
    $display("XNOR:a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

    sel = 3'b110; #10;
    $display("NOT: a=%b, sel=%b, y=%b", a, sel, y);

    sel = 3'b111; #10;
    $display("BUFFER: a=%b, sel=%b, y=%b", a, sel, y);
  end
endmodule
