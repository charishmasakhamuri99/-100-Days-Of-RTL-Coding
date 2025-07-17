`timescale 1ns/1ps
module tb_demux;
    reg        i;
    reg  [2:0] s;
    wire [7:0] yb;
    wire       y0, y1, y2, y3, y4, y5, y6, y7;

    // Behavioral DUT
    demux_1x8_behav DUTB(.i(i), .s(s), .y(yb));

    // Structural DUT
    demux_1x8_struct DUTS(.d(i), .s0(s[0]), .s1(s[1]), .s2(s[2]),
                         .y0(y0), .y1(y1), .y2(y2), .y3(y3),
                         .y4(y4), .y5(y5), .y6(y6), .y7(y7));

    initial begin
        // Initialize
        i = 0; s = 3'b000;
        #10  i = 1;
        // Cycle through selections
        repeat (8) begin
            #20 s = s + 1;
        end
        #20 $finish;
    end

    initial begin
        $monitor("time=%0t i=%b s=%b ● behavioral_y=%b structural_outputs=%b%b%b%b%b%b%b%b",
                 $time, i, s, yb,
                 y7,y6,y5,y4,y3,y2,y1,y0);
    end
endmodule
