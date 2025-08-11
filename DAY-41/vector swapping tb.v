// tb_swap_with_temp.v
`timescale 1ns/1ps
module tb_swap_with_temp;
    reg clk = 0;
    reg [7:0] in_a, in_b;
    wire [7:0] out_a, out_b;

    swap_with_temp #(.WIDTH(8)) uut(
        .clk(clk), .in_a(in_a), .in_b(in_b),
        .out_a(out_a), .out_b(out_b)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("swap_with_temp.vcd");
        $dumpvars(0, tb_swap_with_temp);

        in_a = 8'd10; in_b = 8'd20;
        #10;
        $display("Before swap: a=%0d b=%0d", in_a, in_b);
        #10;
        $display("After swap: a=%0d b=%0d", out_a, out_b);
        #10;
        $finish;
    end
endmodule
