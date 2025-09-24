module jk_flipflop (
    input wire clk,
    input wire rst,    // synchronous reset
    input wire J,
    input wire K,
    output reg Q
);
    always @(posedge clk) begin
        if (rst) begin
            Q <= 1'b0;
        end else begin
            case ({J, K})
                2'b00: Q <= Q;      // no change
                2'b01: Q <= 1'b0;   // reset
                2'b10: Q <= 1'b1;   // set
                2'b11: Q <= ~Q;     // toggle
            endcase
        end
    end
endmodule

module d_flipflop_using_jk (
    input wire D,
    input wire clk,
    input wire rst,
    output wire Q
);
    wire J, K;

    assign J = D;
    assign K = ~D;

    jk_flipflop jkff (
        .clk(clk),
        .rst(rst),
        .J(J),
        .K(K),
        .Q(Q)
    );
endmodule
