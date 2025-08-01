// Code your design here
module mux8to1_cond (
  input  wire [7:0] I,      // 8 inputs: I[7:0]
  input  wire [2:0] SEL,    // select: 3‑bit
  output wire       Y       // single‑bit output
);

  assign Y = (SEL == 3'd0) ? I[0] :
             (SEL == 3'd1) ? I[1] :
             (SEL == 3'd2) ? I[2] :
             (SEL == 3'd3) ? I[3] :
             (SEL == 3'd4) ? I[4] :
             (SEL == 3'd5) ? I[5] :
             (SEL == 3'd6) ? I[6] :
                              I[7] ;
endmodule
