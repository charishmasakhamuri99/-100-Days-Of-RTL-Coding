module synchronous_fifo #(
  parameter DEPTH = 8,
  parameter DATA_WIDTH = 8
) (
  input wire clk,
  input wire rst_n,
  input wire w_en,
  input wire r_en,
  input wire [DATA_WIDTH-1:0] data_in,
  output reg [DATA_WIDTH-1:0] data_out,
  output wire full,
  output wire empty
);

  // Calculate number of bits needed to index the FIFO
  localparam PTR_WIDTH = $clog2(DEPTH);

  reg [PTR_WIDTH-1:0] w_ptr, r_ptr;
  reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

  // Synchronous reset for pointers and data_out
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      w_ptr <= 0;
      r_ptr <= 0;
      data_out <= 0;
    end else begin
      // Write logic
      if (w_en && !full) begin
        mem[w_ptr] <= data_in;
        w_ptr <= w_ptr + 1;
      end
      // Read logic
      if (r_en && !empty) begin
        data_out <= mem[r_ptr];
        r_ptr <= r_ptr + 1;
      end
    end
  end

  // Full when write pointer one ahead of read pointer
  assign full = ((w_ptr + 1'b1) == r_ptr);
  assign empty = (w_ptr == r_ptr);

endmodule
