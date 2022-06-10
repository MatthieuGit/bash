# ---- Prompt

# Colors
# pattern: '\[033['$weight';'$area$color'\]'
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

# \u: the username of the current user.
# \h: the hostname up to the first dot (.) in the Fully-Qualified Domain Name.
# \W: the basename of the current working directory, with $HOME abbreviated with a tilde (~).

return_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[0;36m\]\u\[\033[0;00m\]\[\033[0;34m\]@\[\033[0;00m\]\[\033[0;36m\]\h\[\033[0;00m\] \[\033[0;35m\]\w$(return_git_branch) \[\033[0;00m\]\[\033[0;37m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt
