`timescale 1ns / 1ps // time
`default_nettype none 

`define SIMULATION

module test_decoders_2_4;
  logic ena;
  logic [1:0] in;
  wire [3:0] out;

decoder_2_to_4 UUT(ena, in, out); //UNT: unit under test

//   decoder_2_to_4 UUT(
//     // .name_of_module_port(name_of_local_wire_or_logic)
//     // to avoid confusion aout which port is which
//     .ena(ena), 
//     .in(in), 
//     .out(out)); //UNT: unit under test

  initial begin // instandard programming land (line by line executation)
    // Collect waveforms
    $dumpfile("decoders_2_4.fst");
    $dumpvars(0, UUT);
    
    ena = 1;
    $display("ena in | out");
    for (int i = 0; i < 4; i = i + 1) begin
      in = i[1:0];
      #1 $display("%1b %2b | %4b", ena, in, out); //#1 set delay time
    end

    ena = 0;
    for (int i = 0; i < 4; i = i + 1) begin
      in = i[1:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end
        
    $finish;      
	end

endmodule
