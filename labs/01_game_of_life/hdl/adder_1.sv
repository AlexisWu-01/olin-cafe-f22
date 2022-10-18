`timescale 1ns/1ps
`default_nettype none
/*
  a 1 bit addder that we can daisy chain for 
  ripple carry adders
*/

module adder_1(a, b, c_in, sum, c_out);

input wire a, b, c_in;
output logic sum, c_out;

always_comb begin
  if (a & b) begin
    c_out = 1'b1;
    sum = c_in;
  end else if (a^b) begin
    c_out = c_in;
    sum = ~c_out;
  end else begin
    c_out = 1'b0;
    sum = c_in;
  end
end

endmodule