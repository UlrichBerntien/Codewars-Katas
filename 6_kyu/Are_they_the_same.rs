fn comp(a: Vec<i64>, b: Vec<i64>) -> bool {
    let mut aa: Vec<i64> = a.iter().map(|x| x*x).collect();
    aa.sort_unstable();
    let mut bb = b;
    bb.sort_unstable();
    aa == bb
}
