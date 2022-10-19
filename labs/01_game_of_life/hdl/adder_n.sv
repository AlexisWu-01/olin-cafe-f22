`timescale 1ns/1ps
`default_nettype none
// `include "cla_adder_1.sv"


module adder_n(a, b, c_in, sum, c_out);

parameter N = 32;

input  wire [N-1:0] a, b;
input wire c_in;
output logic [N-1:0] sum;
output logic c_out;


wire [N-1:0] G, P;
wire [N:0] C;

assign C[0] = c_in;

generate
    genvar i;
    for (i=0;i<N;i++) begin
        adder_1 full_adder_inst(
            .a(a[i]),
            .b(b[i]),
            .c_in(C[i]),
            .sum(sum[i]),
            .c_out()
        );
    end
endgenerate

generate
    genvar j;
    for (j=0;j<N;j++) begin
        assign G[j] = a[j] & b[j];
        assign P[j] = a[j] | b[j];
        assign C[j+1] = G[j] | (P[j] & C[j]);
    end

endgenerate

assign c_out = C[N];


endmodule