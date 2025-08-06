`timescale 1ns/1ps

module tb;
  data_types u1();

  initial begin
    $dumpfile("data_types.vcd");
    $dumpvars(0, tb);
    #1;       // Allow initial module to complete
    $finish;
  end
endmodule
