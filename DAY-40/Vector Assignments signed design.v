// vector_assign_signed.v
module vector_assign_signed(
    output reg signed [-4:5] vec_a,   // 10-bit signed vector
    input  signed [-4:3] vec_b        // 8-bit signed vector
);
initial begin
    $monitor("Time=%0t | vec_b = %d (%b) | vec_a = %d (%b) | vec_a[-3] = %b",
              $time, vec_b, vec_b, vec_a, vec_a, vec_a[-3]);
end

always @(*) begin
    vec_a = vec_b; // Signed assignment – sign extends or truncates
end
endmodule
