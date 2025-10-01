`timescale 1ns/1ps

module siso_jk_tb;
    reg clk, rst_n, din;
    wire dout;

    siso_jk dut (
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        din = 0;
        #12;
        rst_n = 1;
        din = 0; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        $finish;
    end

    initial begin
        $dumpfile("siso_jk.vcd");
        $dumpvars(0, siso_jk_tb);
    end

    initial begin
        $monitor($time, " din=%b dout=%b", din, dout);
    end
endmodule
