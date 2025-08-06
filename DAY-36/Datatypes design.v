// data_types.v
module data_types;
  reg [3:0] a;           // 4‑bit register variable
  integer b;             // signed 32‑bit integer
  real c;                // 64‑bit floating point
  time t;                // 64‑bit unsigned simulation time
  realtime rt;           // 64‑bit floating‑point time

  initial begin
    a = 4'b1010;
    b = -25;
    c = 3.1415;
    t = $time;
    rt = $realtime;

    $display("values at time %0t:", $time);
    $display("reg a       = %b", a);
    $display("integer b   = %0d", b);
    $display("real c      = %0f", c);
    $display("time t      = %0t", t);
    $display("realtime rt = %0t", rt);
  end
endmodule
