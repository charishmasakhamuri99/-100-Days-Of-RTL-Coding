// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module ripple_down_counter_5bit_tb;
reg clk, rst_n;
wire [4:0] q;
ripple_down_counter_5bit uut (
    .clk(clk),
    .rst_n(rst_n),
    .q(q)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $display("==== Starting Simulation for 5-bit Ripple Down Counter ===");
    rst_n = 0;
    $display("[%0t] Applying reset...", $time);
    #25;
    rst_n = 1;
    $display("[%0t] Releasing reset, counter starts counting down...", $time);
    #500;
    $display("[%0t] Simulation finished.", $time);
    $finish;
end

initial begin
    $dumpfile("ripple_down_counter_5bit.vcd");
    $dumpvars(0, ripple_down_counter_5bit_tb);
    $monitor("[%0t] clk=%b rst_n=%b | Count Binary=%b | Decimal=%0d",
        $time, clk, rst_n, q, q);
end

endmodule
