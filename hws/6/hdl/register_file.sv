`default_nettype none
`timescale 1ns/1ps

module register_file(
  clk, //Note - intentionally does not have a reset! 
  wr_ena, wr_addr, wr_data,
  rd_addr0, rd_data0,
  rd_addr1, rd_data1
);
// Not parametrizing, these widths are defined by the RISC-V Spec!
input wire clk;

// Write channel
input wire wr_ena;
input wire [4:0] wr_addr;
input wire [31:0] wr_data;

// Two read channels
input wire [4:0] rd_addr0, rd_addr1;
output logic [31:0] rd_data0, rd_data1;

logic [31:0] x00; 
always_comb x00 = 32'd0; // ties x00 to ground. 

// DON'T DO THIS:
// logic [31:0] register_file_registers [31:0]
// CAN'T: because that's a RAM. Works in simulation, fails miserably in synthesis.

// Hint - use a scripting language if you get tired of copying and pasting the logic 32 times - e.g. python: print(",".join(["x%02d"%i for i in range(0,32)]))
wire [31:0] x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31;
logic [31:0] write_index;

// write file decoder
always_comb write_index = wr_addr?(32'b1 << wr_addr) : 32'b0;


// write data

register  #(.N(32)) reg_wr1(.clk(clk), .ena(wr_ena & write_index[1]), .rst(1'b0), .d(wr_data), .q(x01));
register  #(.N(32)) reg_wr2(.clk(clk), .ena(wr_ena & write_index[2]), .rst(1'b0), .d(wr_data), .q(x02));
register  #(.N(32)) reg_wr3(.clk(clk), .ena(wr_ena & write_index[3]), .rst(1'b0), .d(wr_data), .q(x03));
register  #(.N(32)) reg_wr4(.clk(clk), .ena(wr_ena & write_index[4]), .rst(1'b0), .d(wr_data), .q(x04));
register  #(.N(32)) reg_wr5(.clk(clk), .ena(wr_ena & write_index[5]), .rst(1'b0), .d(wr_data), .q(x05));
register  #(.N(32)) reg_wr6(.clk(clk), .ena(wr_ena & write_index[6]), .rst(1'b0), .d(wr_data), .q(x06));
register  #(.N(32)) reg_wr7(.clk(clk), .ena(wr_ena & write_index[7]), .rst(1'b0), .d(wr_data), .q(x07));
register  #(.N(32)) reg_wr8(.clk(clk), .ena(wr_ena & write_index[8]), .rst(1'b0), .d(wr_data), .q(x08));
register  #(.N(32)) reg_wr9(.clk(clk), .ena(wr_ena & write_index[9]), .rst(1'b0), .d(wr_data), .q(x09));
register  #(.N(32)) reg_wr10(.clk(clk), .ena(wr_ena & write_index[10]), .rst(1'b0), .d(wr_data), .q(x10));
register  #(.N(32)) reg_wr11(.clk(clk), .ena(wr_ena & write_index[11]), .rst(1'b0), .d(wr_data), .q(x11));
register  #(.N(32)) reg_wr12(.clk(clk), .ena(wr_ena & write_index[12]), .rst(1'b0), .d(wr_data), .q(x12));
register  #(.N(32)) reg_wr13(.clk(clk), .ena(wr_ena & write_index[13]), .rst(1'b0), .d(wr_data), .q(x13));
register  #(.N(32)) reg_wr14(.clk(clk), .ena(wr_ena & write_index[14]), .rst(1'b0), .d(wr_data), .q(x14));
register  #(.N(32)) reg_wr15(.clk(clk), .ena(wr_ena & write_index[15]), .rst(1'b0), .d(wr_data), .q(x15));
register  #(.N(32)) reg_wr16(.clk(clk), .ena(wr_ena & write_index[16]), .rst(1'b0), .d(wr_data), .q(x16));
register  #(.N(32)) reg_wr17(.clk(clk), .ena(wr_ena & write_index[17]), .rst(1'b0), .d(wr_data), .q(x17));
register  #(.N(32)) reg_wr18(.clk(clk), .ena(wr_ena & write_index[18]), .rst(1'b0), .d(wr_data), .q(x18));
register  #(.N(32)) reg_wr19(.clk(clk), .ena(wr_ena & write_index[19]), .rst(1'b0), .d(wr_data), .q(x19));
register  #(.N(32)) reg_wr20(.clk(clk), .ena(wr_ena & write_index[20]), .rst(1'b0), .d(wr_data), .q(x20));
register  #(.N(32)) reg_wr21(.clk(clk), .ena(wr_ena & write_index[21]), .rst(1'b0), .d(wr_data), .q(x21));
register  #(.N(32)) reg_wr22(.clk(clk), .ena(wr_ena & write_index[22]), .rst(1'b0), .d(wr_data), .q(x22));
register  #(.N(32)) reg_wr23(.clk(clk), .ena(wr_ena & write_index[23]), .rst(1'b0), .d(wr_data), .q(x23));
register  #(.N(32)) reg_wr24(.clk(clk), .ena(wr_ena & write_index[24]), .rst(1'b0), .d(wr_data), .q(x24));
register  #(.N(32)) reg_wr25(.clk(clk), .ena(wr_ena & write_index[25]), .rst(1'b0), .d(wr_data), .q(x25));
register  #(.N(32)) reg_wr26(.clk(clk), .ena(wr_ena & write_index[26]), .rst(1'b0), .d(wr_data), .q(x26));
register  #(.N(32)) reg_wr27(.clk(clk), .ena(wr_ena & write_index[27]), .rst(1'b0), .d(wr_data), .q(x27));
register  #(.N(32)) reg_wr28(.clk(clk), .ena(wr_ena & write_index[28]), .rst(1'b0), .d(wr_data), .q(x28));
register  #(.N(32)) reg_wr29(.clk(clk), .ena(wr_ena & write_index[29]), .rst(1'b0), .d(wr_data), .q(x29));
register  #(.N(32)) reg_wr30(.clk(clk), .ena(wr_ena & write_index[30]), .rst(1'b0), .d(wr_data), .q(x30));
register  #(.N(32)) reg_wr31(.clk(clk), .ena(wr_ena & write_index[31]), .rst(1'b0), .d(wr_data), .q(x31));

logic [31:0] read_0_index, read_1_index;
logic [31:0] out_data_0, out_data_1;

// write file decoder
always_comb read_0_index = rd_addr0?(32'b1 << rd_addr0) : 32'b0;
always_comb read_1_index = rd_addr1?(32'b1 << rd_addr1) : 32'b0;



endmodule
