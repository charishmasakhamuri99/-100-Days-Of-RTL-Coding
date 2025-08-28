`timescale 1ns/1ps

module tb_seven_seg_rom_limited;
    reg [3:0] num;
    wire [6:0] seg;

    // DUT instantiation
    seven_seg_rom uut (
        .num(num),
        .seg(seg)
    );

    initial begin
        $display("Testing 7-segment for num = %h | seg(a-g)=%b");
        $monitor("%t ns | %h | %b", $time, num, seg);

        // Test valid decimal digits 0-9
        for (num = 4'h0; num <= 4'h9; num = num + 1) begin
            #10; // Allow output to stabilize
        end

        // Check an out-of-range value (e.g., 'A') to verify default behavior
        num = 4'hA; #10;
        if (seg != 7'b1111111) begin
            $display("ERROR: Expected blank output for num = %h, got seg = %b", num, seg);
        end else begin
            $display("OK: Blank for out-of-range num = %h", num);
        end

        $finish;
    end
endmodule
