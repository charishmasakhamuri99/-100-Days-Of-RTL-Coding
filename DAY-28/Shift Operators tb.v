
module tb_shift_operator;
  reg clk = 0;
  reg rst_n = 0;
  reg shift_right = 0;
  reg [7:0] data_in = 8'b10110011;
  wire [7:0] data_out;

  // Instantiate the shift register
  shift_reg uut (
    .clk(clk),
    .rst_n(rst_n),
    .shift_right(shift_right),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Starting TBC for Shift Register");
    rst_n = 0; #10;
    rst_n = 1;

    #10 shift_right = 0; // Shift left
    #10 shift_right = 1; // Shift right
    #20 $finish;
  end

  initial begin
    $monitor("At time %0t: shift_right=%b, data_out=%b", $time, shift_right, data_out);
  end
endmodule
