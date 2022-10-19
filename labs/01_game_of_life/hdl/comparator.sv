`default_nettype none
`timescale 1ns/1ps

module comparator (a,b,out);
// if a>=b: c_out = 0
// if a<b: c_out = 1 (b/c overflow)

parameter N = 32;

input wire [N-1:0] a,b
output wire out;

wire [N-1:0] subtracter;
assign subtracter = ~ b;

adder_n COMPARE
(
    .a(a),
    .b(subtracter),
    .c_in(1'b1),
    .sum(),
    .c_out(out)
);


endmodule
