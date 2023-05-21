"Number of outerside cubes afer cuts of the start cube."
countsquares(cuts::Integer) = cuts > 0 ? 6cuts^2+2 : 1
