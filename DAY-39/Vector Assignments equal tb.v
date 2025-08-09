`timescale 1ns/1ps

module vector_assignments_tb;
    reg signed [8:-1] vec_b;    // 10-bit signed vector
    wire signed [-4:3] vec_a;   // 8-bit signed wire

    vector_assignments dut (
        .vec_a(vec_a),
        .vec_b(vec_b)
    );

    initial begin
        $dumpfile("vector_assignments.vcd");
        $dumpvars(0, vector_assignments_tb);
        vec_b = 10'b1111101110;
        #10;
        vec_b = 5'd15;
        #10;
        vec_b = 5'h1F;
        #10;
        $finish;
    end
endmodule
