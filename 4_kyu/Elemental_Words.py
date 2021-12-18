def create_short2element(elements):
    """
    Returns a map of case normalized short name to element description.
    Format of the element description is defined in the instruction.
    """
    return dict( (short.casefold(),f"{long} ({short})") for short,long in elements.items() )

# Map case normalized short name to element description.
SHORT2ELEMENT = create_short2element(ELEMENTS)

# Maximal length of a short name
SHORT_MAX_LEN = max( len(k) for k in SHORT2ELEMENT )

def forms(word):
    """
    word must be a case normalized string.
    Returns list of element lists to build the word.
    """
    result = []
    for i in range(1,1+min(SHORT_MAX_LEN,len(word))):
        if word[:i] in SHORT2ELEMENT:
            element1 = [SHORT2ELEMENT[word[:i]]]
            if i < len(word):
                for it in forms(word[i:]):
                    result.append(element1+it)
            else:
                result.append(element1)
    return result

def elemental_forms(word):
    if not (type(word) is str and len(word)>0):
        # error exit
        return [word]
    return forms(word.casefold())
