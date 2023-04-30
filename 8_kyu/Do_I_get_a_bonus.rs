fn bonus_time(salary: u64, bonus: bool) -> String {
    let payment = if bonus { 10*salary } else { salary };
    format!("¥{}", payment)
}
