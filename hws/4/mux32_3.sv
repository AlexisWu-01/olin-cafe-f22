	
`timescale 1ns/1ps
`default_nettype none
/*
  Making 32 different inputs is annoying, so I use python:
  print(", ".join([f"in{i:02}" for i in range(32)]))
  The solutions will include comments for where I use python-generated HDL.
*/

module mux8(in00, in01, in02, in03, in04, in05, in06, in07, select, out);
	input wire [7:0] in00, in01, in02, in03, in04, in05, in06, in07; 
  input wire [2:0] select;
	output logic out;
  logic l1,l2
  mux4 mx4_1(
    .in0(in00);
    .in1(in01);
    .in2(in02);
    .in3(in03);
    .select(select[1:0]);
    .out(l1);
  );
  
  mux4 mx4_2(
    .in0(in04);
    .in1(in05);
    .in2(in06);
    .in3(in07);
    .select(select[1:0]);
    .out(l2);
  );

  // mux4 mx4_3(
  //   .in0 (in00);
  //   .in1 (in01);
  //   .in2 (in02);
  //   .in3 (in03);
  //   .select(1'b0, select[2]);
  //   .out(out);
  // );
endmodule

module mux4(
    in0, in1, in2, in3, select, out
);
input wire in0, in1, in2, in3;
input wire [1:0] select;
output logic out;

always @ (in0 | in1 |in2 | in3 | select) begin
case (select)
  2'b00 : out <= in0;
  2'b01 : out <= in1;
  2'b10 : out <= in2;
  2'b11 : out <= in3;
endcase
end
endmodule

// module mux8(
//   in00, in01, in02, in03, in04, in05, in06, in07, select, out
// );
// input wire [7:0] in00, in01, in02, in03, in04, in05, in06, in07;
// input wire [2:0] select;
// output logic out;

// endmodule

// module mux32(
//   in00, in01, in02, in03, in04, in05, in06, in07, in08, in09, in10, 
//   in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, 
//   in22, in23, in24, in25, in26, in27, in28, in29, in30, in31,
//   select,out
// );
// 	//parameter definitions
// 	parameter N = 1;
// 	//port definitions
//   // python: print(", ".join([f"in{i:02}" for i in range(32)]))
// 	input  wire [(N-1):0] in00, in01, in02, in03, in04, in05, in06, in07, in08, 
//     in09, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, 
//     in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
// 	input  wire [4:0] select;
// 	output logic [(N-1):0] out;

//   // We could construct it using 4 8:1 MUXes and then a 4:1 MUX




// endmodule
