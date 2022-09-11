#!/bin/bash
#
# Configs for bashrc

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

# \u: the username of the current user.
# \h: the hostname up to the first dot (.) in the Fully-Qualified Domain Name.
# \W: the basename of the current working directory, with $HOME abbreviated with a tilde (~).

YELLOW=$'\033[38;5;222;40m'
RED=$'\033[38;5;216;40m'
RED=$'\033[38;5;211;40m'
PURPLE=$'\033[38;5;147;40m'
GREEN=$'\033[38;5;150;40m'
CYAN=$'\033[38;5;117;40m'
WHITE=$'\033[37;40m'

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

if [ "$color_prompt" = yes ]; then
    PS1='\[$CYAN\]\w\[$YELLOW\]$(return_git_branch) $\e[0m '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt
