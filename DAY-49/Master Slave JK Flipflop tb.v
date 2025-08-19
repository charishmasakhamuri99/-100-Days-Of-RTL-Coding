`timescale 1ns/1ps
module tb;
    logic clk = 0, rstn = 0;
    logic j = 0, k = 0;
    logic q, qn;

    master_slave_jk_ff uut(
        .clk (clk),
        .rstn(rstn),
        .j   (j),
        .k   (k),
        .q   (q),
        .qn  (qn)
    );

    always #5 clk = ~clk;

    initial begin
        $display("time\t rstn j k | q qn");
        $monitor("%g\t %b %b %b | %b %b",
            $time, rstn, j, k, q, qn);

        // Reset
        rstn = 0; #10;
        rstn = 1;

        // Apply test vectors
        {j,k} = 2'b00; #10; // hold
        {j,k} = 2'b01; #10; // reset
        {j,k} = 2'b10; #10; // set
        {j,k} = 2'b11; #10; // toggle q
        {j,k} = 2'b11; #10; // toggle again

        $finish;
    end
endmodule
