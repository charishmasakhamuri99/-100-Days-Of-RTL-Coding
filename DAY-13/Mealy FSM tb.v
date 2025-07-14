module tb_seq_detector_1010;

    reg clk, rst_n, x;
    wire z;

    // Instantiate DUT
    seq_detector_1010 dut (
        .clk(clk),
        .rst_n(rst_n),
        .x(x),
        .z(z)
    );

    // Clock: toggle every 2 time units
    initial clk = 0;
    always #2 clk = ~clk;

    // Stimulus
    initial begin
        // Reset
        rst_n = 0;
        x = 0;
        #5 rst_n = 1;

        // Apply a test sequence with overlapping 1010 patterns
        // Example bitstream: 1 0 1 0 1 0
        repeat (2) begin
            x = 1; #4;
            x = 0; #4;
            x = 1; #4;
            x = 0; #4;
        end

        // Pause, then finish
        #20;
        $finish;
    end

    // Dump waveform
    initial begin
        $dumpfile("seq1010.vcd");
        $dumpvars(0, tb_seq_detector_1010);
    end

endmodule
