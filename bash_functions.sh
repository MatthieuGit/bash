#APT

function update {
    sudo apt-get update;
    sudo apt-get upgrade;
    sudo apt-get autoremove --purge;
    sudo apt-get clean;
}

#Git

function gitpush {
    git add -A;
    COMMENT=""

    if [ "$#" -eq 1 ]
    then
        COMMENT="-- $1"
    fi

    if [ "$#" -gt 1 ]
    then
        echo "USAGE: gitpush [optional comment]"
        return 1 2>/dev/null
    exit 1
    fi

    git commit -m "$(date "+%Y-%m-%d -- %T") $COMMENT";
    git push -u origin master;
}

function gitpull {
    git reset --hard origin/master;
    git pull origin master;
}

function gitforce {
    if [ "$#" -ne 1 ]
    then
        echo "USAGE: gitforce [branch]" 
    fi

    git push --force origin $1:master; 
}

#Java

function javaclocal {
    javac $(find . -name "*.java");
}

function javacbin {
    javac -d bin $(find . -name "*.java")
}

function javacwd {
    javac -d . $(find . -name "*.java")
}

function javacfxlocal {
    javac --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls $(find . -name "*.java")
}

function javacfxbin {
    javac --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls -d bin $(find . -name "*.java")
}

function javacfxwd {
    javac --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls -d . $(find . -name "*.java")
}

function javafx {
    CLASS=""

    if [ "$#" -eq 1 ]
    then
        CLASS="$1"
    fi

    if [ "$#" -ne 1 ]
    then
        echo "USAGE: Input a Java class as parameter"
        return 1 2>/dev/null
    fi

    #Set JavaFX path here
    java --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls $1
}

#eyeD3

function mp3idv3 {
    find . -name *.mp3 -exec eyeD3 --to-v2.4  {} \; 
    find . -name *.mp3 -exec eyeD3 --to-v1.1  {} \; 
    find . -name *.mp3 -exec eyeD3 --remove-v1  {} \;
}