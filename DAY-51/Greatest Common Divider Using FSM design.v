// Right Side: GCD FSM Module

module gcd_fsm(
    input wire clk, rst, start,
    input wire [7:0] a_in, b_in,
    output reg [7:0] gcd,
    output reg done
);

    typedef enum reg [1:0] {IDLE, LOAD, COMPARE, DONE} state_t;
    state_t state, next_state;
    reg [7:0] a, b;

    always @(posedge clk or posedge rst)
        if (rst) state <= IDLE;
        else state <= next_state;

    always @(*)
        case (state)
            IDLE:      next_state = start ? LOAD : IDLE;
            LOAD:      next_state = COMPARE;
            COMPARE:   next_state = (a == b) ? DONE : COMPARE;
            DONE:      next_state = IDLE;
            default:   next_state = IDLE;
        endcase

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a <= 0; b <= 0; gcd <= 0; done <= 0;
        end else begin
            case (state)
                IDLE:    done <= 0;
                LOAD:    begin a <= a_in; b <= b_in; end
                COMPARE: if (a < b) b <= b - a; else if (b < a) a <= a - b;
                DONE:    begin gcd <= a; done <= 1; end
            endcase
        end
    end
endmodule
