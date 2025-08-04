`timescale 1ns/1ps

module blocking_tb;
  wire a, b, c;

  // Instantiate the design under test
  blocking uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    $dumpfile("blocking.vcd");
    $dumpvars(0, blocking_tb);
    #1;  // let initial settle
    $finish;
  end
endmodule
