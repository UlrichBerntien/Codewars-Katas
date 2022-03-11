fn shortest_distance(a: f64, b: f64, c: f64) -> f64 {
    let mut sides = [a,b,c];
    sides.sort_by(|a,b| a.partial_cmp(b).unwrap() );
    sides[2].hypot(sides[0]+sides[1])
}