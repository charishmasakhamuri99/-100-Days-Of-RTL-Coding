`timescale 1ns/1ps
module tb_all_gates;
    reg a, b;
    wire and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out;

    all_gates uut (
        .a(a), .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .not_out(not_out),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );

    integer i;
    reg [1:0] combo;
    initial begin
        $display("Time a b | AND OR NOT NAND NOR XOR XNOR");
        for (i = 0; i < 4; i = i + 1) begin
            combo = i;
            {a, b} = combo;
            #10;
            $display("%4dns  %b %b |   %b   %b   %b    %b    %b    %b    %b",
                     $time, a, b,
                     and_out, or_out, not_out,
                     nand_out, nor_out, xor_out, xnor_out);
        end
        $finish;
    end
endmodule
