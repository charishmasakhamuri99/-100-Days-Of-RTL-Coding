module tb;
reg clk;
reg wr_en;
reg [7:0] data_in;
reg [3:0] addr_in_0, addr_in_1;
reg port_en_0, port_en_1;
wire [7:0] data_out_0, data_out_1;

dual_port_ram uut (
    .clk(clk),
    .wr_en(wr_en),
    .data_in(data_in),
    .addr_in_0(addr_in_0),
    .addr_in_1(addr_in_1),
    .port_en_0(port_en_0),
    .port_en_1(port_en_1),
    .data_out_0(data_out_0),
    .data_out_1(data_out_1)
);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $display("time\tclk\twr_en\taddr0\tdata0\taddr1\tdata1");
    $monitor("%0t\t%b\t%b\t%h\t%h\t%h\t%h", 
        $time, clk, wr_en, addr_in_0, data_out_0, addr_in_1, data_out_1);

    integer i;
    initial begin // Initialize
        wr_en = 0;
        port_en_0 = 0;
        port_en_1 = 0;
        data_in = 0;
        addr_in_0 = 0;
        addr_in_1 = 0;
        #20;
        port_en_0 = 1;
        wr_en = 1;
        for(i = 0; i < 16; i = i + 1) begin
            addr_in_0 = i;
            data_in = i + 10;
            #10;
        end
        wr_en = 0;
        port_en_1 = 1;
        for(i = 0; i < 16; i = i + 1) begin
            addr_in_1 = i;
            #10;
        end
        port_en_1 = 0;
    end
end
