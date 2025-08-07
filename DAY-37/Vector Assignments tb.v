`timescale 1ns/1ps

module vector_assignments_tb;
    reg [4:0] vec_b;
    wire [6:0] vec_a;

    vector_assignments dut (
        .vec_a(vec_a),
        .vec_b(vec_b)
    );

    initial begin
        $dumpfile("vector_assignments.vcd");
        $dumpvars(0, vector_assignments_tb);
        vec_b = 5'b01110;
        #10;
        vec_b = 5'd15;
        #10;
        vec_b = 5'h1F;
        #10;

        $finish;
    end
endmodule
