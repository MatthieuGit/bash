# Bash
Useful Bash functions

## bash_functions
Inside your bash_rc config, refer to bash_aliases and/or bash_functions, e.g. 

    # shell customization    
     
    if [ -f ~/repos/bash/bashrc.sh ]
    then
        . ~/repos/bash/bashrc.sh
    fi    
     
    # shell aliases    
     
    if [ -f ~/repos/bash/bash_aliases.sh ]
    then
        . ~/repos/bash/bash_aliases.sh
    fi    
     
    # shell functions    
     
    if [ -f ~/repos/bash/bash_functions.sh ]
    then
        . ~/repos/bash/bash_functions.sh
    fi

Also make sure the default lines concerning the color prompt are disabled: 

    #force_color_prompt=yes

    #if [ -n "$force_color_prompt" ]; then
    #    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
    #	color_prompt=yes
    #    else
    #	color_prompt=
    #   fi
    #fi

    #if [ "$color_prompt" = yes ]; then
    #    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #else
    #    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #fi
    #unset color_prompt force_color_prompt

## ...
...
