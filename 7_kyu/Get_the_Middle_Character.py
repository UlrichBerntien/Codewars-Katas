# Returns the characters in the middle of s.
# Returns 1 character if length of s is odd,
# else returns the 2 characters in the middle of the string s.
def get_middle(s: str) -> str:
    i = (len(s)-1) // 2
    j = (len(s)+2) // 2
    return s[i:j]
