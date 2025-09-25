module tb_JK_FF_using_DFF;
    reg Clk, rst_n, J, K;
    wire Q;

    // Instantiate the JK flip-flop
    JK_FF_using_DFF uut (
        .clk(Clk),
        .rst_n(rst_n),
        .J(J),
        .K(K),
        .Q(Q)
    );

    // Clock generator
    always #5 Clk = ~Clk;

    initial begin
        $dumpfile("jkff_using_dff_tb.vcd");
        $dumpvars(0, tb_JK_FF_using_DFF);
        Clk = 0; rst_n = 0; J = 0; K = 0;

        // Apply Reset
        #10 rst_n = 1;

        // Test J=0, K=0 (No change)
        #10; J = 0; K = 0; #10;

        // Test J=0, K=1 (Reset)
        J = 0; K = 1; #10;

        // Test J=1, K=0 (Set)
        J = 1; K = 0; #10;

        // Test J=1, K=1 (Toggle)
        J = 1; K = 1; #10;

        // Repeat with different patterns if needed
        #10 $finish;
    end
endmodule
