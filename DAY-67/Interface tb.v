// tb_packet.sv
`timescale 1ns/1ps
import packet_pkg::*;

module tb;
  Packet base_h;
  ExtPacket child_h;

  initial begin
    // Instantiate and test the base class
    base_h = new(32'HFACE_CAFE);
    base_h.display();  // Should display "[Base] addr = 0xfacecafe"

    // Instantiate and test the derived class
    child_h = new(32'HFEED_FEED, 32'HDEAD_BEEF);
    child_h.display(); // Should display "[Child] addr = ... data = ..."

    // Assign derived object to base handle (upcasting)
    base_h = child_h;
    base_h.display();  // Calls base class display(), since it's not virtual
    $finish;
  end
endmodule
