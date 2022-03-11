fn to_time(seconds: u32) -> String {
    let m = seconds / 60;
    let h = m / 60;
    format!("{} hour(s) and {} minute(s)", h, m % 60)
}
