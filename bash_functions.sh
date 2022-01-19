#APT

function update {
    sudo echo -e "\r"
    echo -e "updating available software\n----"
    sudo apt-get update;
    echo -e "\nupgrading software\n----"
    sudo apt-get upgrade;
    echo -e "\nremoving obsolete dependency software\n----"
    sudo apt-get autoremove --purge;
    echo -e "\nremoving software in local cache\n----"
    sudo apt-get clean;
    echo "Done"
}

#Git

function gitpush {
    if [ -f ./run.sh ]
    then
        ./run.sh
    fi

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
    fi

    git commit -m "$(date "+%Y-%m-%d -- %T") $COMMENT";
    git push -u origin main;
}

function gitpull {
    git reset --hard origin/main;
    git pull origin main;
}

function gitforce {
    if [ "$#" -ne 1 ]
    then
        echo "USAGE: gitforce [branch]" 
    fi

    git push --force origin $1:main; 
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

function mp3tag {
    find . -name *.mp3 -exec eyeD3 --to-v2.4  {} \; 
    find . -name *.mp3 -exec eyeD3 --remove-v1  {} \;
}
