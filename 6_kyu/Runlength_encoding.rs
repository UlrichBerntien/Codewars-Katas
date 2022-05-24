use itertools::Itertools;

fn run_length_encoding(s: &str) -> Vec<(usize, char)> {
    s.chars()
        .group_by(|c| *c)
        .into_iter()
        .map(|(c, group)| (group.count(), c))
        .collect()
}
