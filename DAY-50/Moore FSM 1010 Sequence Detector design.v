module seq_detector_1010 (
  input logic clk,
  input logic rst_n,
  input logic x,
  output logic z
);
  typedef enum logic [2:0] {A,B,C,D,E} state_t;
  state_t state, next_state;

  // State register with synchronous reset
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      state <= A;
    else
      state <= next_state;
  end

  // Next-state logic (Moore FSM)
  always_comb begin
    case (state)
      A: next_state = x ? B : A;
      B: next_state = x ? B : C;
      C: next_state = x ? D : A;
      D: next_state = x ? B : E;
      E: next_state = x ? B : A;
      default: next_state = A;
    endcase
  end

  // Output logic depends only on current state
  always_comb z = (state == E);
endmodule
