/// Return a String with all characters masked as '#' except the last 4.
fn maskify(cc: &str) -> String {
    let mut vc: Vec<char> = cc.chars().collect();
    if vc.len() > 4 {
        for it in 0..=vc.len() - 5 {
            vc[it] = '#'
        }
        vc.iter().collect()
    } else {
        cc.to_string()
    }
}
