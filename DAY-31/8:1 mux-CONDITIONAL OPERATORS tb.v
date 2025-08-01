`timescale 1ns/1ps

module mux8to1_tb;
  reg  [7:0] I;
  reg  [2:0] SEL;
  wire       Y;

  // Instantiate DUT
  mux8to1_cond uut (
    .I(I),
    .SEL(SEL),
    .Y(Y)
  );

  initial begin
    // Initialize
    I = 8'b10101010;
    SEL = 3'd0;
    #10;

    // Cycle through all select values
    repeat (8) begin
      #10 SEL = SEL + 1;
    end

    #10;
    $finish;
  end

  // Monitor
  initial begin
    $display("time SEL I       Y");
    $monitor("%4t  %b   %b   %b", $time, SEL, I, Y);
  end
endmodule
