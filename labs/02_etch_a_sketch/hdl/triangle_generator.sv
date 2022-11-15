
// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N:0] out;

typedef enum logic {COUNTING_UP , COUNTING_DOWN} state_t;
state_t state;

always_ff @(posedge clk) begin
    if (rst) begin
        out <= 0;
         state <= COUNTING_UP;
    end

    else if (~ena) begin
        out <= out;
    end

    else begin
    case(state)
        COUNTING_UP: begin
            out <= out + 1'b1;
            if (out == {N{1'b1}} - 1'b1) state <= COUNTING_DOWN;
        end
        COUNTING_DOWN:begin
            out <= out - 1'b1;
            if (out == 0) state <= COUNTING_UP;
        end

    endcase
       
    end
end


endmodule