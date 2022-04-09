fn add(args: &[i64]) -> i64 {
    args.iter()
        .enumerate()
        .map(|it| it.1 * (it.0 as i64 + 1))
        .sum()
}
