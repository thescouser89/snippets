#!/usr/bin/bash

# Bash arrays:
# colors=('Blue' 'Red')
# echo ${colors[0]}
# echo ${colors[1]}

# $ echo fish{one,two,red,blue}
# fishone fishtwo fishred fishblue

# $ find / -name foo > output.txt 2> output.txt
# $ find / -name foo > output.txt 2>&1
# Do this: find -name test.sh 2>&1 | tee /tmp/output2.txt
# instead of: find -name test.sh | tee /tmp/output2.txt 2>&1

# export a variable so that it is available in a child process

# case statements
# case "$variable" in
#   abc)  echo "\$variable = abc" ;;
#   xyz)  echo "\$variable = xyz" ;;
# esac


# for file in /{,usr/}bin/*calc
#             ^    Find all executable files ending in "calc"
#+                 in /bin and /usr/bin directories.

# Case conversion
# var=veryMixedUpVariable
# echo ${var}            # veryMixedUpVariable
# echo ${var^}           # VeryMixedUpVariable
#         *              First char --> uppercase.
# echo ${var^^}          # VERYMIXEDUPVARIABLE
#         **             All chars  --> uppercase.
# echo ${var,}           # veryMixedUpVariable
#         *              First char --> lowercase.
# echo ${var,,}          # verymixedupvariable
#         **             All chars  --> lowercase.


# : can be considered the equivalent of true
# endless loop:
# while :
# do
#   op1
# done
#
# if haha;then
#    :
# else
#    :
# fi

# echo {0..3} # 0 1 2 3

# Using the [[ ... ]] test construct, rather than [ ... ] can prevent many logic
# errors in scripts. For example, the &&, ||, <, and > operators work within a
# [[ ]] test, despite giving an error within a [ ] construct.
# The (( )) construct expands and evaluates an arithmetic expression.

# (( a-- ))     #  Post-decrement 'a', C-style
# (( t = a<45?7:11 ))   # C-style trinary operator.

# file test operators: http://www.tldp.org/LDP/abs/html/fto.html
# integer / string compares: http://www.tldp.org/LDP/abs/html/comparison-ops.html

# if [ "$v1" -gt "$v2"  -o  "$v1" -lt "$v2"  -a  -e "$filename" ]
# Unclear what's going on here...

# if [[ "$v1" -gt "$v2" ]] || [[ "$v1" -lt "$v2" ]] && [[ -e "$filename" ]]
# Much better -- the condition tests are grouped in logical sections.


# http://www.tldp.org/LDP/abs/html/internalvariables.html

# echo "$@"    # 1 2 3 4 5
# shift
# echo "$@"    # 2 3 4 5
# shift
# echo "$@"    # 3 4 5

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

check_if_root_user() {
    local root_uid="0"
    if [ "$UID" -ne "${root_uid}" ]; then
      echo "Must be root to run this script."
      exit 1
    fi
}

check_if_command_line_arg_present() {
    if [ -n "$1" ]; then
    # Test whether command-line argument is present (non-empty).
        echo $1
    fi
}

check_if_file_exists() {
    if [[ -e "$1" ]]; then
        echo 'file exists'
    fi
}
