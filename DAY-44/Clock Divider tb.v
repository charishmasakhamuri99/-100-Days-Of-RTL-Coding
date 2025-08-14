`timescale 1ns/1ps

module tb_clock_divider_limit;
    reg clk_in = 0, reset = 1;
    wire clk_out, done;

    localparam DIV = 4, LIMIT = 5;
    clock_divider_limit #( .DIV(DIV), .LIMIT(LIMIT)) 
        uut(.clk_in(clk_in), .reset(reset), .clk_out(clk_out), .done(done));

    // Generate clk_in: 100 MHz (10 ns period)
    always #5 clk_in = ~clk_in;

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb_clock_divider_limit);
        #20 reset = 0;     // release reset
        #500 $finish;
    end

    initial begin
        $display("Time\tclk_in\tclk_out\tpulses_done");
        $monitor("%0dns\t%b\t%b\t%b", $time, clk_in, clk_out, done);
    end
endmodule
