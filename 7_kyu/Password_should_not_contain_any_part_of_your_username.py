import numpy

def validate(username: str, password: str) -> bool:
    limit_common_length = min(1+len(username),1+len(password))//2
    s1, s2 = username, password
    # Based on "longest common substring" code sample.
    # https://en.wikipedia.org/wiki/Longest_common_substring_problem
    m = numpy.zeros( (1+len(s1), 1+len(s2)), dtype=int )
    longest, x_longest = 0, 0
    for x in range(1, 1+len(s1)):
        for y in range(1, 1+len(s2)):
            if s1[x-1] == s2[y-1]:
                m[x,y] = m[x-1,y-1] + 1
                if m[x,y] > longest:
                    longest = m[x,y]
                    x_longest = x
                    if longest >= limit_common_length:
                        # stop searching, it is already too long
                        return False
            else:
                  m[x,y] = 0
    return longest < limit_common_length