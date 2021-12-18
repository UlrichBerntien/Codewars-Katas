def bot(i: int) -> str:
    "Converts number i into i bottles(s) string."
    if i < 1:
        return 'no more bottles'
    if i == 1:
        return '1 bottle'
    return str(i) + ' bottles'

# constant 99 Bottles of Beer lyrics
BEER = '\n'.join(
    [ f'{bot(i)} of beer on the wall, {bot(i)} of beer.\n'+
        f'Take one down and pass it around, {bot(i-1)} of beer on the wall.'
        for i in range(99,0,-1) ] +
    ['No more bottles of beer on the wall, no more bottles of beer.',
    'Go to the store and buy some more, 99 bottles of beer on the wall.' ])

# constant hello world string.
HELLO = 'Hello World!'

def HQ9(code: str) -> str:
    "The 8kyu interpreter."
    if code == 'H':
        return HELLO
    if code == 'Q':
        return code
    if code == '9':
        return BEER
    return None
