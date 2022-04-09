fn gps(s: i32, x: Vec<f64>) -> i32 {
    let max_delta = x.windows(2).map(|x| x[1] - x[0]).fold(0., f64::max);
    let max_average_speed = 3600. * max_delta / s as f64;
    max_average_speed as i32
}
