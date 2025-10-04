fn aitken(n: u32, k: u32) -> Option<u32> {
    if k == 0 && n == 0 {
        Some(1)
    } else if k == 0 {
        aitken(n-1, n-1)
    } else if k <= n {
        plus_options(aitken(n, k-1), aitken(n-1, k-1))
    } else {
        None
    }
}

fn plus_options(a: Option<u32>, b: Option<u32>) -> Option<u32> {
    match(a,b) {
        (Some(x), Some(y)) => Some(x+y),
        _ => None
    }
}
