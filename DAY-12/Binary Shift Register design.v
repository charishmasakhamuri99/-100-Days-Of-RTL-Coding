module siso (
    input  wire din,
    input  wire clk,
    input  wire reset,
    output wire dout
);
    // 4-stage shift chain
    reg [2:0] s;

    // Cascade 4 D‑flip‑flops
    d_flip_flop u0(.din(din),   .clk(clk), .reset(reset), .dout(s[0]));
    d_flip_flop u1(.din(s[0]),  .clk(clk), .reset(reset), .dout(s[1]));
    d_flip_flop u2(.din(s[1]),  .clk(clk), .reset(reset), .dout(s[2]));
    d_flip_flop u3(.din(s[2]),  .clk(clk), .reset(reset), .dout(dout));

endmodule

module d_flip_flop (
    input  wire din,
    input  wire clk,
    input  wire reset,
    output reg  dout
);
    always @ (posedge clk) begin
        if (reset)
            dout <= 1'b1;
        else
            dout <= din;
    end
endmodule
