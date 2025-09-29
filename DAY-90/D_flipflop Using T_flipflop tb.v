// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_D_FF_using_T;
    reg D;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the D Flip-Flop module implemented using T Flip-Flop
    D_FF_using_T uut (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1; D = 0;
        #12;
        reset = 0;

        #10 D = 1;  // Expect Q to change to 1 at next clk edge
        #10 D = 1;  // Hold D=1, Q should hold 1
        #20 D = 0;  // Expect Q to change to 0
        #20 D = 1;  // Expect Q to change to 1 again
        #20 D = 0;  // Expect Q to change to 0
        #20 D = 0;  // Hold D=0, Q should hold 0

        #30 $finish; // End simulation
    end

    initial begin
        $monitor("Time=%0t: reset=%b, D=%b, Q=%b", $time, reset, D, Q);
    end
endmodule
