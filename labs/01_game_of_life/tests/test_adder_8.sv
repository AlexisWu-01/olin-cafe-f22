`timescale 1ns / 1ps // time
`default_nettype none 

`define SIMULATION

module test_adder_8;
    logic a, b, c_in;
    logic sum, c_out;

adder_n UUT(a,b,c_in,sum,c_out); //UNT: unit under test

//   decoder_2_to_4 UUT(
//     // .name_of_module_port(name_of_local_wire_or_logic)
//     // to avoid confusion aout which port is which
//     .ena(ena), 
//     .in(in), 
//     .out(out)); //UNT: unit under test

  initial begin // instandard programming land (line by line executation)
    // Collect waveforms
    $dumpfile("adder_1.fst");
    $dumpvars(0, UUT);
    
    $display("a b c_in | sum c_out");
    for (int i = 0; i < 2; i = i + 1) begin 
      a = i;
      for (int j = 0; j < 2; j = j + 1) begin
        b = j;
        for (int k = 0; k < 2; k = k+1) begin
            c_in = k;
            #1 $display("%1b %1b %1b | %9b %1b", a, b, c_in, sum, c_out); //#1 set delay time

        end
      end
    end

    $finish;      

    end

   
        

endmodule
