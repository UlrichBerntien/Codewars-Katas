import collections as col
import re
import typing as typ


def best_planet(solar_system :typ.Iterable[str], max_size :float) -> str:
    """
    Find best planet.
    The planet must contain all required elements and has a maximal size.
    A planet is best if the planet has the biggest size below the given limit.
    solar_system -- Planet names in the format "ElementElement_Size".
    max_size -- Upper size limit (including this size).
    Return -- Name of the planet or empty string if no planet match the conditions
    """
    all_planets = [name2planet(name) for name in solar_system]
    suitable_planets = [p for p in all_planets if p.size <= max_size and REQUIRED_ELEMENTS.issubset(p.elements)]
    if not suitable_planets:
        return ""
    return max(suitable_planets, key=lambda p: p.size).name


# Set of required elements
REQUIRED_ELEMENTS = { 'H', 'C', 'N', 'O', 'P', 'Ca' }


# Regular expressions matches one element name.
Elements = re.compile(r'[A-Z][a-z]?')


# Data of a planet.
# elements -- Set of all elements.
# size -- Size of the planet.
# name -- Name of the planet.
Planet = col.namedtuple('Planet', 'elements size name')


def name2planet(name: str) -> Planet:
    """
    Splits name in format "ElementElement_size".
    """
    elems,size = name.split('_',2)
    elems = {x[0] for x in Elements.finditer(elems)}
    return Planet(elements=elems,size=int(size),name=name)
