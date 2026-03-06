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











`timescale 1ns/1ps

module tb_bd;

parameter N = 8;

reg in;
reg clk;
reg en;
reg dir;
reg rst;

wire [N-1:0] out;

// Instantiate the design
bd #(N) dut (
  .in(in),
  .clk(clk),
  .en(en),
  .dir(dir),
  .rst(rst),
  .out(out)
);

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin

  clk = 0;
  rst = 0;
  en  = 0;
  dir = 0;
  in  = 0;

  // Apply reset
  #10 rst = 1;
  en = 1;

  // Shift right
  dir = 0;
  in = 1; #10;
  in = 0; #10;
  in = 1; #10;
  in = 1; #10;

  // Shift left
  dir = 1;
  in = 0; #10;
  in = 1; #10;
  in = 0; #10;

  #20 $finish;

end

// Monitor output
initial begin
  $monitor("time=%0t rst=%b en=%b dir=%b in=%b out=%b",
            $time, rst, en, dir, in, out);
end

endmodule
