isupper(str::String) = all( c -> isuppercase(c) || isspace(c), str )