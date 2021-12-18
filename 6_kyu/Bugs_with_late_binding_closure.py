def create_multiplications(n):
    f = lambda i: lambda x: i*x
    return [f(i) for i in range(n)]
