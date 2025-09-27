module tb_SR_FF_using_JK;
  reg clk, rst_n, S, R;
  wire Q;

  SR_FF_Using_JK uut (
    .clk(clk),
    .rst_n(rst_n),
    .S(S),
    .R(R),
    .Q(Q)
  );

  always #5 clk = ~clk;
  initial begin
    $dumpfile("srff_using_jkff_tb.vcd");
    $dumpvars(0, tb_SR_FF_using_JK);
    clk = 0; rst_n = 0; S = 0; R = 0;
    #10 S = 1; R = 0;
    // Test: S=1, R=0 (Set)
    #10 S = 1; R = 0;
    #10 S = 0; R = 1;
    // Test: S=0, R=1 (Reset)
    #10 S = 0; R = 1;
    // Test: S=1, R=1 (Invalid in SR, toggle in JK)
    #10 S = 1; R = 1;
    #10 S = 1; R = 1;
    // Test again with different patterns if required
    #10 $finish;
  end
endmodule
