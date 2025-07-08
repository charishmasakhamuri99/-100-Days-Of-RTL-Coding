// Testbench for 2-bit Comparator with waveform generation
`timescale 1ns / 1ps

module tb_comparator_2bit;

    reg [1:0] A, B;
    wire A_gt_B, A_eq_B, A_lt_B;

    // Instantiate the Unit Under Test (UUT)
    comparator_2bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        // Set up waveform dump file
        $dumpfile("comparator_2bit.vcd");  // Output waveform file
        $dumpvars(0, tb_comparator_2bit);  // Dump all variables in this module

        $display("Time\tA\tB\tA>B\tA==B\tA<B");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);

        // Test combinations
        A = 2'b00; B = 2'b00; #10;  // A = 0, B = 0
        A = 2'b01; B = 2'b00; #10;  // A = 1, B = 0
        A = 2'b01; B = 2'b01; #10;  // A = 1, B = 1
        A = 2'b10; B = 2'b11; #10;  // A = 2, B = 3
        A = 2'b11; B = 2'b10; #10;  // A = 3, B = 2
        A = 2'b10; B = 2'b10; #10;  // A = 2, B = 2

        $finish;
    end

endmodule
