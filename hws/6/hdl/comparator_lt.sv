module comparator_lt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.
wire [N-1:0] sum;
wire c_out;
logic overflow;
always_comb overflow = a[N-1] ^ b[N-1];

logic [N-1:0] b_bar;
always_comb b_bar = ~b;

adder_n #(.N(N)) add(
    .a(a),
    .b(b_bar),
    .c_in(1'b1),
    .sum(sum),
    .c_out(c_out)
);


always_comb out = (~overflow & sum[N-1]) | ( overflow & (~(~a[N-1] & b[N-1]) | (a[N-1] & ~b[N-1])) );


endmodule
