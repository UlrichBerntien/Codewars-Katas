use std::cmp::max;

/// Calculates the distance between pillars.
///
/// `distance` between pillars in meters.
/// `width` of the pillar in centimeters.
/// Returns distance in centimeters.
/// Returns the distance between first and last pillar (without widths of this twos).
fn pillars(num_of_pillars: u32, distance: u32, width: u32) -> u32 {
    (max(1,num_of_pillars)-1)*distance*100 + (max(2,num_of_pillars)-2)*width
}