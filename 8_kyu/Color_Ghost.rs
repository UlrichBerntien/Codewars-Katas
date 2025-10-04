use rand::{Rng,thread_rng};

struct Ghost {
    color: &'static str,
}

impl Ghost {
    // Initialise Ghost with one of the possible colors.
    fn new() -> Ghost {
        let mut rng = thread_rng();
        Ghost {
            color: COLOR_SET[rng.gen_range(0..COLOR_SET.len())],
        }
    }
}

// Possible colors
const COLOR_SET: [&str; 4] = ["white", "yellow", "purple", "red"];
