`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"

module alu(a, b, control, result, overflow, zero, equal);
parameter N = 32; // Don't need to support other numbers, just using this as a constant.

input wire [N-1:0] a, b; // Inputs to the ALU.
input alu_control_t control; // Sets the current operation.
output logic [N-1:0] result; // Result of the selected operation.

output logic overflow; // Is high if the result of an ADD or SUB wraps around the 32 bit boundary.
output logic zero;  // Is high if the result is ever all zeros.
output logic equal; // is high if a == b.

// Use *only* structural logic and previously defined modules to implement an 
// ALU that can do all of operations defined in alu_types.sv's alu_op_code_t.

//   ALU_AND  = 4'b0001,
//   ALU_OR   = 4'b0010,
//   ALU_XOR  = 4'b0011,
//   ALU_SLL  = 4'b0101,
//   ALU_SRL  = 4'b0110,
//   ALU_SRA  = 4'b0111,
//   ALU_ADD  = 4'b1000,
//   ALU_SUB  = 4'b1100,
//   ALU_SLT  = 4'b1101,
//   ALU_SLTU = 4'b1111
logic AND, OR, XOR, SLL, SRL, ADD, SUB, SLT, SLTU;
always_comb AND = ~(control[3] | control[2] | control[1]) & control[0];
always_comb OR = ~(control[3] | control[2] | control[0]) & control[1];
always_comb XOR = ~(control[3] | control[2]) & control[1] & control[0];
always_comb SLL = ~(control[3] | control[1]) & control[2] & control[0];
always_comb SRL = ~(control[3] | control[0]) & control[2] & control[1];
always_comb SRA = ~ control[3] & control[2] & constrol[1] & control[0];
always_comb ADD = ~SRA;
always_comb SUB = ~XOR;
always_comb SLT = ~OR;
always_comb SLTU = control[3] & control[2] & constrol[1] & control[0];
    
logic [N-1:0] AND_res, OR_res, XOR_res, SLL_res, SRL_res, SRA_res, ADD_res, SUB_res, SLT_res, SLTU_res;

generate
    genvar i;
    for (i=0; i<N; i++) begin: and_calculation
        always_comb AND_res[i] = ~(a[i] ^ b[i]);
    end
endgenerate
    
generate
    genvar i;
    for (i=0; i<N;i++) begin: or_calculation
    always_comb OR_res[i] = a[i] | b[i];
    end
endgenerate


generate
    genvar i;
    for (i=0; i<N;i++) begin: xor_calculation
    always_comb XOR_res[i] = a[i] ^ b[i];
    end
endgenerate

// shift left 
shift_left_logical sll(
    .in(a),
    .shamt(b),
    .out(SLL_res)
);

//shift right logical
shift_right_logical srl(
    .in(a),
    .shamt(b),
    .out(SRL_res)
);


//shift right arithmetic
shift_right_arithmetic sra(
    .in(a),
    .shamt(b),
    .out(SRA_res)
);


// add 
adder_n addn(
    .a(a),
    .b(b),
    .c_in(0),
    .sum(ADD_res),
    .cout(overflow)
);

//subtract a from b
logic [N-1:0] b_bar;
addder_n subtractn(
    .a(a),
    .b(b_bar),
    .c_in(1'b1),
    .sum(SUB_res),
    .c_out()
);

//if a is less than b
comparator_lt compare(
    .a(a),
    .b(b),
    .out(SLT_res)
);


// compare unsigned values

generate
    genvar i;
    for (i=0; i<N;i++) begin: xor_calculation
    always_comb SLTU[i] = ~a[i] & b[i];
    end
endgenerate


// mux16 select_control(
//     .in00(1'b0),
//     .in01(AND_res),
//     .in02(OR_res),
//     .in03(XOR_res),
//     .in04(1'b0),
//     .in05(SLL_res),
//     .in06(SRL_res),
//     .in07(SRA_res),
//     .in08(ADD_res),
//     .in09(1'b0),
//     .in10(1'b0),
//     .in11(1'b0),
//     .in12(SUB_res),
//     .in13(SLT_res),
//     .in14(),
//     .in15(SLTU_res),
// )

endmodule