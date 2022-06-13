package kata

func DeclareWinner(fighter1 Fighter, fighter2 Fighter, firstAttacker string) string {
	// The number of attacks a fighter needs to kill the other fight
	fighter1NeedsAttacks := (fighter2.Health + fighter1.DamagePerAttack - 1) / fighter1.DamagePerAttack
	fighter2NeedsAttacks := (fighter1.Health + fighter2.DamagePerAttack - 1) / fighter2.DamagePerAttack
	if fighter1NeedsAttacks == fighter2NeedsAttacks {
		// If the number of attacks is equal, then the first attacked wins
		if fighter1.Name == firstAttacker {
			return fighter1.Name
		} else {
			return fighter2.Name
		}
	}
	// If the number of attacks is different, then the attacked with less wins
	if fighter1NeedsAttacks < fighter2NeedsAttacks {
		return fighter1.Name
	} else {
		return fighter2.Name
	}
}
