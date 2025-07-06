`timescale 1ns/1ps

module tb_and_gate;
    reg A, B;
    wire Y;

    // Instantiating the design-under-test (DUT)
    and_gate dut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        $dumpfile("and_gate_tb.vcd");
        $dumpvars(0, tb_and_gate);

        // Stimulus
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end
    initial begin
        $display("Time\tA B | Y");
        $monitor("%0dns\t%b %b | %b", $time, A, B, Y);
    end
endmodule
