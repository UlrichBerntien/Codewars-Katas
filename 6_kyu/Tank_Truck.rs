// Area of a cirle with radius r
// https://en.wikipedia.org/wiki/Area_of_a_circle
fn circle_area(r: f64) -> f64 {
    std::f64::consts::PI * r * r
}

// Area of a cirle segment
// r - Radius of the circle
// h - height of the segment h <= r
// https://en.wikipedia.org/wiki/Circular_segment
fn cicle_segment_area(r: f64, h: f64) -> f64 {
    let r2 = r * r;
    let rh = r - h;
    r2 * (1. - h / r).acos() - rh * (r2 - rh * rh).sqrt()
}

fn tank_vol(h: i32, d: i32, vt: i32) -> i32 {
    if vt < 1 || d < 1 || d < h {
        // error exit
        return 0;
    }
    let h = f64::from(h);
    let d = f64::from(d);
    let r = d / 2.;
    let volume_total = f64::from(vt);
    let area_total = circle_area(r);
    let area_filled = if h > r {
        area_total - cicle_segment_area(r, d - h)
    } else {
        cicle_segment_area(r, h)
    };
    let volume_filled = volume_total * area_filled / area_total;
    volume_filled as i32
}
