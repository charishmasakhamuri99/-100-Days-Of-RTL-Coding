// sync_counter_2bit.v
module sync_counter_2bit (
    input wire clk,
    input wire rst_n,
    output reg [1:0] q  // 2-bit count output
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 2'b00;
        else
            q <= q + 1'b1;
    end
endmodule
