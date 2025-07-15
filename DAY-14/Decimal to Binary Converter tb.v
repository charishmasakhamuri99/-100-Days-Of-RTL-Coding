`timescale 1ns/1ps
module tb_bcd2bin_direct;
  reg [3:0] bcd1, bcd0;
  wire [6:0] bin;
  integer i;

  bcd2bin_direct dut(.bcd1(bcd1), .bcd0(bcd0), .bin(bin));

  initial begin
    $display("bcd1 bcd0 | bin");
    for (i = 0; i < 100; i = i + 1) begin
      bcd1 = i / 10;
      bcd0 = i % 10;
      #1;
      $display("  %0d    %0d  | %0d", bcd1, bcd0, bin);
    end
    $finish;
  end
endmodule
