`timescale 1ns/1ps
module pipo_tb;
    reg clk;
    reg rst_n;
    reg load;
    reg [3:0] data_in;
    wire [3:0] data_out;

    pipo dut(
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0; load = 0; data_in = 4'b0000;
        #15;      // wait 15ns
        rst_n = 1; // release reset
        #10;
        data_in = 4'b1010;
        load = 1; #10;
        load = 0; #20;
        data_in = 4'b1100;
        load = 1; #10;
        load = 0; #20;
    end

    initial begin
        $dumpfile("pipo.vcd");
        $dumpvars(0, pipo_tb);
        $monitor("time=%0t | load=%b | data_in=%b | data_out=%b",
                 $time, load, data_in, data_out);
    end
endmodule
