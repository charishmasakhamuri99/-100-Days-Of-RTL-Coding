module tb_ring_counter;
    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the design
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("time\tclk\treset\tq");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, reset, q);

        clk = 0;
        reset = 1;
        #10;

        reset = 0;
        #100;

        $finish;
    end
endmodule
