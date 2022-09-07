#!/bin/bash
#
# Bash functions

# APT

update () {
    sudo echo -e "updating available software\n----"
    sudo apt-get update;
    echo -e "\nupgrading software\n----"
    sudo apt-get upgrade;
    echo -e "\nremoving obsolete dependency software\n----"
    sudo apt-get autoremove --purge;
    echo -e "\nremoving software in local cache\n----"
    sudo apt-get clean;
    echo "Done"
}

# Git

push () {
    local_git_branch=$(git rev-parse --abbrev-ref HEAD)
    remote_git_branch="$local_git_branch"

    comment="" 

    while getopts "u" option; do
        case "${option}" in
            u)
                remote_git_branch="$USER";
                ;;
        esac
    done
    shift "$((OPTIND-1))"


    if [ "$#" -gt 1 ] || [[ "$1" == "help" ]]
    then
        echo "USAGE: ""${FUNCNAME[0]}"" [optional flag: -u : remote branch = username ] [optional: commit message]"
        return 1 2>/dev/null
    fi

    git add -A;

    if [ "$#" -ne 1 ]; then comment="$local_git_branch - update" ; else comment="$local_git_branch - $1"; fi;

    git commit -m "$comment";

    echo git push origin "$local_git_branch"":""$remote_git_branch";

    git push origin "$local_git_branch"":""$remote_git_branch";
}

pull () {
    git pull origin main
}

force () {
    if [ "$#" -ne 1 ]
    then
        echo "USAGE: ""${FUNCNAME[0]}"" [branch]" 
    fi

    git push --force origin $1:main; 
}

# Java

javaclocal () {
    javac $(find . -name "*.java");
}

javacbin () {
    javac -d bin $(find . -name "*.java")
}

javacwd () {
    javac -d . $(find . -name "*.java")
}

javacfxlocal () {
    javac --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls $(find . -name "*.java")
}

javacfxbin () {
    javac --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls -d bin $(find . -name "*.java")
}

javacfxwd () {
    javac --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls -d . $(find . -name "*.java")
}

javafx () {
    CLASS=""

    if [ "$#" -eq 1 ]
    then
        CLASS="$1"
    fi

    if [ "$#" -ne 1 ]
    then
        echo "USAGE: ""${FUNCNAME[0]}"" [java class]"
        return 1 2>/dev/null
    fi

    #Set JavaFX path here
    java --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls $1
}

# eyeD3

convert-idv1-tags-to-idv2-tags () {
    find . -name *.mp3 -exec eyeD3 --to-v2.4  {} \; >> ~/var/log/eyed3.log 2>&1
    find . -name *.mp3 -exec eyeD3 --remove-v1  {} \; >> ~/var/log/eyed3.log 2>&1
    
    #Set album artist with the value from artist with eyed3
    find . -name "*" -type f -exec sh -c 'albumartist=$(eyeD3 "$1" | grep -P "(?<=^artist)" | sed "s/artist\:\ //g"); eyeD3 -b "$albumartist" "$1"' sh {} \;
}
