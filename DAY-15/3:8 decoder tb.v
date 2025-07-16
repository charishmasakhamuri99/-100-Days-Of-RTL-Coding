`timescale 1ns/1ps
module decoder3to8_tb;
    reg  [2:0] in;
    reg        en;
    wire [7:0] out;

    decoder3to8 uut (
        .in(in),
        .en(en),
        .out(out)
    );

    integer i;
    initial begin
        // Test with enable LOW
        en = 1'b0;
        for (i = 0; i < 8; i = i + 1) begin
            in = i;
            #10;
            $display("en=0, in=%b, out=%b", in, out);
        end

        // Test with enable HIGH
        en = 1'b1;
        for (i = 0; i < 8; i = i + 1) begin
            in = i;
            #10;
            $display("en=1, in=%b, out=%b", in, out);
        end

        $finish;
    end
endmodule
