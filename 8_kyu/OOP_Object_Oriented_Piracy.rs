struct Ship {
    draft: u32,
    crew: u32,
}

impl Ship {
    fn is_worth_it(&self) -> bool {
        self.draft > 20 + self.crew + self.crew / 2
    }
}
