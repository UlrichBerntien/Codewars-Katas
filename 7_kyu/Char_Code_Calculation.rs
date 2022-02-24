fn calc(s: &str) -> u32 {
    let mut accu = 0u32;
    for c in s.chars() {
        let mut code = c as u32;
        while code > 0 {
            if code % 10 == 7 {
                accu += 6
            }
            code /= 10;
        }
    }
    accu
}
