// Generates a language depending greeting,
fn greet(language: &str) -> &str {
    let index = LANGUAGE_AND_GREET
        .iter()
        .position(|(lang, _)| *lang == language);
    LANGUAGE_AND_GREET[index.unwrap_or(0)].1
}

// Array of all greating options.
// Array contains tuples of language name and greeting text.
// First entry is the default for unknown languages.
const LANGUAGE_AND_GREET: [(&str, &str); 17] = [
    ("english", "Welcome"),
    ("czech", "Vitejte"),
    ("danish", "Velkomst"),
    ("dutch", "Welkom"),
    ("estonian", "Tere tulemast"),
    ("finnish", "Tervetuloa"),
    ("flemish", "Welgekomen"),
    ("french", "Bienvenue"),
    ("german", "Willkommen"),
    ("irish", "Failte"),
    ("italian", "Benvenuto"),
    ("latvian", "Gaidits"),
    ("lithuanian", "Laukiamas"),
    ("polish", "Witamy"),
    ("spanish", "Bienvenido"),
    ("swedish", "Valkommen"),
    ("welsh", "Croeso"),
];
