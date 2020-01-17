function javaclocal {
    javac $(find . -name "*.java");
}

function javacbin {
    javac -d bin $(find . -name "*.java")
}
