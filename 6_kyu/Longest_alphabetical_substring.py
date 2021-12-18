def longest(s: str) -> str:
    if not s: return s
    longest_start = 0
    longest_len = 1
    test_start = 0
    test_pos = 1
    while test_pos < len(s):
        while test_pos < len(s) and s[test_pos-1] <= s[test_pos]:
            test_pos = test_pos + 1
        if test_pos-test_start > longest_len:
            longest_len = test_pos - test_start
            longest_start = test_start
        test_start = test_pos
        test_pos = test_pos + 1
    return s[longest_start:longest_start+longest_len]
