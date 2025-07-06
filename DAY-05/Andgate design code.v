// Filename: and_gate.v
module and_gate (
    input  wire A,
    input  wire B,
    output wire Y
);
    assign Y = A & B;  // bitwise AND
endmodule
