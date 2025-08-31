module tb_logic;
  logic [3:0] data;
  logic enable;

  // No continuous assignments here
  initial begin
    // Enable VCD waveform dumping
    $dumpfile("tb_logic.vcd");  // Name of the waveform output file
    $dumpvars(0, tb_logic);     // Dump all variables in tb_logic

    data   = 4'hA;
    enable = 1'b0;
    $display("T=%0t: data=%0h, enable=%b", $time, data, enable);
    #5;
    enable = data;
    $display("T=%0t: data=%0h, enable=%b", $time, data, enable);
    #5;
  end
endmodule
