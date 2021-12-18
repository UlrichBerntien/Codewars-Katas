import operator

# Map operator name to operator.
OPERATOR_MAP = {
    "+" : operator.add,
    "-" : operator.sub,
    "/" : operator.truediv,
    "*" : operator.mul,
    "%" : operator.mod,
    "**": operator.pow}

# Error fallback function, returns 1.
ONE = lambda a,b: 1

def eval_object(v):
    return OPERATOR_MAP.get(v['operation'],ONE)(v['a'],v['b'])