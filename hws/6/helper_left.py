f = open('left_logical.txt','w')

for j in range(32):
    f.write('mux32 bit'+str(31-j)+'( \n')
    print('mux32 bit'+str(31-j)+'(')

    for i in range(j,32):
        f.write('.in' + f'{i-j:02}' + '(in[' + str(32-i-1)  +']), \n')
        print('.in' + f'{i-j:02}' + '(in[' + str(32-i-1)  +']),')

    for i in range(j-1,-1,-1):
        f.write('.in' + f'{31-i:02}' + '(1\'b0), \n')
        print('.in' + f'{31-i:02}' + '(1\'b0),')

    print('.select(shamt),')
    print('.out(out['+str(31-j)+']) \n')
    print(');')
    print()
    f.write('.select(shamt), \n')
    f.write('.out(out['+str(31-j)+']) \n')
    f.write('); \n')
    f.write('\n')
