module shift_operator_demo;
  reg [7:0] data;
  reg signed [7:0] data_signed;

  initial begin
    data        = 8'b10110011;
    data_signed = 8'b10110011; // -77 in decimal (signed)

    // Logical shift
    $display ("Shift left (<<) : %b", data << 2);      // Prints 11001100
    $display ("Shift right (>>) : %b", data >> 2);     // Prints 00101100

    // Arithmetic shift (on signed)
    $display ("Arith shift right (>>>) : %b", data_signed >>> 2); // sign extends, prints 11101100
    $display ("Arith shift left (<<<) : %b", data_signed <<< 2);  // prints 11001100
  end
endmodule
module shift_reg #(
  parameter WIDTH = 8
) (
  input wire clk,
  input wire rst_n,
  input wire shift_right,
  input wire [WIDTH-1:0] data_in,
  output reg [WIDTH-1:0] data_out
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      data_out <= 0;
    else if (shift_right)
      data_out <= data_out >> 1;
    else
      data_out <= data_out << 1;
  end
endmodule

