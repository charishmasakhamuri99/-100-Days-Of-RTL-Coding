// vector_assignments.v
module vector_assignments (
  output [6:0] vec_a,
  input  [8:0] vec_b
);

  initial begin
    $monitor("Time=%0t, vec_b=%b, vec_a=%b, vec_a[2]=%b",
              $time, vec_b, vec_a, vec_a[2]);
  end

  always @(*) begin
    vec_a = vec_b;  // Truncates MSBs of vec_b to fit vec_a
  end
endmodule
