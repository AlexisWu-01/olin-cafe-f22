`default_nettype none
`timescale 1ns/1ps

module conway_cell(clk, rst, ena, state_0, state_d, state_q, neighbors);
input wire clk;
input wire rst;
input wire ena;
input wire [7:0] neighbors;
input wire state_0;
output logic state_d; // NOTE - this is only an output of the module for debugging purposes. 
output logic state_q;
<<<<<<< HEAD
output logic [4:0] Sum;
output logic Cout;

/*
cla_adder #(.N(N)) add_neighbors(
    .A (neighbors[0]), .B(neighbors[1]), .D (neighbors[2]), .E(neighbors[3]), 
    .F (neighbors[4]), .H(neighbors[5]), .I (neighbors[6]), .J(neighbors[7]), 
    .Sum(Sum), .Cout(Cout)
);
*/
wire [4:0] adder_0_out, adder_1_out, adder_2_out, adder_3_out, adder_4_out, adder_5_out, adder_6_out;
wire [4:0] adder_0_sum, adder_1_sum, adder_2_sum, adder_3_sum, adder_4_sum, adder_5_sum, adder_6_sum;
adder_n #(.N(4)) adder_0(.a(neighbors[0]), .b(neighbors[1]), .c_in(state_0), .sum(adder_0_sum), .c_out(adder_0_out));
adder_n #(.N(4)) adder_1(.a(neighbors[2]), .b(adder_0_sum), .c_in(adder_0_out), .sum(adder_1_sum), .c_out(adder_1_out));
adder_n #(.N(4)) adder_2(.a(neighbors[3]), .b(adder_1_sum), .c_in(adder_1_out), .sum(adder_2_sum), .c_out(adder_2_out));
adder_n #(.N(4)) adder_3(.a(neighbors[4]), .b(adder_2_sum), .c_in(adder_2_out), .sum(adder_3_sum), .c_out(adder_3_out));
adder_n #(.N(4)) adder_4(.a(neighbors[5]), .b(adder_3_sum), .c_in(adder_3_out), .sum(adder_4_sum), .c_out(adder_4_out));
adder_n #(.N(4)) adder_5(.a(neighbors[6]), .b(adder_4_sum), .c_in(adder_4_out), .sum(adder_5_sum), .c_out(adder_5_out));
adder_n #(.N(4)) adder_6(.a(neighbors[7]), .b(adder_5_sum), .c_in(adder_5_out), .sum(adder_6_sum), .c_out(adder_6_out));
assign Sum = adder_6_sum;
assign Cout = adder_6_out;

logic condition1, condition2;
always_comb begin
    condition1 = (~Sum[0]) & Sum[1] & (~Sum[2]) & (~Sum[3]); // Sum == 2
    condition2 = Sum[0] & Sum[1] & (~Sum[2]) & (~Sum[3]); // Sum == 3
    state_d = (state_q & condition1) | (state_q & condition2) | (~state_q & condition2);
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
=======

input wire [7:0] neighbors;

wire c_in;
wire [3:0] a,b;
wire [7:0] sum;

wire c_out;
wire alive_neighbors;

logic next_state;

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

wire equal_3;
wire greater_than_3;

comparator COMPARE_3(
    .a(alive_neighbors),
    .b(3),
    .equal(equal_3),
    .less(),
    .great(greater_than_3)
);

wire less_than_2;

comparator COMPARE_2(
    .a(alive_neighbors),
    .b(2),
    .equal(),
    .less(less_than_2),
    .great()
);

assign next_state = equal_3 | (state_0  & ~less_than_2) | (state_0 & ~ greater_than_3)
assign state_d = ~rst ? (ena ? next_state : state_q) : state_0; // enable & rst

  always_ff @(posedge clk ) begin
    state_q <= state_d;
  end
>>>>>>> 2c7ba2b2f782eb1086e67630d45694996ef35af3

endmodule