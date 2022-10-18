# for i in range(32):
    # print("5'b"+"{:05b}".format(i) + " : " + " out <= in" + str(i))
print("|".join(["in"+str(i) if len(str(i))>1 else "in0"+str(i) for i in range(32)]))