def split_and_merge(str, separator):
    return " ".join( separator.join(c for c in w) for w in str.split() )