# Calculates the attack game result.
# Returns True if the defender wins.
def is_defended(attackers: list[int], defenders: list[int]) -> bool:
    attacker_survivors = 0
    defenders_survivors = 0
    # compare powers of pairs with same index
    for a,v in zip(attackers, defenders):
        if a > v:
            attacker_survivors += 1
        elif v > a:
            defenders_survivors += 1
    # add survivers without pairing
    delta = len(attackers) - len(defenders)
    if delta > 0:
        attacker_survivors += delta
    else:
        defenders_survivors += -delta
    if attacker_survivors != defenders_survivors:
        return defenders_survivors > attacker_survivors
    else:
        # sum of the initial powers decides in case of equality
        return sum(defenders) >= sum(attackers)
