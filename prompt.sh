#!/bin/bash
#
# Bash prompt

# Prompt

# Colors
# pattern: '\[033['$weight';'${area}${color}'m\]'
# e.g. \[\033[0;30m\] (Normal Foreground Black)

# Weights
# Normal        0
# Bold          1
# Underlined    4

# Area
# Foreground    3
# Background    4

# Colors
# Black         0
# Red           1
# Green         2
# Orange        3
# Blue          4
# Purple        5
# Cyan          6
# White         7

# Use ANSI sequence: 
# starts with 38;5;${x-term-colorId} for the foreground and 48;5;${x-term-colorId} for the background,:

YELLOW=$'\033[0;38;5;222m'
MAGENTA=$'\033[0;38;5;211m'
PURPLE=$'\033[0;38;5;147m'
GREEN=$'\033[0;38;5;150m'
CYAN=$'\033[0;38;5;117m'
WHITE=$'\033[0;37m'

USERCOLOR=$MAGENTA
WORKINGDIRCOLOR=$CYAN
GITBRANCHCOLOR=$YELLOW
RESETCOLOR=$WHITE

return_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# \u: the username of the current user.
# \h: the hostname up to the first dot (.) in the Fully-Qualified Domain Name.
# \W: the basename of the current working directory, with $HOME abbreviated with a tilde (~).

if [ "$color_prompt" = yes ]; then
    PS1='\[$WORKINGDIRCOLOR\]\w\[$GITBRANCHCOLOR\]$(return_git_branch) $\[$RESETCOLOR\] '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt