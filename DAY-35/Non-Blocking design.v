// nonblocking.v
module nonblocking (
  output reg x, y, z
);

  initial begin
    // Schedule non‑blocking updates all at time = 0
    x <= 1;
    y <= x;
    z <= y;
    $display("At time %0t: non‑blocking scheduled — x, y, z sample old values", $time);
  end
endmodule
