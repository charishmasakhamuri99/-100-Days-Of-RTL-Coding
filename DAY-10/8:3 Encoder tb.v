`timescale 1ns / 1ps

module tb_encoder_8to3;

reg [7:0] in;
wire [2:0] out;

encoder_8to3 uut (
    .in(in),
    .out(out)
);

initial begin
    // Initialize input
    in = 8'b00000000;
    #10;

    // Apply test vectors (one-hot encoding for each input)
    in = 8'b00000001; #10;
    in = 8'b00000010; #10;
    in = 8'b00000100; #10;
    in = 8'b00001000; #10;
    in = 8'b00010000; #10;
    in = 8'b00100000; #10;
    in = 8'b01000000; #10;
    in = 8'b10000000; #10;

    // Finish simulation
    $finish;
end

initial begin
    // Dump waveform for simulation
    $dumpfile("encoder_8to3.vcd");
    $dumpvars(0, tb_encoder_8to3);
end

endmodule
 
