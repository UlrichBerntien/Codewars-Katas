function isvow(a)
  vowels = map(codepoint, ['a','e','i','o','u'])
  map(it -> it in vowels ? Char(it) : it, a)
end