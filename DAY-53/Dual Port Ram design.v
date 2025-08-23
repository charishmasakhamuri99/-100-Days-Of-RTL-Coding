module dual_port_ram (
    input clk,
    input wr_en,
    input [7:0] data_in,
    input [3:0] addr_in_0,
    input [3:0] addr_in_1,
    input port_en_0,
    input port_en_1,
    output [7:0] data_out_0,
    output [7:0] data_out_1
);
// 16 x 8-bit memory
reg [7:0] ram [0:15];

// Synchronous write on port 0
always @(posedge clk) begin
    if (port_en_0 && wr_en)
        ram[addr_in_0] <= data_in;
end

// Asynchronous reads on both ports
assign data_out_0 = port_en_0 ? ram[addr_in_0] : 8'bz;
assign data_out_1 = port_en_1 ? ram[addr_in_1] : 8'bz;
endmodule
