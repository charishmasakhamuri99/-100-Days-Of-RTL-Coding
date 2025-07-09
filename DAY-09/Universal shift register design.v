// universal_shift_register.v
module universal_shift_register (
    input wire clk,
    input wire resetn,
    input wire [1:0] sel,     // 00: Hold, 01: Shift Right, 10: Shift Left, 11: Parallel Load
    input wire [3:0] data_in, // Input for parallel load
    output reg [3:0] data_out
);

always @(posedge clk or negedge resetn) begin
    if (!resetn)
        data_out <= 4'b0000;
    else begin
        case (sel)
            2'b00: data_out <= data_out;                           // Hold
            2'b01: data_out <= {1'b0, data_out[3:1]};              // Shift Right
            2'b10: data_out <= {data_out[2:0], 1'b0};              // Shift Left
            2'b11: data_out <= data_in;                            // Parallel Load
        endcase
    end
end

endmodule
