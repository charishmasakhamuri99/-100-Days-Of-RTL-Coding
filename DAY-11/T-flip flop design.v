
module tff (
    input  wire clk,
    input  wire rstn,  // active-low synchronous reset
    input  wire t,
    output reg  q
);
    always @(posedge clk) begin
        if (!rstn)
            q <= 0;
        else if (t)
            q <= ~q;
        else
            q <= q;
    end
endmodule
