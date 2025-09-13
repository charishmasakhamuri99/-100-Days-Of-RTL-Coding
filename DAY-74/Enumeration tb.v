package my_pkg;
// Fully define the enum in one scope--no forward declaration
typedef enum logic [3:0] {
  RED       = 0,
  GREEN     = 1,
  BLUE      = 2,
  SPECIAL10 = 10   // define 10 explicitly so assignment without cast is valid
} color_t;
endpackage

module testbench;
  import my_pkg::*;

  color_t c;

  initial begin
    // ✅ Valid assignments using defined values
    c = GREEN;
    $display("c = %s (%0d)", c.name(), c);

    c = SPECIAL10;
    $display("c = %s (%0d)", c.name(), c);

    // ✅ Explicit cast: you can assign 10 even if not defined as a named constant
    c = color_t'(10);
    $display("cast to 10: name=%s (%0d)", c.name(), c);

    // ❌ Would fail at compile time if 10 isn't a defined enumerator
    // c = 10;

    // Iteration example
