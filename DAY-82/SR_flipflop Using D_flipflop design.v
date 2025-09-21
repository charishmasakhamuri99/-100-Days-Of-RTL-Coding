// Code your design here
//------------------- D Flip-Flop -------------------
module d_flipflop (
    input D,
    input clk,
    input rst,
    output reg Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

//--- SR Flip-Flop using D Flip-Flop ---
module sr_flipflop_using_d (
    input S,
    input R,
    input clk,
    input rst,
    output Q
);
    wire D, Q_int;
    assign D = S | (~R & Q_int);

    d_flipflop dff_inst (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q_int)
    );

    assign Q = Q_int;
endmodule
