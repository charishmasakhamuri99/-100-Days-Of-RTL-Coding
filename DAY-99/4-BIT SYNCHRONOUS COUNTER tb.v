// sync_counter_4bit_tb.v
`timescale 1ns/1ps
module sync_counter_4bit_tb;
  reg clk;
  reg rst_n;
  wire [3:0] q;
  sync_counter_4bit dut (
    .clk(clk),
    .rst_n(rst_n),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("==== Starting Simulation for 4-bit Synchronous Counter ===");
    rst_n = 0;
    $display("[%0t] Reset applied", $time);
    #12;
    rst_n = 1;
    $display("[%0t] Reset released, counter starts", $time);
    #200;
    $display("[%0t] Simulation finished", $time);
    $finish;
  end

  initial begin
    $dumpfile("sync_counter_4bit.vcd");
    $dumpvars(0, sync_counter_4bit_tb);
    $monitor("[%0t] clk=%b | rst_n=%b | Count (bin)=%b | Decimal=%0d",
             $time, clk, rst_n, q, q);
  end
endmodule
