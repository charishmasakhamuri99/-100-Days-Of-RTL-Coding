// vector_assignments.v
module vector_assignments (
    output reg signed [-4:3] vec_a,
    input  signed [8:-1] vec_b
);

    initial begin
        $monitor("Time=%0t, vec_b=%b, vec_a=%b, vec_a[-3]=%b",
                 $time, vec_b, vec_a, vec_a[-3]);
    end

    always @(*) begin
        vec_a = vec_b;  // Simple bitwise copy
    end
endmodule
