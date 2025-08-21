// Left Side: Testbench

`timescale 1ns / 1ps
module gcd_fsm_tb;
    reg clk, rst, start;
    reg [7:0] a_in, b_in;
    wire [7:0] gcd;
    wire done;

    gcd_fsm dut(.clk(clk), .rst(rst), .start(start), .a_in(a_in), .b_in(b_in), .gcd(gcd), .done(done));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("gcd.vcd"); $dumpvars(0, gcd_fsm_tb);
        clk = 0; rst = 1; start = 0; #10; rst = 0;

        // Test 1
        a_in = 56; b_in = 98; start = 1; #10; start = 0;
        wait (done); $display("GCD(56,98) = %d", gcd); #20;

        // Test 2
        a_in = 100; b_in = 80; start = 1; #10; start = 0;
        wait (done); $display("GCD(100,80) = %d", gcd); #20;

        // Test 3
        a_in = 27; b_in = 9; start = 1; #10; start = 0;
        wait (done); $display("GCD(27,9) = %d", gcd); #20;

        $finish;
    end
endmodule
