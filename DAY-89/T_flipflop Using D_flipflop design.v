// Code your design here
// D Flip-Flop module
module D_FF(
    input wire D,
    input wire clk,
    input wire reset,
    output reg Q
);

    always @ (posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;  // synchronous or asynchronous reset
        else
            Q <= D;
    end

endmodule

// T Flip-Flop using D Flip-Flop
module T_FF_using_D(
    input wire T,
    input wire clk,
    input wire reset,
    output wire Q
);

    wire D;
    reg Q_internal;

    assign D = T ^ Q_internal; // XOR operation for toggle logic

    // Instantiate D Flip-Flop
    D_FF dff_inst(
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q_internal)
    );

    assign Q = Q_internal;

endmodule
