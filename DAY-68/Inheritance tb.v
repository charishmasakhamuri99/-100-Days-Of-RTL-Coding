module tb_inherit;
    Packet    p_base;
    ExtPacket p_ext;

    initial begin
        // Base-class instantiation
        p_base = new(32'hDEAD_BEEF);
        p_base.display();     // calls Packet.display()

        // Derived-class instantiation
        p_ext = new(32'hFEED_FACE, 32'h1234);
        p_ext.display();      // calls ExtPacket.display()
    end
endmodule
