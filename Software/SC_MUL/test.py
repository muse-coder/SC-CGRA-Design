def cal(p ):
    for n in range(1,pow(2,p)+1):
        x = 0
        for i in range(0,p):
            if(n%int(pow(2,i+1))!=0):
                x = p+1-i
                print(x)
                break
            
p = 4
cal(4)