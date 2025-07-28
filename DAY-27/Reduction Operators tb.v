`timescale 1ns/1ps
module tb_reduction_unit;
    reg [3:0] in;
    wire r_and, r_nand, r_or, r_nor, r_xor, r_xnor;

    reduction_unit #(.WIDTH(4)) dut (
        .in(in),
        .r_and(r_and),
        .r_nand(r_nand),
        .r_or(r_or),
        .r_nor(r_nor),
        .r_xor(r_xor),
        .r_xnor(r_xnor)
    );

    initial begin
        $display("in    AND NAND  OR  NOR XOR XNOR");
        in = 4'b0000; #5 $display("%b   %b    %b    %b    %b   %b    %b", in, r_and, r_nand, r_or, r_nor, r_xor, r_xnor);
        in = 4'b0001; #5 $display("%b   %b    %b    %b    %b   %b    %b", in, r_and, r_nand, r_or, r_nor, r_xor, r_xnor);
        in = 4'b1010; #5 $display("%b   %b    %b    %b    %b   %b    %b", in, r_and, r_nand, r_or, r_nor, r_xor, r_xnor);
        in = 4'b1111; #5 $display("%b   %b    %b    %b    %b   %b    %b", in, r_and, r_nand, r_or, r_nor, r_xor, r_xnor);
        in = 4'b1101; #5 $display("%b   %b    %b    %b    %b   %b    %b", in, r_and, r_nand, r_or, r_nor, r_xor, r_xnor);
        $finish;
    end
endmodule
