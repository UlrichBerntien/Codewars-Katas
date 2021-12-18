golfscorecalculator(parlist, scorelist) =
    sum( map( parscore -> parscore[2]-parscore[1], zip(parlist, scorelist)) )