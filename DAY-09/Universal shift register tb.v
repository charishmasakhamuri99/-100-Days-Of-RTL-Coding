// tb_universal_shift_register.v
`timescale 1ns / 1ps
module tb_universal_shift_register;

    reg clk;
    reg resetn;
    reg [1:0] sel;
    reg [3:0] data_in;
    wire [3:0] data_out;

    // Instantiate the Design Under Test (DUT)
    universal_shift_register uut (
        .clk(clk),
        .resetn(resetn),
        .sel(sel),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Waveform dump
        $dumpfile("universal_shift_register.vcd");
        $dumpvars(0, tb_universal_shift_register);

        // Initialize inputs
        clk = 0;
        resetn = 0;
        sel = 2'b00;
        data_in = 4'b0000;

        // Reset pulse
        #10 resetn = 1;

        // Load parallel data
        #10 sel = 2'b11; data_in = 4'b1010;  // Load 1010
        #10 sel = 2'b00;                    // Hold
        #10 sel = 2'b10;                    // Shift Left -> 0100
        #10 sel = 2'b10;                    // Shift Left -> 1000
        #10 sel = 2'b01;                    // Shift Right -> 0100
        #10 sel = 2'b01;                    // Shift Right -> 0010
        #10 sel = 2'b00;                    // Hold
        #10 $finish;
    end

endmodule
