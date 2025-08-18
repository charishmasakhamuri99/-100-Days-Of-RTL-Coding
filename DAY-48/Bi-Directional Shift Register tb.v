`timescale 1ns/1ps
module tb_sr;
  parameter MSB = 16;
  logic data, clk, en, dir, rstn;
  logic [MSB-1:0] out;

  shift_reg #(MSB) uut (
    .d(data),
    .clk(clk),
    .en(en),
    .dir(dir),
    .rst(rstn),
    .out(out)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0; data = 0; en = 0; dir = 0; rstn = 0;
    #20;
    rstn = 1; en = 1;
    repeat (7) @(posedge clk) data <= ~data;
    #10 dir = 1;
    repeat (7) @(posedge clk) data <= ~data;
    repeat (7) @(posedge clk);
    $finish;
  end

  initial
    $monitor("%0t rstn=%b en=%b dir=%b data=%b out=%b",
             $time, rstn, en, dir, data, out);
endmodule
