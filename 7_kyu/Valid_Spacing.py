def valid_spacing(s):
    return s == '' or (s[0] != ' ' and s[-1] != ' ' and s.find('  ') == -1)