fn max_gap(xs: &[i32]) -> i32 {
    let mut vs = xs.to_vec();
    vs.sort_unstable();
    vs.windows(2).map(|it| it[1] - it[0]).max().unwrap()
}
