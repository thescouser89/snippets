#!/usr/bin/bash

# from http://tldp.org/LDP/abs/html/colorizing.html
black='\E[30;1m'
red='\E[31;1m'
green='\E[32;1m'
yellow='\E[33;1m'
blue='\E[34;1m'
magenta='\E[35;1m'
cyan='\E[36;1m'
white='\E[37;1m'
alias Reset="tput sgr0" # Reset text attributes to normal

# Usage: cecho "hello world" $red
cecho () {
    local default_msg="No message passed."

    local message=${1:-$default_msg}   # Defaults to default message.
    local color=${2:-$black}           # Defaults to black, if not specified.

    echo -e "${color}${message}"
    Reset                              # Reset to normal.
}

# Usage: max_val=$(max 3 2 1)
function max() {
    echo "$@" | sed 's|\s\+|\n|g' | sort -n | tail -n 1
}

# Usage: min_val=$(min 1 2 3)
function min() {
    echo "$@" | sed 's|\s\+|\n|g' | sort -n | head -n 1
}

# It's just a template to show how to read a file line-by-line
#
# Usage: echo_lines <file_name>
function echo_lines() {
    local file_name=$1

    while read line; do
        echo ${line}
    done < ${file_name}
}
