/// Returns an array true/false switched by substring "flick" in the list strings.
fn flick_switch(list: &[&str]) -> Vec<bool> {
    let mut current = true;
    return
        list
        .iter()
        .map(|it| {if it.contains("flick") {current=!current}; current} )
        .collect();
}
