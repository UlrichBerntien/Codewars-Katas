function passthedoorman(word)
    m = match(r"(.)\1",word)
    m ≡ nothing ? 0 : 3(m.captures[1][1]-'a'+1)
end