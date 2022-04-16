fn rnd10(f: f64) -> f64 {
    (f * 1e10).round() / 1e10
}

fn iter_pi(epsilon: f64) -> (i32, f64) {
    let eps_4 = epsilon / 4.;
    let mut x: f64 = 0.;
    let mut p: f64 = 1.;
    let mut count: i32 = 0;
    while (x - std::f64::consts::FRAC_PI_4).abs() > eps_4 {
        x += 1. / p;
        p = -p + if p > 0. { -2. } else { 2. };
        count += 1;
    }
    (count, rnd10(4. * x))
}
