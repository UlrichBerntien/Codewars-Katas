fn xo(string: &'static str) -> bool {
    let mut plus_x_minus_o: i32 = 0;
    for c in string.chars() {
        match c {
            'x' | 'X' => plus_x_minus_o += 1,
            'o' | 'O' => plus_x_minus_o -= 1,
            _ => {}
        }
    }
    plus_x_minus_o == 0
}
