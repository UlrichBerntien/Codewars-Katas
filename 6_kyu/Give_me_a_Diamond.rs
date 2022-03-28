fn print(n: i32) -> Option<String> {
    if n < 1 || n & 1 < 1 {
        // Error exit
        return None;
    }
    let n = n as usize;
    let nh = n / 2;
    // Prepare all stars and spaces sequences only once.
    let stars = "*".repeat(n) + "\n";
    let spaces = " ".repeat(nh);
    // Capacity is calculated simple but not exact.
    let mut accu = String::with_capacity(n * (n + 1));
    // Upper part of the diamond including the middle line.
    for it in 0..=nh {
        accu.push_str(&spaces[0..nh - it]);
        accu.push_str(&stars[n - it * 2 - 1..]);
    }
    // Lower part of the diamond.
    for it in 1..=nh {
        accu.push_str(&spaces[0..it]);
        accu.push_str(&stars[it * 2..]);
    }
    Some(accu)
}
