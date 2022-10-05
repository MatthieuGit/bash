Useful Bash functions

# Bash

## bash_rc on Linux

Inside your home folder, find your bash_rc config and refer to bash_aliases and/or bash_functions, e.g. 

````
# Common BASH setup from ~/Repos/bash

if [ -f ~/Repos/bash/bashrc.sh ]
then
    . ~/Repos/bash/bashrc.sh
fi    
 
if [ -f ~/Repos/bash/bash_aliases.sh ]
then
    . ~/Repos/bash/bash_aliases.sh
fi    
 
if [ -f ~/Repos/bash/bash_functions.sh ]
then
    . ~/Repos/bash/bash_functions.sh
fi
````

Also make sure the default lines concerning the color prompt are disabled: 
````
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
````

## bash_profile on MacOS

Create a .bash_profile in your home directory and add a link to the bashrc, suppress the Zsh warning and enable homebrew.
````
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi    
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/opt/homebrew/bin:$PATH"
````

# NVM

Add the following to your bash.rc file for NVM to work
````
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
````

# Java

## OpenJDK

Install Java via OpenJDK, e.g. OpenJdDK 11
````
sudo apt-get install openjdk-11-jdk
````

Check your Java installation with `java -version`

## Oracle 

Download the Java tarball from Oracle's Archive at https://www.oracle.com/java/technologies/downloads/archive/

Create a jvm folder in /usr/lib and extract-install the tarball, e.g. jdk-11-linux-x64.tar.gz
````
sudo mkdir /usr/lib/jvm; sudo tar zxvf ~/Downloads/jdk-11-linux-x64.tar.gz -C /usr/lib/jvm
````

Update the system alternatives, e.g. for a jdk11
````
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk11/bin/java" 1;
sudo update-alternatives --set java /usr/lib/jvm/jdk11/bin/java;
````

Check your Java installation with `java -version`

# Linux GNOME Terminal profile

Export GNOME Terminal profile with

````
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
````

Import GNOME Terminal profile with

````
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
````