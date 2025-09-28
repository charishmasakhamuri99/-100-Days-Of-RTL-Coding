// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_T_FF_using_D;

    reg T;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the T Flip-Flop module
    T_FF_using_D uut (
        .T(T),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize input signals
        reset = 1;
        T = 0;
        #12;
        reset = 0;

        #10 T = 1;      // Toggle enabled
        #20 T = 0;      // Toggle disabled, hold state
        #20 T = 1;      // Toggle enabled again
        #20 T = 0;

        #50 $finish;    // End simulation
    end

endmodule
