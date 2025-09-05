`timescale 1ns/1ps

module tb_reverse_bits;
  logic clk = 0;
  logic reset_n;
  logic [7:0] din;
  logic [7:0] dout;

  // Instantiate the DUT
  reverse_bits_task dut (
    .clk    (clk),
    .reset_n(reset_n),
    .din    (din),
    .dout   (dout)
  );

  // Clock generation: 10 ns period
  always #5 clk = ~clk;

  initial begin
    reset_n = 0; din = 0;
    #12 reset_n = 1;

    foreach (din[i]) begin
      din = i;
      #10; // allow task to run and register to capture
      $display("din=%0b dout=%0b", din, dout);
    end

    $display("Test completed.");
    $finish;
  end
endmodule
