fn combat(health: f32, damage: f32) -> f32 {
    (health-damage).max(0.0)
}