fn even_or_odd(i: i32) -> &'static str {
    if i & 1 == 0 {"Even"} else {"Odd"}
}