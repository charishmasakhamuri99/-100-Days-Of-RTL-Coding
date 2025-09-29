// Code your design here
// T Flip-Flop Module
module T_FF (
    input wire T,
    input wire clk,
    input wire reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (T == 1)
            Q <= ~Q;  // Toggle Q when T=1
        else
            Q <= Q;   // Hold state when T=0
    end
endmodule
module D_FF_using_T(
    input wire D,
    input wire clk,
    input wire reset,
    output wire Q
);
    wire T;
    reg Q_internal;

    // Calculate T input for T Flip-Flop
    assign T = D ^ Q_internal;

    // Instantiate T flip-flop
    T_FF tff_inst (
        .T(T),
        .clk(clk),
        .reset(reset),
        .Q(Q_internal)
    );

    assign Q = Q_internal;
endmodule
