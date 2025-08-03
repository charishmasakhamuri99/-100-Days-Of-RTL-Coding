module tb;
  reg [3:0] data_in;
  reg [1:0] shift;
  reg dir;
  wire [3:0] data_out;

  barrel_shifter u1(.data_out(data_out), .data_in(data_in), .shift(shift), .dir(dir));

  initial begin
    $display("Left Shift Data:");
    data_in = 4'b1101; shift = 2'b00; dir = 0; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    data_in = 4'b1101; shift = 2'b01; dir = 0; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    data_in = 4'b1101; shift = 2'b10; dir = 0; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    data_in = 4'b1101; shift = 2'b11; dir = 0; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    $display("Right Shift Data:");
    data_in = 4'b1101; shift = 2'b00; dir = 1; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    data_in = 4'b1101; shift = 2'b01; dir = 1; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    data_in = 4'b1101; shift = 2'b10; dir = 1; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);

    data_in = 4'b1101; shift = 2'b11; dir = 1; #10;
    $display("data_in=%4b, shift=%2b, data_out=%4b", data_in, shift, data_out);
  end
endmodule
