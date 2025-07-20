`timescale 1ns/1ps
module tb_gray2bin;
  parameter N = 4;
  reg  [N-1:0] gray;
  wire [N-1:0] binary;

  // Instantiate converter
  gray2bin #(.N(N)) uut (
    .gray  (gray),
    .binary(binary)
  );

  integer i;
  initial begin
    gray = 0;
    for (i = 0; i < (1 << N); i = i + 1) begin
      #5 gray = i;
    end
  end

  initial begin
    $display("time\tgray\tbinary");
    $monitor("%0dns\t%b\t%b", $time, gray, binary);
  end

  initial #((1 << N)*5 + 10) $finish;
endmodule
