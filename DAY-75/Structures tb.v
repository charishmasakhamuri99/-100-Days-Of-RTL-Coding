// structs_demo.sv
`timescale 1ns/1ns
module structs_demo_tb;
  typedef struct {
    string fruit;
    int    count;
    byte   expiry;
  } fruit_t;
  typedef struct packed {
    bit [3:0] mode;
    bit [2:0] cfg;
    bit       en;
  } ctrl_t;
  fruit_t fruit1, fruit2;
  ctrl_t  ctrl_reg;

  initial begin
    $display("=== Unpacked Struct Demo ===");
    fruit1 = '{ "apple", 4, 15 };
    // Implicit init of fruit2 is zero/default
    $display("fruit1 = %p, fruit2 = %p", fruit1, fruit2);

    // Copy assigns by value
    fruit2 = fruit1;
    $display("After copy: fruit1 = %p, fruit2 = %p", fruit1, fruit2);

    // Modify fruit1 field
    fruit1.fruit = "orange";
    $display("After change: fruit1 = %p, fruit2 = %p", fruit1, fruit2);

    $display("=== Packed Struct Demo ===");
    // Initialize packed struct via pattern
    ctrl_reg = '{ 4'ha, 3'h5, 1'b1 };
    $display("ctrl_reg init = %p", ctrl_reg);

    // Update individual field
    ctrl_reg.mode = 4'h3;
    $display("ctrl_reg mode changed = %p", ctrl_reg);

    // Full vector assignment
    ctrl_reg = 8'hFA;
    $display("ctrl_reg vector assign = %p", ctrl_reg);

    #5 $finish;
  end
endmodule
