def getCount(inputStr):
    return sum( map(lambda c: c in "aeiou", inputStr) )