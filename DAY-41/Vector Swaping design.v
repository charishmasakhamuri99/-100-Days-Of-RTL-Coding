// swap_with_temp.v
module swap_with_temp #(parameter WIDTH = 8) (
    input wire clk,
    input wire [WIDTH-1:0] in_a,
    input wire [WIDTH-1:0] in_b,
    output reg [WIDTH-1:0] out_a,
    output reg [WIDTH-1:0] out_b
);
    reg [WIDTH-1:0] a, b, temp;

    always @(posedge clk) begin
        a    <= in_a;
        b    <= in_b;
        temp <= b;
        b    <= a;
        a    <= temp;
    end

    always @(posedge clk) begin
        out_a <= a;
        out_b <= b;
    end
endmodule
