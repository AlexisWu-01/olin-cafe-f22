`timescale 1ns/1ps
`default_nettype none


module practice(rst, clk, ena, seed, out);
input wire seed,ena,rst,clk;
output logic out;

logic mux_out;
logic xor_out;
logic [2:0] q;
always_comb mux_out = ena? xor_out: seed;

always_ff @(posedge clk) 
begin
    if(rst==1'b1)
        q[2] <= 1'b0; 
    else 
        q[2] <= mux_out; 
end
always_ff @(posedge clk)
begin
    if(rst==1'b1)
    q[1] <= 1'b0; 
    else 
    q[1] <= q[2]; 
end

always_comb xor_out = q[2] ^ q[1];
always_ff @(posedge clk)
begin
    if(rst==1'b1)
    q[0] <= 1'b0; 
    else 
    q[0] <= q[1]; 
end
always_comb out = q[0];
endmodule
