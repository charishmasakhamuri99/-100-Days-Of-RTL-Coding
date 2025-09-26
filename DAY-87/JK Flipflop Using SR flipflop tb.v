// Code your testbench here
// or browse Examples
module tb_JK_FF_using_SRFF;
    reg clk, rst_n, J, K;
    wire Q;

    JK_FF_using_SRFF uut (
        .clk(clk),
        .rst_n(rst_n),
        .J(J),
        .K(K),
        .Q(Q)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("jkff_using_srff_tb.vcd");
        $dumpvars(0, tb_JK_FF_using_SRFF);

        clk = 0;
        rst_n = 0;
        J = 0;
        K = 0;

        // Reset
        #10 rst_n = 1;

        // Test J=0, K=0 (No change)
        #10 J = 0; K = 0;
        #10;

        // Test J=0, K=1 (Reset)
        J = 0; K = 1;
        #10;

        // Test J=1, K=0 (Set)
        J = 1; K = 0;
        #10;

        // Test J=1, K=1 (Toggle)
        J = 1; K = 1;
        #10;

        // More patterns if needed
        #10 $finish;
    end
endmodule
