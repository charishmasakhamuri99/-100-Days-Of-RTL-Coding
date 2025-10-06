// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module sync_counter_2bit_tb;
    reg clk;
    reg rst_n;
    wire [1:0] q;
    sync_counter_2bit dut (
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst_n = 0;
        #15;
        rst_n = 1;   // Release reset
        #50;         // Let it count several cycles
        $finish;
    end
    initial begin
        $dumpfile("sync_counter_2bit.vcd");
        $dumpvars(0, sync_counter_2bit_tb);
        $monitor("%0t| clk=%b | rst_n=%b | Count=%b (%0d)", $time, clk, rst_n, q, q);
    end
endmodule
