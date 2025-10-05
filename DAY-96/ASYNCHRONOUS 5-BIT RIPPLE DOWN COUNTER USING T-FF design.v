// tff.v
module tff (
    input clk,
    input rst_n,      // active low asynchronous reset
    output reg q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0; // Reset output to 0
        else
            q <= ~q;   // Toggle on clock edge
    end
endmodule

// ripple_down_counter_5bit.v
module ripple_down_counter_5bit (
    input clk,
    input rst_n,
    output [4:0] q
);

tff tff0 (
    .clk(clk),
    .rst_n(rst_n),
    .q(q[0])
);

genvar i;
generate
    for (i = 1; i < 5; i = i + 1) begin : tff_chain
        tff tff_inst(
            .clk(q[i-1]),
            .rst_n(rst_n),
            .q(q[i])
        );
    end
endgenerate

always @(q) begin
    $display("[%0t] Counter Changed -> Binary: %b | Decimal: %0d", $time, q, q);
end

endmodule
  
