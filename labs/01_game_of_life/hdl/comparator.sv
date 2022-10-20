`default_nettype none
`timescale 1ns/1ps

module comparator (a,b,equal,less,great);

parameter N = 4;

input wire [N-1:0] a,b
output wire equal;
output wire less;
output wire great;

wire [N-1:0] subtracter;
wire [N-1:0] sum;
assign subtracter = ~ b;

adder_n COMPARE
(
    .a(a),
    .b(subtracter),
    .c_in(1'b1),
    .sum(sum),  
    .c_out()
);

assign equal = ~sum;
assign less = sum[N-1];
assign great = ~less;

endmodule
