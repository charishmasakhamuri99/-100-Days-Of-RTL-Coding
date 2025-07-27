// Module: case_equality.v
module case_equality (
    input  wire [1:0] a,
    input  wire [1:0] b,
    output wire       eq,
    output wire       neq
);
    assign eq  = (a === b);   // Case equality (checks bits and 'x'/'z' values)
    assign neq = (a !== b);   // Case inequality
endmodule
