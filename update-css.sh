# FUNCTION: Minifies CSS
# ARGUMENTS: none
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# VERSION: 1.0
# REQUIRES: sass

DIRECTORY="/example/"
SOURCEFILE="style.css"
MINIFIEDFILE="style.min.css"
LOGFILE="update.log"

sudo sass --style=compressed --no-source-map $DIRECTORY$SOURCEFILE $DIRECTORY$MINIFIEDFILE

echo Update - $(date) >> $DIRECTORY$LOGFILE

exit 0
