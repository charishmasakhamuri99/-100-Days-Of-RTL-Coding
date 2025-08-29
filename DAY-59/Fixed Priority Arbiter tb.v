`timescale 1ns/1ps
module tb_fixed_pri_arbiter;
  parameter N = 4;
  reg [N-1:0] req;
  wire [N-1:0] grant;

  fixed_pri_arbiter #( .N(N) ) uut (
    .req(req),
    .grant(grant)
  );

  initial begin
    $display("Time | req -> grant");
    $monitor("%0dns | %b -> %b", $time, req, grant);

    // Sequential test cases
    req = 4'b0001; #5; // only bit1
    req = 4'b0010; #5; // bits 0 & 2 - expect grant 0001
    req = 4'b0100; #5; // only bits only
    req = 4'b1000; #5; // bits 1 & 3 - expect 0010
    req = 4'b1111; #5; // all bits - expect 0001 (LSB)
    $finish;
  end
endmodule
