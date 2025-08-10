`timescale 1ns/1ps
module vector_assign_signed_tb;
reg signed [-4:3] vec_b;      // 8-bit signed input
wire signed [-4:5] vec_a;     // 10-bit signed output
vector_assign_signed dut (
    .vec_a(vec_a),
    .vec_b(vec_b)
);

initial begin
    $dumpfile("vector_assign_signed.vcd");
    $dumpvars(0, vector_assign_signed_tb);
    vec_b = -69;  // negative value
    #10;
    vec_b = -15;  // negative value
    #10;
    vec_b = -128; // edge of 8-bit signed range
    #10;
    $finish;
end
endmodule
