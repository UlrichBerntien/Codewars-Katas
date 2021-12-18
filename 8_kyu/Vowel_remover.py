def shortcut( s: str ) -> str:
    return s.translate( str.maketrans('','','aeiou') )