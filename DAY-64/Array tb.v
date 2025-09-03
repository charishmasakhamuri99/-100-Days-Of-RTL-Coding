`timescale 1ns/1ps

module tb_mem_array;
    reg clk = 0;
    reg rstn = 0;
    reg wr;
    reg [1:0] addr;
    reg [15:0] wdata;
    wire [15:0] rdata;

    // Instantiate DUT
    mem_array dut (
        .clk(clk), .rstn(rstn),
        .wr(wr), .addr(addr),
        .wdata(wdata), .rdata(rdata)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        $display("Starting memory array test...");
        rstn = 0;
        wr = 0;
        #10;
        rstn = 1;

        // Write to all addresses
        for (integer i = 0; i < 4; i = i + 1) begin
            addr = i[1:0];
            wdata = 16'hA0A0 + i;
            wr = 1;
            #10;
            wr = 0;
            #10;
        end

        // Read and display
        for (integer i = 0; i < 4; i = i + 1) begin
            addr = i;
            #10;
            $display("addr=%0d, rdata=0x%0h", addr, rdata);
        end

        $display("Testbench finished.");
        $finish;
    end
endmodule
