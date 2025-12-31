`include "alu.v"

module alu (
    input  [7:0]  a, b,
    input  [3:0]  sel,
    output reg [15:0] y
);

always @(*) begin
    case (sel)
        `ADD  : y = a + b;
        `SUB  : y = a - b;
        `MUL  : y = a * b;
        `DIV  : y = (b != 0) ? a / b : 16'd0;
        `INC  : y = a + 1;
        `DEC  : y = a - 1;
        `AND  : y = a & b;
        `OR   : y = a | b;
        `NOT  : y = ~a;
        `BUF  : y = a;
        `XOR  : y = a ^ b;
        `XNOR : y = ~(a ^ b);
        `NAND : y = ~(a & b);
        `NOR  : y = ~(a | b);
        `MOD  : y = (b != 0) ? a % b : 16'd0;
        `RSH  : y = a >> 1;
        default: y = 16'd0;
    endcase
end

endmodule
//here we are building the alu with compiler derivatives(')
//so that we have writ ethe functionality in the anothe new file created with the extension of .v
