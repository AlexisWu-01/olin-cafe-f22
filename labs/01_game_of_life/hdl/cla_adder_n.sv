`include "adder_1.sv"

`timescale 1ns/1ps
`default_nettype none
// `include "cla_adder_1.sv"


module cla_adder_n(a, b, out);

parameter N = 32;

input  wire [N-1:0] a, b;
output logic out;

wire [N:0] C;
wire [N-1:0] G, P, SUM;

assign C[0] = 1'b0;

generate
    genvar i;
    for (i=0;i<N;i++) begin
        adder_1 full_adder_inst(
            .a(a[i]),
            .b(b[i]),
            .c_in(C[i]),
            .sum(SUM[i]),
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

assign out = {C[N],SUM};

endmodule