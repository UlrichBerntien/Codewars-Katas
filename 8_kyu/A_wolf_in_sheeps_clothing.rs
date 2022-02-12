fn warn_the_sheep(queue: &[&str]) -> String {
    let wolf_index = queue.iter().position(|&x| x == "wolf");
    if wolf_index == None || wolf_index.unwrap() == queue.len() - 1 {
        "Pls go away and stop eating my sheep".to_string()
    } else {
        let sheep_id = queue.len() - wolf_index.unwrap() - 1;
        format!("Oi! Sheep number {}! You are about to be eaten by a wolf!", sheep_id)
    }
}