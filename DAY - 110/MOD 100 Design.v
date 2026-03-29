module mod100_counter (
    input clk,
    input rst,
    output reg [6:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 7'd0;
    else if (count == 7'd99)
        count <= 7'd0;
    else
        count <= count + 1;
end

endmodule
