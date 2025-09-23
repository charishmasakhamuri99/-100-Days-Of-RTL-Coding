// testbench.sv
`timescale 1ns/1ps
module tb_t_flipflop_using_sr;
  reg T;
  reg clk;
  reg rst;
  wire Q;

  t_flipflop_using_sr uut (
    .T(T),
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1; T = 0;
    #15 rst = 0;

    #10 T = 1;
    #20 T = 0;
    #20 T = 1;
    #20 T = 0;
    #20 T = 1;
    #20 T = 0;

    #30 $finish;
  end

  initial begin
    $monitor("Time=%0t | rst=%b | T=%b | Q=%b", $time, rst, T, Q);
  end
endmodule
