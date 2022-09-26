# Returns a function representing the number value.
def _number(value):
    # Evaluates the given function with the value as argument.
    # or evaluates to the value of no argument is given.
    def eval(rhs = None):
        return rhs(value) if rhs is not None else value
    return eval

# Returns a function representing the operator op.
def _operation(op):
    # Evaluates to a function.
    #   The returned function accepts the left hand side of the operation.
    #   The argument of this function is the right hand side of the operation.
    def eval(rhs):
        return lambda lhs: op(lhs,rhs)
    return eval

zero = _number(0)
one = _number(1)
two = _number(2)
three = _number(3)
four = _number(4)
five = _number(5)
six = _number(6)
seven = _number(7)
eight = _number(8)
nine = _number(9)

plus = _operation(int.__add__)
minus = _operation(int.__sub__)
times = _operation(int.__mul__)
divided_by = _operation(int.__floordiv__)
