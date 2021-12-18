def recycle(a):
    bins = {"paper":[], "glass":[], "organic":[], "plastic":[]}
    for element in a:
        name = element.get("type",None)
        for material in (element.get("material",None), element.get("secondMaterial",None)):
            if material in bins and name:
                bins[material].append(name)
    return tuple(bins.values())