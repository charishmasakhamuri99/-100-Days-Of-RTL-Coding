// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_d_flipflop_using_jk;
    reg D;
    reg clk;
    reg rst;
    wire Q;

    d_flipflop_using_jk dut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    initial begin
        rst = 1; D = 0;
        #15 rst = 0; // Release reset

        #20 D = 1;
        #20 D = 0;
        #20 D = 1;
        #20 D = 0;
        #20 D = 1;
        #30 $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | D=%b | Q=%b", $time, rst, D, Q);
    end
endmodule
