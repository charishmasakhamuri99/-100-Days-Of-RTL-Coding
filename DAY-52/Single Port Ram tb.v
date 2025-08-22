// Testbench
`timescale 1ns / 1ps
module single_port_ram_tb;
    reg clk, we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate DUT
    single_port_ram dut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("ram.vcd");
        $dumpvars(0, single_port_ram_tb);

        clk = 0; we = 0; addr = 0; din = 0;

        // Write some data
        #10; we = 1; addr = 4'h1; din = 8'hAA;
        #10; addr = 4'h2; din = 8'hBB;
        #10; addr = 4'h3; din = 8'hCC;

        // Read data
        #10; we = 0; addr = 4'h1;
        #10; addr = 4'h2;
        #10; addr = 4'h3;

        #20; $finish;
    end
endmodule
