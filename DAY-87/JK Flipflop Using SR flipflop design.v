module SR_FF(
    input clk,
    input rst_n,        // Synchronous reset, active low
    input S,
    input R,
    output reg Q
);
    always @(posedge clk) begin
        if (!rst_n)
            Q <= 1'b0;
        else begin
            case ({S, R})
                2'b00: Q <= Q;      // No change
                2'b01: Q <= 1'b0;   // Reset
                2'b10: Q <= 1'b1;   // Set
                2'b11: Q <= 1'bx;   // Invalid for SR
            endcase
        end
    end
endmodule

module JK_FF_using_SRFF(
    input clk,
    input rst_n,
    input J,
    input K,
    output Q
);
    wire S, R;
    wire Q_int;

    // Conversion logic from JK to SR inputs
    assign S = J & ~Q_int;
    assign R = K & Q_int;

    SR_FF srff (
        .clk(clk),
        .rst_n(rst_n),
        .S(S),
        .R(R),
        .Q(Q_int)
    );

    assign Q = Q_int;
endmodule
