def uniq(seq): 
    return [seq[i] for i in range(len(seq)) if i == 0 or seq[i-1] != seq[i]]