def accum(s):
    return "-".join( s.upper()+s.lower()*i for i,s in enumerate(s) )