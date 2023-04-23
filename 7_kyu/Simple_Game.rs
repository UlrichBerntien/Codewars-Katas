fn game(n: u32, m: u32) ->  &'static str {
    if m > 2 && n & 1 != 0 { "first" } else { "second" }
}
