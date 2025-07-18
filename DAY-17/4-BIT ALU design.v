module alu4 (
    input  wire [3:0] A,    // operand A
    input  wire [3:0] B,    // operand B
    input  wire [2:0] OP,   // operation select
    output reg  [3:0] Y,    // result
    output reg        C     // carry-out flag
);
    always @(*) begin
        C = 1'b0;
        case (OP)
            3'b000: {C, Y} = A + B;     // addition
            3'b001: {C, Y} = A - B;     // subtraction (borrow in C)
            3'b010: Y = A & B;         // AND
            3'b011: Y = A | B;         // OR
            3'b100: Y = A ^ B;         // XOR
            default: Y = 4'b0000;
        endcase
    end
endmodule
