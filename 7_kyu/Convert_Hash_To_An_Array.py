from typing import Mapping

# Converts hash map into sorted array of [key,value] items.
def convert_hash_to_array(hash: Mapping) -> list[list]:
    return [[key, hash[key]] for key in sorted(hash)]
