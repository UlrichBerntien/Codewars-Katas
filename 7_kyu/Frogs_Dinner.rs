// Returns the number of flies ate at the Frog's Dinner.
fn frog_contest(n: u32) -> String {
    let chris = gauss(n);
    let tom = gauss(chris / 2);
    let cat = gauss(chris + tom);
    format!("Chris ate {chris} flies, Tom ate {tom} flies and Cat ate {cat} flies")
}

// Calculates the sum 1+2+3..+n.
fn gauss(n: u32) -> u32 {
    (n * (n + 1)) / 2
}
