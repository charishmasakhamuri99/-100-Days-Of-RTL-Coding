// tb_tff.v
`timescale 1ns/1ps

module tb;
    reg clk = 0;
    reg rstn = 0;
    reg t;
    wire q;

    // Instantiate DUT
    tff uut (
        .clk(clk),
        .rstn(rstn),
        .t(t),
        .q(q)
    );

    // 100MHz clock → period = 10ns
    always #5 clk = ~clk;

    initial begin
        // Dump waveforms for GTKWave
        $dumpfile("tff.vcd");
        $dumpvars(0, tb);

        // Initial conditions
        rstn = 0; t = 0;
        #15 rstn = 1;  // Release reset after ~3 clocks

        // Random toggling of T
        repeat (20) begin
            @(posedge clk);
            t <= $random;
        end

        #50;
        $finish;
    end

    // Display events
    initial begin
        $display("Time  rstn  T  -> Q");
        $monitor("%4t    %b     %b    -> %b", $time, rstn, t, q);
    end
endmodule
