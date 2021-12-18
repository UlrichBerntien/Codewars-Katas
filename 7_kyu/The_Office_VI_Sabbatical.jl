sabb(x::String, val::Integer, happ::Integer)::String =
    +(count( c -> c ∈ "sabbatical",x),val,happ) > 22 ? "Sabbatical! Boom!" : "Back to your desk, boy."