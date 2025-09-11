module tb;
  logic clk;
  logic [7:0] data_in;
  logic enable;

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;  // 10 ns period

  // Clocking block declaration
  clocking cb @(posedge clk);
    default input #1ns output #2ns;
    input data_in;
    output enable;
  endclocking

  initial begin
    // Drive outputs with nonblocking assignments
    cb.enable <= 1'b0;
    @(cb);
    cb.enable <= 1'b1;
    @(cb);

    // Sample inputs synchronously with clock event
    $display("At time %0t, data_in sampled=%0h", $time, cb.data_in);

    $finish;
  end
endmodule
