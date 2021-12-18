def rotate(s):
    return list( s[i:]+s[:i] for i in range(1,len(s)+1) )
