#!/usr/bin/env bash
# ROT13 substitution cipher
tr 'A-Za-z' 'N-ZA-Mn-za-m' <<<"$1"