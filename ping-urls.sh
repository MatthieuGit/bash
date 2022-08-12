#!/bin/bash
# FUNCTION: Ping urls from a urls.txt file and get their status codes if greater than 300
# ARGUMENTS: 1) Path of input file
# REQUIRES: curl

echo ...

#### Input

file=""

# Check arguments

if [ -n "$1" ]
then
    if [ -f "$1" ]; then file="$1"; else echo invalid path ; fi
else
    while :
    do
        echo "USAGE:""${FUNCNAME[0]}"" Input the location of a file with URLs to be tested:"
        read file
        echo""
        if [ -f "$file" ]; then break; fi
    done
fi 

#### Output

mkdir -p output
errors="./output/urls-errors.txt"
rm "$errors" 2> /dev/null

echo ...

# Test all URLs in a file and log all responses with a status code above 400

while ifs= read -r line
do
    status_code=$(curl -Is -o /dev/null -w "%{http_code}" "$line")
    if [[ $status_code -gt 300 ]]; then echo $line : $status_code; echo $line : $status_code >> "$errors"; fi
done <<< $(cat "$file")

echo done
exit 0