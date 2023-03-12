// Returns area of the triangle with side length a, b and c.
// Returns 0 if any length is negative.
fn heron(a: f64, b: f64, c: f64) -> f64 {
    if a <= 0. || b <= 0. || c <= 0. {
        return 0.;
    }
    // Heron's formula
    // see https://en.wikipedia.org/wiki/Heron%27s_formula
    let s = (a + b + c) / 2.0;
    (s * (s - a) * (s - b) * (s - c)).sqrt()
}
