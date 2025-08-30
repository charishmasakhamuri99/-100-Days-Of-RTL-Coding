`timescale 1ns/1ps

module tb_round_robin_arbiter;
  parameter N = 4;
  reg clk = 0, rst_n;
  reg [N-1:0] req;
  wire [N-1:0] grant;

  round_robin_arbiter #(N) uut (
    .clk(clk), .rst_n(rst_n), .req(req), .grant(grant)
  );

  always #5 clk = ~clk;

  initial begin
    $display("Time | req -> grant");
    $monitor("%0dns | %b -> %b", $time, req, grant);

    rst_n = 0; req = 0; #10;
    rst_n = 1;

    // Test simultaneous requests
    req = 4'b1111; #10; // grant: 0001
    req = 4'b1111; #10; // grant: 0010
    req = 4'b1111; #10; // grant: 0100
    req = 4'b1111; #10; // grant: 1000

    // Change request pattern
    req = 4'b1010; #10; // grant: 0010
    req = 4'b1100; #10; // grant: 0100

    // No requests
    req = 4'b0000; #10; // grant: 0000

    // Late request comes
    req = 4'b1001; #10;
    #10;

    $finish;
  end
endmodule
