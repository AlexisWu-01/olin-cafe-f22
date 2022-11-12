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
    
logic [N-1:0] AND_res, OR_res, XOR_res, SLL_res, SRL_res, SRA_res, ADD_res, SUB_res;
logic SLT_res,  SLTU_res;

    
always_comb AND_res = a & b;


always_comb OR_res = a|b;

always_comb XOR_res = a ^ b;

logic shift_too_much;
logic [N-1:0] left_shift, right_shift_l, right_shift_a;

// comparator_lt compare_31(
//     .a(32'd31),
//     .b(b),
//     .out(shift_too_much)
// );

//I tried several compare modules, but been getting overflow issues of the output.
always_comb shift_too_much = (b > 31);

// shift left 
shift_left_logical sll(
    .in(a),
    .shamt(b),
    .out(left_shift)
);
always_comb SLL_res = shift_too_much? 32'b0 : left_shift;


//shift right logical
shift_right_logical srl(
    .in(a),
    .shamt(b),
    .out(right_shift_l)
);
always_comb SRL_res = shift_too_much? 32'b0 : right_shift_l;

//shift right arithmetic
shift_right_arithmetic sra(
    .in(a),
    .shamt(b),
    .out(right_shift_a)
);

always_comb SRA_res = shift_too_much? 32'b0 : right_shift_a;



// add 
adder_n #(.N(N)) addn(
    .a(a),
    .b(b),
    .c_in(1'b0),
    .sum(ADD_res),
    .c_out()
);

//subtract a from b
logic [N-1:0] b_bar;
logic comp;

// logic [N-1:0] sub;
always_comb b_bar = ~b;
adder_n #(.N(N)) subtraction(
    .a(a),
    .b(b_bar),
    .c_in(1'b1),
    .sum(SUB_res),
    .c_out(comp)
);

always_comb SLTU_res = ~comp;


// assign SUB_res = {overflow_sub,sub};

//if a is less than b
comparator_lt compare(
    .a(a),
    .b(b),
    .out(SLT_res)
);



mux16 #(.N(N)) select_control(
    .in00(32'b0),
    .in01(AND_res),
    .in02(OR_res),
    .in03(XOR_res),
    .in04(32'b0),
    .in05(SLL_res),
    .in06(SRL_res),
    .in07(SRA_res),
    .in08(ADD_res),
    .in09(32'b0),
    .in10(32'b0),
    .in11(32'b0),
    .in12(SUB_res),
    .in13(SLT_res),
    .in14(32'b0),
    .in15(SLTU_res),
    .select(control),
    .out(result)
);

always_comb zero = ~(|result);
logic [N-1:0] compare_bit;
always_comb compare_bit = ~ (a^b);
always_comb equal = & compare_bit;

endmodule