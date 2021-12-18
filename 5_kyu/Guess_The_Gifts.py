def guess_gifts(wishlist, presents): 
    def is_present(wish):
        return any( all( val == wish.get(key) for key,val in p.items() ) for p in presents )
    matches = filter(is_present, wishlist)
    return map(lambda it: it["name"], matches)