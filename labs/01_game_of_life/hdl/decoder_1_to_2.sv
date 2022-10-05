module decoder_1_to_2(ena, in, out);

input wire ena;
input wire in;
output logic [1:0] out;

logic in_bar;

always_comb begin
    out[1] = ena & in;
    in_bar = ~ in;
    out[0] = in_bar & ena;
end

// //alternate
// always_comb out[0] = ~in & ena;

endmodule