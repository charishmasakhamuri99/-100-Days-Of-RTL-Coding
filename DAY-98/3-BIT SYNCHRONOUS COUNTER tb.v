`timescale 1ns/1ps
module sync_counter_3bit_tb;
  reg clk;
  reg rst_n;
  wire [2:0] q;
  sync_counter_3bit dut (
    .clk(clk),
    .rst_n(rst_n),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("=== Starting Simulation for 3-bit Synchronous Counter ===");
    rst_n = 0; // apply reset
    $display("[%0t] Reset applied", $time);
    #12;
    rst_n = 1; // release reset
    $display("[%0t] Reset released, counter starts", $time);
    #100; // simulate more clock cycles
    $display("[%0t] Simulation finished", $time);
    $finish;
  end

  // Live monitor
  initial begin
    $dumpfile("sync_counter_3bit.vcd");
    $dumpvars(0, sync_counter_3bit_tb);
    $monitor("[%0t] clk=%b | rst_n=%b | Count Binary=%b | Decimal=%0d",
      $time, clk, rst_n, q, q);
  end
endmodule
