`timescale 1ns/1ps
module tb_siso;
    reg  clk = 0;
    reg  reset;
    reg  din;
    wire dout;

    // Instantiate DUT
    siso uut(.din(din), .clk(clk), .reset(reset), .dout(dout));

    // Clock generation (10 ns period = 100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Create VCD for GTKWave
        $dumpfile("siso.vcd");
        $dumpvars(0, tb_siso);

        // Reset & stimulus sequence
        reset = 1; din = 0;
        #10; reset = 0;
        #10;

        // Shift-in alternating pattern 1,0,1,0...
        repeat (8) begin
            din = ~din;
            #10;
        end

        #20;
        $finish;
    end

    initial begin
        $monitor("%0dns | reset=%b, din=%b, dout=%b", $time, reset, din, dout);
    end
endmodule
