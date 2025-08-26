`timescale 1ns/1ps

module tb_priority_encoder;
  reg  [7:0] D;
  wire [2:0] Y;

  // Instantiate DUT
  priority_encoder uut (
    .D(D),
    .Y(Y)
  );

  initial begin
    $display("Time\tD -> Y");
    $monitor("%0dns\t%b -> %b", $time, D, Y);

    // Test patterns
    D = 8'b00000000; #10;
    D = 8'b00000001; #10;
    D = 8'b00000010; #10; // multiple bits, expect MSB of {D2,D0}=2 -> Y=010
    D = 8'b00001000; #10; // D3 high -> Y=011
    D = 8'b00100000; #10; // D5 high -> Y=101
    D = 8'b01000000; #10; // D6 high -> Y=110
    D = 8'b10000000; #10; // D7 high -> Y=111
    $finish;
  end
endmodule
