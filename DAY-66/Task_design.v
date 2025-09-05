module reverse_bits_task(
  input  logic        clk,
  input  logic        reset_n,
  input  logic [7:0]  din,
  output logic [7:0]  dout
);
  // Define an automatic task to reverse bits with a 1-cycle delay
  task automatic reverse_bits(
    input  logic [7:0] src,
    output logic [7:0] dst
  );
    integer k;
    begin
      #0; // ZERO cycle delay for combinational behavior (optional)
      for (k = 0; k < 8; k = k + 1)
        dst[k] = src[7 - k];
      @(posedge clk); // introduce 1-cycle latency
    end
  endtask

  always_ff @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      dout <= 0;
    else
      reverse_bits(din, dout);
  end
endmodule

