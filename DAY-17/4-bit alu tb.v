`timescale 1ns/1ps

module tb_alu4;
    reg  [3:0] A, B;
    reg  [2:0] OP;
    wire [3:0] Y;
    wire       C;

    integer i, j, k;

    alu4 dut (
        .A(A),
        .B(B),
        .OP(OP),
        .Y(Y),
        .C(C)
    );

    initial begin
        $dumpfile("alu4_tb.vcd");
        $dumpvars(0, tb_alu4);
        $display("Time A   B   OP  | C Y");
        $display("----------------------+----");

        for (i = 0; i < 5; i = i + 1) begin
            OP = i;
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 16; k = k + 1) begin
                    A = j; B = k;
                    #5;
                    $display("%4dns  %b %b %b | %b %b", $time, A, B, OP, C, Y);
                end
            end
        end
        $finish;
    end
endmodule
