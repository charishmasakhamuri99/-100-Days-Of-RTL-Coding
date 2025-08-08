`timescale 1ns/1ps

module vector_assignments_tb;
  reg [8:0] vec_b;
  wire [6:0] vec_a;

  vector_assignments dut (
    .vec_a(vec_a),
    .vec_b(vec_b)
  );

  initial begin
    $dumpfile("vector_assignments.vcd");
    $dumpvars(0, vector_assignments_tb);

    vec_b = 9'b111110110;  // 9‑bit value
    #10;
    vec_b = 5'd15;         // decimal 15 assigned to 9 bits
    #10;
    vec_b = 5'h1F;         // hex 1F to lower 5 bits
    #10;
    $finish;
  end
endmodule
