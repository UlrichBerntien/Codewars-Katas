def to_camel_case(text):
    splits = text.replace("-","_").split("_")
    return splits[0] + "".join( x.capitalize() for x in splits[1:] )
