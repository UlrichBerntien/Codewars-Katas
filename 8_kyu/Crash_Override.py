# Alias table, values are (first name alias, last name alias)
ALIAS = {
    'A': ('Alpha','Analogue'),
    'B': ('Beta','Bomb'),
    'C': ('Cache','Catalyst'),
    'D': ('Data', 'Discharge'),
    'E': ('Energy', 'Electron'),
    'F': ('Function', 'Faraday'),
    'G': ('Glitch', 'Gig'),
    'H': ('Half-life', 'Hacker'),
    'I': ('Ice', 'IP'),
    'J': ('Java', 'Jabber'),
    'K': ('Keystroke', 'Killer'),
    'L': ('Logic', 'Lazer'),
    'M': ('Malware', 'Mike'),
    'N': ('Nagware', 'n00b'),
    'O': ('OS', 'Overclock'),
    'P': ('Phishing', 'Payload'),
    'Q': ('Quantum', 'Quark'),
    'R': ('RAD', 'Roy'),
    'S': ('Strike', 'Spy'),
    'T': ('Trojan', 'T-Rex'),
    'U': ('Ultraviolet', 'Unit'),
    'V': ('Vanilla', 'Virus'),
    'W': ('WiFi', 'Worm'),
    'X': ('Xerox', 'X'),
    'Y': ('Y', 'Yob'),
    'Z': ('Zero', 'Zombie')}

# Error message if name does not start with a letter.
ERROR_MESSAGE = "Your name must start with a letter from A - Z."

def alias(name: str, alias_index: int) -> str:
    """
    Translate a name (first or last) into an alias
    alias_index in the index in the value of the ALIAS table.
    Return None on error.
    """
    try:
        return ALIAS[name[0].upper()][alias_index]
    except KeyError:
        return None

def alias_gen(f_name: str, l_name: str) -> str:
    "Generates and alias for first and lastname with same first letter."
    f_alias = alias(f_name, 0)
    l_alias = alias(l_name, 1)
    if f_alias and l_alias:
        return f_alias + ' ' + l_alias
    else:
        return ERROR_MESSAGE
