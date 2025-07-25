`timescale 1ns/1ps
module tb_logical_ops;
  reg  [7:0] in1, in2;
  wire       y_and, y_or, y_not1, y_logic;

  logical_ops uut (
    .in1(in1),
    .in2(in2),
    .y_and(y_and),
    .y_or(y_or),
    .y_not1(y_not1),
    .y_logic(y_logic)
  );

  initial begin
    $display("time in1  in2  y_and y_ora  y_not1 y_logic");
    in1 = 8'h45; in2 = 8'h09; #5;
    $display("%0t %h %h    %b    %b     %b      %b", $time, in1, in2, y_and, y_or, y_not1, y_logic);

    in1 = 8'h00; in2 = 8'h04; #5;
    $display("%0t %h %h    %b    %b     %b      %b", $time, in1, in2, y_and, y_or, y_not1, y_logic);

    in1 = 8'hX0; in2 = 8'h03; #5;
    $display("%0t %h %h    %b    %b     %b      %b", $time, in1, in2, y_and, y_or, y_not1, y_logic);

    in1 = 8'hZ1; in2 = 8'h00; #5;
    $display("%0t %h %h    %b    %b     %b      %b", $time, in1, in2, y_and, y_or, y_not1, y_logic);

    in1 = 8'h05; in2 = 8'h05; #5;
    $display("%0t %h %h    %b    %b     %b      %b", $time, in1, in2, y_and, y_or, y_not1, y_logic);

    $finish;
  end
endmodule
