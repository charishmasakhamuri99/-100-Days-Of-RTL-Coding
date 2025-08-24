`timescale 1ns/1ps

module tb_clock_buffer;
  reg clk_in;
  wire clk_out;

  // Instantiate the clock buffer
  clock_buffer uut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  // Clock generator: toggle every 5 ns = 100 MHz clock
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;
  end

  // Monitor and display the buffer behavior
  initial begin
    $display("Time(ns)\tclk_in\tclk_out");
    $monitor("%0t\t%b\t%b", $time, clk_in, clk_out);
    #50; // Run for enough cycles
    $finish;
  end
endmodule
