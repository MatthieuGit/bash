# FUNCTION: Minifies CSS
# ARGUMENTS: none
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# REQUIRES: sass

location="example/"
input_file="style.css"
output_file="style.min.css"
log="update.log"

sudo sass --style=compressed --no-source-map $location$input_file $location$output_file

echo Update - $(date) >> $location$log

exit 0
