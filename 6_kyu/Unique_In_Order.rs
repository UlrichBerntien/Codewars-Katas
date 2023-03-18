use itertools::Itertools;

// Returns a vector wth unique items from the sequence.
// ATTENTION: The sequence must be in order!
fn unique_in_order<T>(sequence: T) -> Vec<T::Item>
where
    T: std::iter::IntoIterator,
    T::Item: std::cmp::PartialEq + std::fmt::Debug,
{
    sequence.into_iter().dedup().collect()
}
