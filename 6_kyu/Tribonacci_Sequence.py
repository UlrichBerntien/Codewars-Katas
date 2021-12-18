def tribonacci(signature, n):
    accu = signature[0:n]
    for i in range(3,n):
        accu.append( sum(accu[i-3:i]) )
    return accu