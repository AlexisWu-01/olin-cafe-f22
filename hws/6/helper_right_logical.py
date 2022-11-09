f = open('right_logical.txt','w')
for j in range(32):
    f.write('mux32 rlbit'+str(31-j)+'( \n')
    print('mux32 rlbit'+str(31-j)+'(')

    for i in range(j+1):
        f.write('.in' + f'{i:02}' + '(in[' + str(31+i-j)  +']), \n')

        print('.in' + f'{i:02}' + '(in[' + str(31+i-j)  +']),')
    for i in range(j+1, 32):
        f.write('.in' + f'{i:02}' + '(1\'b0), \n')
        print('.in' + f'{i:02}' + '(1\'b0),')
    print('.select(shamt),')
    print('.out(out['+str(31-j)+']) \n')
    print(');')
    print()
    f.write('.select(shamt), \n')
    f.write('.out(out['+str(31-j)+']) \n')
    f.write('); \n')
    f.write('\n')
f.close()
