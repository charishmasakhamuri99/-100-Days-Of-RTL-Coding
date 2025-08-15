module ring_counter #(parameter N = 4)(
    input clk,
    input reset,
    output reg [N-1:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b1000;   // Initial value
        else
            q <= {q[N-2:0], q[N-1]};  // Left shift with wrap-around
    end
endmodule
