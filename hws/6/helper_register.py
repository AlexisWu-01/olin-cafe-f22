# for i in range(1,32):
#     print('register reg_wr' + f'{i:02}' + '(')
#     print('  .clk(clk),')
#     print('  .ena(wr_ena & (write_index==32\'d'+str(32-i)+')),')
#     print('  .rst(1\'b0),')
#     print('  .d(wr_data),')
#     print('  .q(x'+f'{i:02}'+')')
#     print(');')
#     print()



# register reg_rd01(
#   .clk(clk),
#   .ena(read_0_index == 31),
#   .rst(1'b0),
#   .d(x01),
#   .q(rd_data0)
# );

# for i in range(1,32):
#     print('logic read_addr_0_'+f'{i}'+';')
#     print('register reg_rd' + f'{i:02}' + '(')
#     print('  .clk(clk),')
#     print('  .ena(read_0_index=='+str(32-i)+'),')
#     print('  .rst(1\'b0),')
#     print('  .d(x'+ f'{i:02}'+'),')
#     print('  .q(read_addr_0_'+f'{i}'+' == ' + str(32-i) '? rd_data0 : )')
#     print(');')
#     print()

for i in range(1,32):
    print('else if (write_index == '+ str(32-i) +') assign x'+f'{i:02}' + ' = wr_data;')