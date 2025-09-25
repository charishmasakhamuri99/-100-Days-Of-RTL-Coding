// D flip-flop module with synchronous reset
module D_FF(
    input clk,
    input rst_n,
    input D,
    output reg Q
);
    always @(posedge clk) begin
        if (!rst_n)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

// JK flip-flop using D flip-flop
module JK_FF_using_DFF(
    input clk,
    input rst_n,
    input J,
    input K,
    output Q
);
    wire D;
    wire Q_int;

    // Characteristic equation for JK using D FF
    assign D = (J & ~Q_int) | (~K & Q_int);

    D_FF dff (
        .clk(clk),
        .rst_n(rst_n),
        .D(D),
        .Q(Q_int)
    );

    assign Q = Q_int;
endmodule
