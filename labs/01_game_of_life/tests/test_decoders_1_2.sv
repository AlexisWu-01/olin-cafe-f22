`timescale 1ns / 1ps // time
`default_nettype none 

`define SIMULATION

module test_decoders_1_2;
  logic ena;
  logic in;
  wire [1:0] out;

  decoder_1_to_2 UUT(
    // .name_of_module_port(name_of_local_wire_or_logic)
    // to avoid confusion aout which port is which
    .ena(ena), 
    .in(in), 
    .out(out)); //UNT: unit under test

  initial begin // instandard programming land (line by line executation)
    // Collect waveforms
    $dumpfile("decoders_1_2.fst");
    $dumpvars(0, UUT);
    
    ena = 1;
    $display("ena in | out");
    for (int i = 0; i < 2; i = i + 1) begin
      in = i[0];
      #1 $display("%1b %2b | %4b", ena, in, out); //#1 set delay time
    end

    ena = 0;
    for (int i = 0; i < 2; i = i + 1) begin
      in = i[0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end
        
    $finish;      
	end

endmodule
