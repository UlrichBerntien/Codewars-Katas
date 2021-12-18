def arrange(s):
    t = [0]*len(s)
    s_start, s_end = 0, len(s)-1
    t_dest = 0
    while s_start <= s_end:
        t[t_dest] = s[s_start]
        t_dest += 1
        s_start += 1
        if s_start > s_end:
            break
        t[t_dest] = s[s_end]
        t_dest += 1
        s_end -= 1
        if s_start > s_end:
            break
        t[t_dest] = s[s_end]
        t_dest += 1
        s_end -= 1
        if s_start > s_end:
            break
        t[t_dest] = s[s_start]
        t_dest += 1
        s_start += 1
    return t