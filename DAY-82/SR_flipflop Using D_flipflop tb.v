// Code your testbench here
// or browse Examples
//-------------------- Testbench --------------------
module tb_sr_flipflop_using_d;
    reg S, R, clk, rst;
    wire Q;

    // Instantiate DUT
    sr_flipflop_using_d dut (
        .S(S),
        .R(R),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply stimuli
    initial begin
        $monitor("Time=%0t | S=%b R=%b rst=%b Q=%b", $time, S, R, rst, Q);
        rst = 1;
        S = 0; R = 0; #10;
        rst = 0; #10;

        S = 1; R = 0; #10; // Set
        S = 0; R = 1; #10; // Reset
        S = 0; R = 0; #10; // Hold (no change)
        S = 1; R = 1; #10; // Invalid – typically Q will remain unchanged

        S = 0; R = 0; #10;
        rst = 1; #10; // Reset with reset signal

        $finish;
    end
endmodule


