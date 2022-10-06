#!/bin/bash
#
# Check if strings from reference file exist test file

reference_file="./input/reference.txt"
test_file="./input/test.txt"

echo ...

while read reference_string
do 
    if ! grep -q "$reference_string" "$reference_file"; then
      echo "$reference_string" was not found in "$reference_file"
    fi
done < "$test_file"

echo done
exit 0