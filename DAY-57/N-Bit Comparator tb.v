`timescale 1ns/1ps
module n_bit_comparator_tb;
    parameter w = 4;

    reg  [w-1:0] A, B;
    wire         AgtB, AltB, AeqB;

    n_bit_comparator #(.w(w)) uut (
        .A(A),
        .B(B),
        .AgtB(AgtB),
        .AltB(AltB),
        .AeqB(AeqB)
    );

    initial begin
        $display("Time\tA\tB\tA>B\tA<B\tA==B");
        $monitor("%0t\t%h\t%h\t%b\t%b\t%b", $time, A, B, AgtB, AltB, AeqB);
        // Test vectors
        A = 4'hA; B = 4'h5; #10; // AgtB = 1
        A = 4'h7; B = 4'hf; #10; // AltB = 1
        A = 4'h3; B = 4'h3; #10; // AeqB = 1
        A = 4'hc; B = 4'h8; #10; // AgtB = 1
        A = 4'h1; B = 4'h5; #10; // AltB = 1
        $finish;
    end
endmodule
