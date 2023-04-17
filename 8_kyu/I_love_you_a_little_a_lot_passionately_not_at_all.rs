fn how_much_i_love_you(nb_petals: u16) -> &'static str {
    let index = if nb_petals > 0 {
        (nb_petals - 1) % 6
    } else {
        0
    };
    match index {
        0 => "I love you",
        1 => "a little",
        2 => "a lot",
        3 => "passionately",
        4 => "madly",
        5 => "not at all",
        _ => "",
    }
}
