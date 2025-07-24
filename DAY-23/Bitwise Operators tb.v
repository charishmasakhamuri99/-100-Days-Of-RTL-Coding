module tb;
  reg         clk = 0;
  reg [6:0]   a = 7'b0101010;
  reg [6:0]   b = 7'b0011001;
  reg [1:0]   op = 2'b00;
  wire [6:0]  q;

  bitwise_operations uut (
    .clk(clk), .a(a), .b(b), .op(op), .q(q)
  );

  // Clock
  always #5 clk = ~clk;

  // Cycle through operations
  initial begin
    repeat (4) begin
      @(posedge clk);
      $display("op=%b: a=%b, b=%b => q=%b", op, a, b, q);
      op = op + 1;
    end
    $finish;
  end
endmodule
