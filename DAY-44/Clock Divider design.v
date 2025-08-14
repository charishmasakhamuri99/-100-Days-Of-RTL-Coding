module clock_divider_limit #(
    parameter DIV   = 4,                // divide-by factor (must be even)
    parameter LIMIT = 10                // maximum number of output pulses
) (
    input  wire clk_in,
    input  wire reset,                  // synchronous reset
    output reg  clk_out,
    output reg  done                    // goes high when LIMIT reached
);

    localparam CNT_WIDTH = $clog2(DIV);
    reg [CNT_WIDTH-1:0] cnt;
    reg [$clog2(LIMIT+1)-1:0] pulses;

    always @(posedge clk_in) begin
        if (reset) begin
            cnt    <= 0;
            clk_out <= 0;
            pulses <= 0;
            done   <= 0;
        end else if (!done) begin
            if (cnt == DIV/2 - 1) begin
                clk_out <= ~clk_out;
                cnt     <= 0;
                if (clk_out) begin
                    pulses <= pulses + 1;
                    if (pulses + 1 == LIMIT)
                        done <= 1;
                end
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

endmodule
