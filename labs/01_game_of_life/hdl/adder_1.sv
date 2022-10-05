`timescale 1ns/1ps
`default_nettype none
/*
  a 1 bit addder that we can daisy chain for 
  ripple carry adders
*/

module adder_1(a, b, c_in, sum, c_out);

input wire a, b, c_in;
output logic sum, c_out;

logic sum1, c1;

always_comb begin
  sum1 = (a | b) & ~ (a & b); 
  c1 = a & b;
end

always_comb begin
  sum = (c_in | s)
end



endmodule
