// Checks if indices stored in the array forms a full cycle.
fn full_cycle(lst: &[usize]) -> bool {
    if lst.is_empty() {
        return false;
    };
    let mut current_index = lst[0];
    for _ in 1..lst.len() {
        if current_index < 1 || current_index >= lst.len() {
            return false;
        };
        current_index = lst[current_index];
    }
    current_index == 0
}
