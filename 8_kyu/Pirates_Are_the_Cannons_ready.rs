use std::collections::HashMap;

fn cannons_ready(gunners: HashMap<&str, &str>) -> String {
    String::from(if gunners.values().all(|&it| it == "aye") {
        "Fire!"
    } else {
        "Shiver me timbers!"
    })
}
