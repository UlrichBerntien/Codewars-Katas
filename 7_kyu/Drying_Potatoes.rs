fn potatoes(p0: i64, w0: i64, p1: i64) -> i64 {
    let q0 = 1.0 - p0 as f64 / 100.;
    let q1 = 1.0 - p1 as f64 / 100.;
    if !(0.0 < q0 && q0 <= q1 && q1 <= 1.0) {
        panic!("invalid parameter")
    };
    (w0 as f64 * q0 / q1 + 0.01) as i64
}
