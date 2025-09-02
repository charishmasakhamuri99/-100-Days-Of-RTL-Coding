`timescale 1ns/1ps

module packed_struct_example;
  typedef struct packed {
    bit [7:0] addr;     // 8-bit address
    bit       valid;    // 1-bit flag
    bit [31:0] data;    // 32-bit data field
  } mem_pkt_t;

  mem_pkt_t pkt;

  initial begin
    pkt = '{8'h6, 1'b1, 32'hC001_0FAB};
    $display("INIT pkt = %p", pkt);

    pkt.addr = 8'h8;
    $display("UPDATED addr pkt = %p", pkt);

    pkt.valid = 1'b0;
    pkt.data  = 32'hFFF_FF0FF;
    $display("UPDATED valid+data pkt = %p", pkt);
  end
endmodule

module tb_packed_struct_example;
  // Instantiate the DUT
  packed_struct_example dut();

  initial begin
    // Enable waveform generation
    $dumpfile("packed_struct_example.vcd");
    $dumpvars(0, tb_packed_struct_example);

    $display("\n--- Starting packed struct testbench ---");
    #5; // Allow time for DUT to run
    $display("--- Testbench completed ---");
    $finish;
  end
endmodule
