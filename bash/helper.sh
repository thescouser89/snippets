#!/usr/bin/bash

# Usage: max_val=$(max 3 2 1)
function max() {
    echo "$@" | sed 's|\s\+|\n|g' | sort -n | tail -n 1
}

# Usage: min_val=$(min 1 2 3)
function min() {
    echo "$@" | sed 's|\s\+|\n|g' | sort -n | head -n 1
}
