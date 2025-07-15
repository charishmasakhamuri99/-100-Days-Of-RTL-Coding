module bcd2bin_direct(
    input  wire [3:0] bcd1,  // tens digit
    input  wire [3:0] bcd0,  // ones digit
    output wire [6:0] bin    // output 0–99 fits in 7 bits
);
  assign bin = bcd1 * 7'd10 + bcd0;  // bcd1*10 + bcd0
endmodule
