def list_animals(animals):
    return "".join( f"{i+1}. {v}\n" for i,v in enumerate(animals) )