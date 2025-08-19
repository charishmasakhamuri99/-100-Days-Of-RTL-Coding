// master_slave_jk_ff.sv
module master_slave_jk_ff(
    input  logic clk,
    input  logic rstn,    // synchronous active-low reset
    input  logic j,
    input  logic k,
    output logic q,
    output logic qn
);

    logic mL_q;

    // Master latch: active when clk=1
    always_ff @(posedge clk) begin
        if(!rstn)
            mL_q <= 0;
        else begin
            case ({j, k})
                2'b00: mL_q <= mL_q;     // hold
                2'b01: mL_q <= 0;        // reset
                2'b10: mL_q <= 1;        // set
                2'b11: mL_q <= ~mL_q;    // toggle
            endcase
        end
    end

    // Slave latch: active when clk=0
    always_ff @(negedge clk) begin
        if(!rstn)
            q <= 0;
        else
            q <= mL_q;
    end

    assign qn = ~q;

endmodule
