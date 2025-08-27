module n_bit_comparator #(
    parameter w = 8 // Configurable width
) (
    input wire  [w-1:0] A,
    input wire  [w-1:0] B,
    output reg          AgtB, // A > B
    output reg          AltB, // A < B
    output reg          AeqB  // A == B
);

    always @(*) begin
        AgtB = (A > B);
        AltB = (A < B);
        AeqB = (A == B);
    end
endmodule
