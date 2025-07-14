module seq_detector_1010 (
    input wire clk,
    input wire rst_n,  // active-low reset
    input wire x,      // serial input
    output wire z      // asserted when "1010" detected
);

    // State encoding
    localparam A = 2'd0,
               B = 2'd1,
               C = 2'd2,
               D = 2'd3;
    reg [1:0] state, next_state;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= A;
        else
            state <= next_state;
    end

    // Combinational next state + output
    always @(*) begin
        next_state = A;
        case (state)
            A: next_state = x ? B : A;
            B: next_state = x ? B : C;
            C: next_state = x ? D : A;
            D: next_state = x ? B : C;
        endcase
    end

    // Mealy output: asserted when in state D and input x = 0
    assign z = (state == D) && (x == 1'b0);

endmodule
