`timescale 1ns/1ps
module synchronous_fifo_tb;
  parameter DEPTH = 8;
  parameter DATA_WIDTH = 8;
  reg clk, rst_n, w_en, r_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full, empty;

  synchronous_fifo #(
    .DEPTH(DEPTH),
    .DATA_WIDTH(DATA_WIDTH)
  ) fifo_inst (
    .clk(clk),
    .rst_n(rst_n),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  always #5 clk = ~clk;

  initial begin
    $display("time\tclk\tw_en\tr_en\ttd_out\tempty\tfull");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, w_en, r_en, data_in, data_out, empty, full);
    rst_n = 1; w_en = 0; r_en = 0; data_in = 0;
    #10 rst_n = 0;
    #10 rst_n = 1;
    repeat (DEPTH) begin
      @(posedge clk);
      w_en = 1;
      data_in = $random;
    end
    @(posedge clk);
    w_en = 0;
    repeat (DEPTH) begin
      @(posedge clk);
      r_en = 1;
    end
    @(posedge clk);
    r_en = 0;
    repeat (4) begin
      @(posedge clk);
      w_en = 1; data_in = $random;
    end
    @(posedge clk);
    w_en = 0;
    repeat (4) begin
      @(posedge clk);
      r_en = 1;
    end
    @(posedge clk);
    r_en = 0;
    #20 $finish;
  end
endmodule
