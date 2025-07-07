`timescale 1ns/1ps
module tb_mux4x1;
    reg  [3:0] in;
    reg  [1:0] sel;
    wire       out;

    mux4x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("tb_mux4x1.vcd");
        $dumpvars(0, tb_mux4x1);
        $display("time sel in -> out");
        $monitor("%0dns  %b   %b -> %b", $time, sel, in, out);
        in = 4'b0001; sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        in = 4'b1010; sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        in = 4'b1111; sel = 2'b10; #10;
        sel = 2'b00; #10;
        sel = 2'b11; #10;

        $finish;
    end
endmodule
