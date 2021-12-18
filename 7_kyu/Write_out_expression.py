ENGLISH_NUMBER = {
    '0': 'Zero',
    '1': 'One',
    '2': 'Two',
    '3': 'Three',
    '4': 'Four',
    '5': 'Five',
    '6': 'Six',
    '7': 'Seven',
    '8': 'Eight',
    '9': 'Nine',
    '10':'Ten' }

ENGLISH_OPERATOR = {
    '+': 'Plus',
    '-': 'Minus',
    '*': 'Times',
    '/': 'Divided By',  
    '**':'To The Power Of',
    '=': 'Equals',
    '!=':'Does Not Equal' }

def expression_out(exp: str) -> str:
    try:
        a,op,b = exp.split()
        return ' '.join( (ENGLISH_NUMBER.get(a,a), ENGLISH_OPERATOR[op], ENGLISH_NUMBER.get(b,b)) )
    except KeyError:
        return 'That\'s not an operator!'
    except ValueError:
        return 'That\'s not an expression!'
