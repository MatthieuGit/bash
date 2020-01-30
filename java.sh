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
        echo "Input a Java class as parameter"
        return 1 2>/dev/null
    fi

    java --module-path /usr/lib/jvm/javafx/javafx-sdk-13.0.2/lib --add-modules javafx.controls $1
}
