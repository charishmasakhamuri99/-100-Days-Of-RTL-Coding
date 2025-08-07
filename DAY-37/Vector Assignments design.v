module vector_assignments (
    output reg [6:0] vec_a,
    input [4:0] vec_b
);

    initial begin
        $monitor("Time=%0t, vec_b=%b, vec_a=%b, vec_a[2]=%h",
                 $time, vec_b, vec_a, vec_a[2]);
        // Will be triggered when testbench propels vec_b
    end

    // Simple continuous assignment: LHS stored in reg
    always @(*) begin
        vec_a = vec_b;  // Assign lower 5 bits; upper 2 bits zero‑extended
    end
endmodule
