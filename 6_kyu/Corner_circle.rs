fn corner_circle(r: f64) -> f64 {
    let corner_r = r * (std::f64::consts::SQRT_2 - 1.) / (std::f64::consts::SQRT_2 + 1.);
    const DIGITS: f64 = 100.;
    (corner_r * DIGITS).round() / DIGITS
}
