/*
  A pulse width modulation module 
*/

module pwm(clk, rst, ena, step, duty, out);

parameter N = 8;

input wire clk, rst;
input wire ena; // Enables the output.
input wire step; // Enables the internal counter. You should only increment when this signal is high (this is how we slow down the PWM to reasonable speeds).
input wire [N-1:0] duty; // The "duty cycle" input.
output logic out;

logic [N-1:0] counter;

// Create combinational (always_comb) and sequential (always_ff @(posedge clk)) 
// logic that drives the out signal.
// out should be off if ena is low.
// out should be fully zero (no pulses) if duty is 0.
// out should have its highest duty cycle if duty is 2^N-1;
// bonus: out should be fully zero at duty = 0, and fully 1 (always on) at duty = 2^N-1;
// You can use behavioural combinational logic, but try to keep your sequential
//   and combinational blocks as separate as possible.

always_ff @(posedge clk) begin
    if (rst) begin
      counter <= 0;
      out <= 0;
    end
    else if (~ena) out <= 0;
    else begin
    if (duty == 1'b0) out <= 1'b0;
    else if (duty == {N{1'b1}} ) out <= 1'b1;
    else begin
      if (step) begin
        counter <= (counter<{N{1'b1}}) ? counter+1'b1 : 1'b0;
      end
    end
    out <= (counter < duty) ? 1'b1 : 1'b0;
    end
  end



endmodule
