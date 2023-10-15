import numpy as np

def run(tricks :list):
    # store alle trick parameters in float array (not the trick name)
    # column 0 = points, 1 = multiplicator base, 2 = probability
    trk = np.array([(trick['points'],trick['mult_base'],trick['probability']) for trick in tricks])
    # number of tricks
    n_tricks = len(tricks)
    assert trk.shape == (n_tricks, 3)
    # Number of options to hold in each optimisation step
    n_hold = 60*n_tricks
    # Number of new options in each step: n_hold*n_tricks, hence total size of options:
    n_options = n_hold + n_hold*n_tricks
    # The array of options
    # Column 0 = expected result, 1 = points, 2 = probability, 3:3+n_tricks = number of tricks executed
    options = np.zeros( (n_options, 3+n_tricks) )
    options[:,2] = 1. # start with success probabilty = 1 and points = 0, expected result = 0, no tricks executed
    # Number of options to hold calculated so far
    n_hold_calculated = 1
    while True:
        best_points = options[0,0]
        # hold the best n_hold found so far
        # use the best n_hold and add one new trick to each of them -> n_hold*n_tricks new options
        for i in range (n_hold_calculated):
            # one old option, index i, combined with n_tricks
            old_option = options[i,:] 
            # resulting new options
            new_options = options[n_hold+i*n_tricks:n_hold+(1+i)*n_tricks,:]
            new_options[:,3:3+n_tricks] = old_option[3:3+n_tricks]
            for trick_id in range(n_tricks):
                new_options[trick_id,3+trick_id] += 1 # count number of tricks
            new_options[:,2] = old_option[2] * trk[:,2]  # probability
            new_options[:,1] = old_option[1] + trk[:,0] * trk[:,1] ** old_option[3:3+n_tricks] # sum points
            new_options[:,0] = new_options[:,1] * new_options[:,2] # expected result
        # n_hold_calculated*n_tricks options are now new calculated.
        n_hold_calculated = min(n_hold_calculated*(1+n_tricks), n_hold)
        # Sort the array descending by the expected result and suppress options duplicates
        u = np.unique(options,axis=0)
        u = u[(-u[:,0]).argsort()]
        options[:len(u)] = u
        if best_points >= options[0,0]:
            # no better combination found by adding a trick
            break
    # Store the best (index 0 in the sorted options array) trick combination in a dictionary
    # Don't add tricks with count 0.
    summary = { trick['name']: int(options[0,3+i]) for (i,trick) in enumerate(tricks) if options[0,3+i] > 0 }
    return summary
