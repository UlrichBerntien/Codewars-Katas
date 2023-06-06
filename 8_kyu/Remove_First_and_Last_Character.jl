"""
  Returns str without frist and last char.
  Does NOT support multibyte characters.
"""
removechar(str::String)::String = str[2:end-1]
