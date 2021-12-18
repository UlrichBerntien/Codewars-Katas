def wave_sort(a):
    a.sort()
    for i in range(0,len(a) - len(a)%2,2):
        a[i],a[i+1] = a[i+1],a[i]
