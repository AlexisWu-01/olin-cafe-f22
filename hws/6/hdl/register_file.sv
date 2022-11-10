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
register reg_wr01(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd31)),
  .rst(1'b0),
  .d(wr_data),
  .q(x01)
);

register reg_wr02(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd30)),
  .rst(1'b0),
  .d(wr_data),
  .q(x02)
);

register reg_wr03(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd29)),
  .rst(1'b0),
  .d(wr_data),
  .q(x03)
);

register reg_wr04(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd28)),
  .rst(1'b0),
  .d(wr_data),
  .q(x04)
);

register reg_wr05(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd27)),
  .rst(1'b0),
  .d(wr_data),
  .q(x05)
);

register reg_wr06(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd26)),
  .rst(1'b0),
  .d(wr_data),
  .q(x06)
);

register reg_wr07(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd25)),
  .rst(1'b0),
  .d(wr_data),
  .q(x07)
);

register reg_wr08(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd24)),
  .rst(1'b0),
  .d(wr_data),
  .q(x08)
);

register reg_wr09(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd23)),
  .rst(1'b0),
  .d(wr_data),
  .q(x09)
);

register reg_wr10(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd22)),
  .rst(1'b0),
  .d(wr_data),
  .q(x10)
);

register reg_wr11(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd21)),
  .rst(1'b0),
  .d(wr_data),
  .q(x11)
);

register reg_wr12(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd20)),
  .rst(1'b0),
  .d(wr_data),
  .q(x12)
);

register reg_wr13(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd19)),
  .rst(1'b0),
  .d(wr_data),
  .q(x13)
);

register reg_wr14(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd18)),
  .rst(1'b0),
  .d(wr_data),
  .q(x14)
);

register reg_wr15(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd17)),
  .rst(1'b0),
  .d(wr_data),
  .q(x15)
);

register reg_wr16(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd16)),
  .rst(1'b0),
  .d(wr_data),
  .q(x16)
);

register reg_wr17(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd15)),
  .rst(1'b0),
  .d(wr_data),
  .q(x17)
);

register reg_wr18(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd14)),
  .rst(1'b0),
  .d(wr_data),
  .q(x18)
);

register reg_wr19(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd13)),
  .rst(1'b0),
  .d(wr_data),
  .q(x19)
);

register reg_wr20(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd12)),
  .rst(1'b0),
  .d(wr_data),
  .q(x20)
);

register reg_wr21(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd11)),
  .rst(1'b0),
  .d(wr_data),
  .q(x21)
);

register reg_wr22(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd10)),
  .rst(1'b0),
  .d(wr_data),
  .q(x22)
);

register reg_wr23(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd9)),
  .rst(1'b0),
  .d(wr_data),
  .q(x23)
);

register reg_wr24(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd8)),
  .rst(1'b0),
  .d(wr_data),
  .q(x24)
);

register reg_wr25(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd7)),
  .rst(1'b0),
  .d(wr_data),
  .q(x25)
);

register reg_wr26(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd6)),
  .rst(1'b0),
  .d(wr_data),
  .q(x26)
);

register reg_wr27(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd5)),
  .rst(1'b0),
  .d(wr_data),
  .q(x27)
);

register reg_wr28(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd4)),
  .rst(1'b0),
  .d(wr_data),
  .q(x28)
);

register reg_wr29(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd3)),
  .rst(1'b0),
  .d(wr_data),
  .q(x29)
);

register reg_wr30(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd2)),
  .rst(1'b0),
  .d(wr_data),
  .q(x30)
);

register reg_wr31(
  .clk(clk),
  .ena(wr_ena & (write_index==32'd1)),
  .rst(1'b0),
  .d(wr_data),
  .q(x31)
);



logic [31:0] read_0_index, read_1_index;
logic [31:0] trash;
// write file decoder
always_comb read_0_index = rd_addr0?(32'b1 << rd_addr0) : 32'b0;
always_comb read_1_index = rd_addr1?(32'b1 << rd_addr1) : 32'b0;

always_ff @(posedge clk) begin
  rd_data0 <= (read_0_index);
end



endmodule
