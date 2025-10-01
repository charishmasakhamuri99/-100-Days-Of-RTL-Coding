// siso_jk.v
module jk_ff (
    input wire clk,
    input wire rst_n,
    input wire J,
    input wire K,
    output reg Q
);
    always @ (posedge clk or negedge rst_n) begin
        if (~rst_n)
            Q <= 1'b0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;    // No change
                2'b01: Q <= 1'b0; // Reset
                2'b10: Q <= 1'b1; // Set
                2'b11: Q <= ~Q;   // Toggle
            endcase
        end
    end
endmodule

module siso_jk (
    input wire clk,
    input wire rst_n,
    input wire din,   // Serial input
    output wire dout  // Serial output
);
    wire [3:0] Q;

    // SISO with 4 JK flip-flops, data shifts right
    jk_ff ff0(.clk(clk), .rst_n(rst_n), .J(din), .K(~din), .Q(Q[0]));
    jk_ff ff1(.clk(clk), .rst_n(rst_n), .J(Q[0]), .K(~Q[0]), .Q(Q[1]));
    jk_ff ff2(.clk(clk), .rst_n(rst_n), .J(Q[1]), .K(~Q[1]), .Q(Q[2]));
    jk_ff ff3(.clk(clk), .rst_n(rst_n), .J(Q[2]), .K(~Q[2]), .Q(Q[3]));

    assign dout = Q[3];
endmodule
