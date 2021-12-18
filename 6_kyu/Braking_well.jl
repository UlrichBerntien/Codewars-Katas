module Braking
    export dist, speed
    
    const EARTH_GRAVITY = 9.81
    
    function dist(v::Number, μ::Number)::Real
        # convert from km/h to m/s
        v /= 3.6
        # Reaction time: 1
        v + v^2/2/μ/EARTH_GRAVITY
    end

    # Reaction time: 1
    function speed(d::Number, μ::Number)::Real
        μg = μ * EARTH_GRAVITY
        v = sqrt( μg^2 + 2d*μg ) - μg
        # Convert m/s in km/h
        3.6v
    end
end