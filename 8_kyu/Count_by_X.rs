// Returns x,1x,2x,...,nx.
fn count_by(x: u32, n: u32) -> Vec<u32> {
    (1..=n).map(|it| x * it).collect()
}
