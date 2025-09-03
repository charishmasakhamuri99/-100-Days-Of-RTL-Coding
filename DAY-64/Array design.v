module mem_array (
    input        clk,
    input        rstn,
    input        wr,       // write enable
    input  [1:0] addr,
    input  [15:0] wdata,   // write data
    output [15:0] rdata    // read data
);
    reg [15:0] mem [0:3];
    integer i;

    // Reset and write logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            for (i = 0; i < 4; i = i + 1)
                mem[i] <= 16'd0;
        end else if (wr) begin
            mem[addr] <= wdata;
        end
    end

    // Asynchronous read
    assign rdata = mem[addr];
endmodule
