def solve(a):
    return sum(isinstance(it,int) and (+1,-1)[it&1] for it in a)
