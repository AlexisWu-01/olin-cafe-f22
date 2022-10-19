`default_nettype none
`timescale 1ns/1ps

module conway_cell(clk, rst, ena, state_0, state_d, state_q, neighbors);
input wire clk;
input wire rst;
input wire ena;

input wire state_0;
output logic state_d; // NOTE - this is only an output of the module for debugging purposes. 
output logic state_q;

input wire [7:0] neighbors;

wire c_in;
wire [3:0] a,b;
wire [7:0] sum;
wire c_out;
wire alive_neighbors;

assign a = neighbors[3:0]
assign b = neighbors[7:4]
assign c_in = 0;


adder_n ADDER(
    .a(a),
    .b(b),
    .c_in(c_in),
    .sum(sum),
    .c_out(c_out)
);

assign alive_neighbors = {c_out,sum};

wire less_than;

comparator COMPARE(
    .a()
)

always_comb begin : compare
    if ()
    
end


endmodule