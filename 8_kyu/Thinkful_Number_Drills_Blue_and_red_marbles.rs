fn guess_blue(blue_start: u32, red_start: u32, blue_pulled: u32, red_pulled: u32) -> f32 {
    let blue = blue_start - blue_pulled;
    let total = blue + red_start - red_pulled;
    if total > 0 && blue > 0 {blue as f32 / total as f32} else {0f32}
}