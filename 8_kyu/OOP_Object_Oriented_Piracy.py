class Ship:
    def __init__(self, draft, crew):
        self.draft = draft
        self.crew = crew
    
    _draft_per_crew = 1.5
    
    _worth_limit = 20
    
    def is_worth_it(self) -> bool:
        return self.draft - self.crew * self._draft_per_crew >= self._worth_limit
