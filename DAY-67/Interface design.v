// packet_pkg.sv
package packet_pkg;

  // Base class definition
  class Packet;
    int addr;

    // Constructor
    function new(int addr_p);
      this.addr = addr_p;
    endfunction

    // Display method
    function void display();
      $display("[Base] addr = 0x%0h", addr);
    endfunction
  endclass

  // Derived class inherits from Packet
  class ExtPacket extends Packet;
    int data;

    // Constructor must call super.new()
    function new(int addr_p, int data_p);
      super.new(addr_p);
      this.data = data_p;
    endfunction

    // Override the display method
    function void display();
      $display("[Child] addr = 0x%0h, data = 0x%0h", addr, data);
    endfunction
  endclass

endpackage: packet_pkg
