from collections import defaultdict

def distinct(seq):
    memory = defaultdict(int)
    def seen_first(x): memory[x]+=1; return memory[x] == 1
    return [it for it in seq if seen_first(it)]