module tb;

reg clk, rst;
wire [6:0] count;

mod100_counter u1 (
    .clk(clk),
    .rst(rst),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;

    #500 $finish;
end

initial  begin
    $monitor("time=%0t clk=%b rst=%b count=%d", $time, clk, rst, count);
end

endmodule
