class add(int):
    def __init__(self,n):
        self = n
    def __call__(self,x):
        return add(self+x)
