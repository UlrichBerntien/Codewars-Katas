def calculator(x,y,op):
    if not ( isinstance(x,int) and isinstance(y,int) and isinstance(op,str)
           and (op in ('+','-','*','/')) ):
        return "unknown value"
    elif op == '+':
        return x+y
    elif op == '-':
        return x-y
    elif op == '*':
        return x*y
    elif op == '/':
        return x/y if y != 0 else 0
    raise RuntimeError("bug")