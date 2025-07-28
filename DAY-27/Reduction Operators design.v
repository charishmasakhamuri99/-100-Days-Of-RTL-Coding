module reduction_unit #(parameter WIDTH = 4)(
    input  wire [WIDTH-1:0] in,
    output wire           r_and,
    output wire           r_nand,
    output wire           r_or,
    output wire           r_nor,
    output wire           r_xor,
    output wire           r_xnor
);
    assign r_and  = &in;      // Reduction AND
    assign r_nand = ~&in;     // Reduction NAND
    assign r_or   = |in;      // Reduction OR
    assign r_nor  = ~|in;     // Reduction NOR
    assign r_xor  = ^in;      // Reduction XOR
    assign r_xnor = ~^in;     // Reduction XNOR
endmodule
