// Base (parent) class
class Packet;
    int addr;
    function new(int addr_in);
        this.addr = addr_in;
    endfunction
    function void display();
        $display("Base addr = 0x%0h", addr);
    endfunction
endclass

// Derived (child) class
class ExtPacket extends Packet;
    int data;
    function new(int addr_in, int data_in);
        super.new(addr_in);          // invoke base constructor
        this.data = data_in;
    endfunction
    function void display();
        $display("Child addr = 0x%0h, data = 0x%0h", addr, data);
    endfunction
endclass
