module pipo (
    input wire clk,
    input wire rst_n,      // active low reset
    input wire load,       // load enable signal
    input wire [3:0] data_in,  // 4-bit parallel input
    output reg [3:0] data_out  // 4-bit parallel output
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        data_out <= 4'b0000;
    else if (load)
        data_out <= data_in;
    else
        data_out <= data_out; // asserted
end

endmodule
