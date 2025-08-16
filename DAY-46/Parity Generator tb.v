`timescale 1ns/1ps
module tb_parity_gen;
    reg [3:0] d;
    wire      p;

    parity_gen_4bit dut (.d(d), .p(p));

    initial begin
        $display("time ns   d   parity");
        $monitor("%dns   %04b    %b", $time, d, p);

        // Test all combinations
        for (integer i = 0; i < 16; i = i + 1) begin
            d = i;
            #10;
        end

        $finish;
    end
endmodule
