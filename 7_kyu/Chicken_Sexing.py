def correctness(bobs_decisions, expert_decisions): 
    accu = 0
    for bob, expert in zip(bobs_decisions, expert_decisions):
        if bob == expert:
            accu += 1
        elif bob == '?' or expert == '?':
            accu += 0.5
    return accu