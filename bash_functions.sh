#### APT

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

#### Git

push () {
    if [ -f ./run.sh ]
    then
        ./run.sh
    fi

    git add -A;
    comment=""

    if [ "$#" -eq 1 ]
    then
        comment="-- $1"
    fi

    if [ "$#" -gt 1 ]
    then
        echo "USAGE: ""${FUNCNAME[0]}"" [optional comment]"
        return 1 2>/dev/null
    fi

    git commit -m "$(date "+%Y-%m-%d -- %T") $comment";
    git push -u origin main;
}

pull () {
    git pull origin main;
}

force () {
    if [ "$#" -ne 1 ]
    then
        echo "USAGE: ""${FUNCNAME[0]}"" [branch]" 
    fi

    git push --force origin $1:main; 
}

#### Java

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

#### eyeD3

convert-idv1-tags-to-idv2-tags () {
    find . -name *.mp3 -exec eyeD3 --to-v2.4  {} \; >> ~/var/log/eyed3.log 2>&1
    find . -name *.mp3 -exec eyeD3 --remove-v1  {} \; >> ~/var/log/eyed3.log 2>&1
    
    #Set album artist with the value from artist with eyed3
    find . -name "*" -type f -exec sh -c 'albumartist=$(eyeD3 "$1" | grep -P "(?<=^artist)" | sed "s/artist\:\ //g"); eyeD3 -b "$albumartist" "$1"' sh {} \;
}
