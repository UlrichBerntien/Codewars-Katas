def disemvowel(string):
    return "".join( c for c in string if not c in "aeiouAEIOU" )