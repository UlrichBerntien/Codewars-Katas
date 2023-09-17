from collections.abc import Iterable

def is_palindrome(string) -> bool:
    if not isinstance(string, Iterable):
        string = str(string)
    return all( string[i] == string[-i-1] for i in range((len(string)+1)//2) )