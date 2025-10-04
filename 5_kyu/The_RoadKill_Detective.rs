use lazy_static::lazy_static;

// The Road-Kill Detective
fn roadkill(photo: &str) -> String {
    let trace = photo_to_trace(photo);
    let animal_trace = KNOWN_ANIMAL_AND_TRACE
        .iter()
        .find(|x| match_trace(&x.1, &trace));
    match animal_trace {
        Some((name, _)) => name.to_string(),
        None => "??".to_string(),
    }
}

// A trace of an animal
// A trace is a sequence of items.
type Trace = Vec<TraceItem>;

// Each item of a trace is a component (char).
#[derive(Debug)]
struct TraceItem {
    component: char,
    count: usize,
}

// Scans a trace out of a photo.
fn photo_to_trace(photo: &str) -> Trace {
    let mut trace = Trace::new();
    let mut component: char = '=';
    let mut count: usize = 0;
    for c in photo.chars().filter(|&c| c != '=') {
        if c == component {
            count += 1
        } else {
            if count > 0 {
                trace.push(TraceItem { component, count });
            }
            component = c;
            count = 1;
        }
    }
    if count > 0 {
        trace.push(TraceItem { component, count });
    }
    trace
}

// Matchs one component of a trace.
// Returns true if the compüonent of the animal matchs to the component on the road.
fn match_trace_item(animal: &TraceItem, on_the_road: &TraceItem) -> bool {
    // the component must be the same
    // the length on the road could be larger then the original length but not shorter
    animal.component == on_the_road.component && animal.count <= on_the_road.count
}

// Matchs the trace of the original animal to the trce on the road.
// Returns true if the trace on the road could match to the animal.
fn match_trace(animal: &Trace, on_the_road: &Trace) -> bool {
    // Quick exit if number of items of the animal does not match to the trace on the road
    (animal.len() == on_the_road.len())
    &&
    // the trace on the road must match in all components
    // the trace on the road could be reversed
    (animal.iter().zip(on_the_road.iter())
    .all(|(a,r)| match_trace_item(a,r))
    ||
    animal.iter().zip(on_the_road.iter().rev())
    .all(|(a,r)| match_trace_item(a,r)))
}

lazy_static! {
    // All known traces of the animals
    static ref KNOWN_ANIMAL_AND_TRACE : Vec::<(&'static str,Trace)> =
    preloaded::ANIMALS
    .iter()
    .map(|&animal|(animal,photo_to_trace(animal)))
    .collect();
}
