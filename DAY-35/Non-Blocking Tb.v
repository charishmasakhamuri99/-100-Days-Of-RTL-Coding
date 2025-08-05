`timescale 1ns/1ps

module nonblocking_tb;
  wire x, y, z;

  nonblocking uut (
    .x(x),
    .y(y),
    .z(z)
  );

  initial begin
    $dumpfile("nonblocking.vcd");
    $dumpvars(0, nonblocking_tb);

    // Wait till assignments propagate
    #1; // Allow end‑of‑time‑step updates to occur
    $display("After #1: x=%0d, y=%0d, z=%0d", x, y, z);
    // Expected: x=1, y=0, z=0 (x updated, but y and z reflect old x/y)

    #0; // Advance simulation without delay
    $display("At same time still: x=%0d, y=%0d, z=%0d", x, y, z);

    #0; // Force all updates with explicit delta step

    $finish;
  end
endmodule
