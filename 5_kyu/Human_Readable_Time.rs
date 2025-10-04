// Format time as HH:MM:SS.
fn make_readable(seconds: u32) -> String {
    let ss = seconds % 60;
    let minutes = seconds / 60;
    let mm = minutes % 60;
    let hh = minutes / 60;
    format!("{hh:02}:{mm:02}:{ss:02}")
}
