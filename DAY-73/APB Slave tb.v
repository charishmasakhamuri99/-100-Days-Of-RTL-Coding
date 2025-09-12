module apb_slave #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input  logic                  pclk,
    input  logic                  presetn,
    input  logic                  psel,
    input  logic                  penable,
    input  logic                  pwrite,
    input  logic [ADDR_WIDTH-1:0] paddr,
    input  logic [DATA_WIDTH-1:0] pwdata,
    output logic [DATA_WIDTH-1:0] prdata,
    output logic                  pready,
    output logic                  pslverr
);

    logic [DATA_WIDTH-1:0] reg_file [0:3];
    logic enable_d;

    always_ff @(posedge pclk or negedge presetn) begin
        if (!presetn)
            pready <= 1'b0;
        else
            pready <= penable;
    end

    always_ff @(posedge pclk or negedge presetn) begin
        if (!presetn) begin
            reg_file[0] <= '0;
            reg_file[1] <= '0;
            reg_file[2] <= '0;
            reg_file[3] <= '0;
        end
        else if (psel && penable && pwrite && pready) begin
            case (paddr[3:2])
                2'b00: reg_file[0] <= pwdata;
                2'b01: reg_file[1] <= pwdata;
                2'b10: reg_file[2] <= pwdata;
                2'b11: reg_file[3] <= pwdata;
            endcase
        end
    end

    always_ff @(posedge pclk or negedge presetn) begin
        if (!presetn)
            prdata <= '0;
        else if (psel && penable && !pwrite) begin
            case (paddr[3:2])
                2'b00: prdata <= reg_file[0];
                2'b01: prdata <= reg_file[1];
                2'b10: prdata <= reg_file[2];
                2'b11: prdata <= reg_file[3];
                default: prdata <= '0;
            endcase
        end
    end

endmodule
