module comparator_eq_8bit(a,b,out);
    input wire [7:0] a,b;
    output logic out;

    logic [7:0] c;

    generate
        genvar i;
        for (i=0; i<8; i++) begin
           always_comb c[i] = ~ (a[i] ^ b[i]);
        end
    endgenerate

    always_comb out = c[0] & c[1] & c[2] & c[3] & c[4] & c[5] & c[6] & c[7];


endmodule