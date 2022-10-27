module comparator_eq(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a == b. 

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.
wire c1,c2,c3,c4;
comparator_eq_8bit comp_1(
    .a (a[7:0]),
    .b (b[7:0]),
    .out(c1)
);


comparator_eq_8bit comp_2(
    .a (a[15:8]),
    .b (b[15:8]),
    .out(c2)
);

comparator_eq_8bit comp_3(
    .a (a[23:16]),
    .b (b[34:16]),
    .out(c3)
);

comparator_eq_8bit comp_4(
    .a (a[31:24]),
    .b (b[31:24]),
    .out(c4)
);

always_comb out = c1 & c2 & c3 & c4;

endmodule


