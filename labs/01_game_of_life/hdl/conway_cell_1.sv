`default_nettype none
`timescale 1ns/1ps

module adder(a, b, c_in, sum, c_out);
    input wire a, b, c_in;
    output logic sum, c_out;

    always_comb begin
        if (a & b & c_in) begin
            sum = a & b & c_in;
            c_out = sum;
            end else begin
                sum = (~a & ~b & c_in) | (~a & b & ~c_in) | (a & ~ b & ~c_in);
                c_out = ~sum;
            end
    end
endmodule

module cla_adder_2 (A, B, Cin, Sum, Cout);
parameter N = 1; 
input  wire [N-1:0] A, B;
input wire Cin;
output logic [N-1:0] Sum;
output logic Cout;
wire [N-1:0] G, P;
wire [N:0] C;
assign C[0] = Cin;

generate
    genvar i;
    for (i = 0; i < N; i++) begin
        adder_1 full_adder_inst(
            .a(A[i]),
            .b(B[i]),
            .c_in(C[i]),
            .sum(Sum[i]),
            .c_out()
        );
    end
endgenerate

generate
    genvar j;
    for (j = 0; j < N; j++) begin
        assign G[j] = A[j] & B[j];
        assign P[j] = A[j] | B[j];
        assign C[j+1] = G[j] | (P[j] & C[j]);
    end
endgenerate

assign Cout = C[N];
endmodule


module cla_adder_4 (A, B, D, E, Sum, Cout);
parameter N = 1;
input  wire [N-1:0] A, B, D, E;
output logic [N-1:0] Sum;
output logic Cout;
wire [N-1:0] G, P;
wire [N:0] C;
wire adder_0_out, adder_1_out, adder_0_sum, adder_1_sum;
cla_adder_2 #(.N(N)) ADDER_0 ( .A (A), .B(B), .Sum(adder_0_sum), .Cout(adder_0_out));
cla_adder_2 #(.N(N)) ADDER_1 ( .A (D), .B(E), .Sum(adder_1_sum), .Cout(adder_1_out));
cla_adder_2 #(.N(N)) ADDER_SUM ( .A (adder_0_sum), .B(adder_1_sum), .Sum(Sum));
cla_adder_2 #(.N(N)) ADDER_OUT ( .A (adder_0_out), .B(adder_1_out), .Cout(Cout));
endmodule

module cla_adder_8 (A, B, D, E, F, H, I, J, Sum, Cout);
parameter N = 1;
input  wire [N-1:0] A, B, D, E, F, H, I, J;
output logic [N-1:0] Sum;
output logic Cout;
wire [N-1:0] G, P;
wire [N:0] C;
wire adder_0_out, adder_1_out, adder_0_sum, adder_1_sum;
cla_adder_4 #(.N(N)) ADDER_0 ( .A (A), .B(B), .D(D), .E(E), .Cout(adder_0_out));
cla_adder_4 #(.N(N)) ADDER_1 ( .A (F), .B(H), .D(I), .E(J), .Cout(adder_1_out));
cla_adder_2 #(.N(N)) ADDER_SUM ( .A (adder_0_sum), .B(adder_1_sum), .Sum(Sum));
cla_adder_2 #(.N(N)) ADDER_OUT ( .A (adder_0_out), .B(adder_1_out), .Cout(Cout));
endmodule


module conway_cell(clk, rst, ena, state_0, state_d, state_q, neighbors);
parameter N = 1;
input wire clk;
input wire rst;
input wire ena;
input wire [(N-1):0] neighbors;
input wire state_0;
output logic state_d; // NOTE - this is only an output of the module for debugging purposes. 
output logic state_q;
output logic [N-1:0] Sum;
output logic Cout;
//localparam LIVE = 1, DEAD = 1;

cla_adder_8 #(.N(N)) add_neighbors(
    .A (neighbors[0]), .B(neighbors[1]), .D (neighbors[2]), .E(neighbors[3]), 
    .F (neighbors[4]), .H(neighbors[5]), .I (neighbors[6]), .J(neighbors[7]), 
    .Sum(Sum), .Cout(Cout)
);


always_comb begin
    if (state_q == 1) begin
        if (Sum == 2 | Sum == 3) begin
                state_d = 1;
            end else begin
                state_d = 0;
            end
    end 
    if (state_q == 0) begin
        if (Sum == 3) begin
            state_d = 1;
        end else begin
            state_d = 0;
        end
    end
end


always_ff @(posedge clk) begin
    if (rst) begin
        state_q <= state_0;
    end else if (ena) begin
        state_q <= state_d;
    end else begin
        state_q <= state_q;
    end
end 


endmodule