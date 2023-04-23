use std::collections::LinkedList;

// Find shortes path from stone to stone to the last stone.
// Only steps of 1 or 2 units are possible.
// Returns the path as a string of steps.
fn frog_jumping(stones: &[u32]) -> String {
    if stones.is_empty() {
        return String::new();
    }
    // The coordinate to reach
    let x_end = stones[stones.len() - 1] as usize;
    // Generate a map coordinate -> stone to reach.
    // An item in the map is false if there is no stone or the stone is reached by a known path.
    let mut to_reach: Vec<bool> = Vec::with_capacity(x_end + 1);
    to_reach.resize(x_end + 1, false);
    for stone in stones {
        to_reach[*stone as usize] = true;
    }
    // Current path in a Breadth-first search to the stones
    let mut paths: LinkedList<Path> = LinkedList::new();
    paths.push_back(Path {
        steps: Vec::new(),
        end: 0,
    });
    loop {
        // Look at the current shortest path.
        let current = paths.pop_front().unwrap();
        for step in 1..=2 {
            // Go the next step based on the current path.
            let new_end = current.end + step;
            if new_end <= x_end && to_reach[new_end] {
                // The step reached a stone.
                let mut new_path: Path = current.clone();
                new_path.steps.push(step as u8);
                new_path.end = new_end;
                if new_end == x_end {
                    // Last stone is reached.
                    return steps_to_string(&new_path.steps);
                }
                paths.push_back(new_path);
                to_reach[new_end] = false;
            }
        }
    }
}

// A path from stone to stone
#[derive(Clone)]
struct Path {
    end: usize,     // end coordinate of the path
    steps: Vec<u8>, // steps to the end coordinate
}

// Converts a path to string.
// Eeach step (1..9) is converted into one character in the string.
fn steps_to_string(steps: &[u8]) -> String {
    steps
        .iter()
        .map(|&x| char::from_digit(x as u32, 10).unwrap())
        .collect()
}
