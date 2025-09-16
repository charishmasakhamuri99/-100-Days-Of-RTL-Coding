class transaction;
    rand bit [7:0] addr;
    rand bit [7:0] data;
    rand bit       write;

    function void display(string tag="");
        $display("%sTransaction: addr=0x%0h data=0x%0h write=%0b", tag, addr, data, write);
    endfunction
endclass

module tb_mailbox_transaction;
    mailbox #(transaction) tx_mbx = new();
    task automatic generator();
        transaction t;
        repeat (5) begin
            t = new();
            assert(t.randomize());
            $display("[GEN] Producing transaction:");
            t.display("[GEN] ");
            tx_mbx.put(t);  // send transaction object to mailbox
            #10;
        end
    endtask

    task automatic driver();
        transaction t;
        repeat (5) begin
            tx_mbx.get(t);  // retrieve transaction object from mailbox
            $display("[DRV] Received transaction:");
            t.display("[DRV] ");
            #7;
        end
    endtask

    initial begin
        fork
            generator();
            driver();
        join
        $finish;
    end
endmodule
