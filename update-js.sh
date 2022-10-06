#!/bin/bash
#
# Minify JavaScript

location="example/"
input_file="scripts.js"
output_file="scripts.min.js"
log="update.log"

uglifyjs "$location""$input_file" -o "$location""$output_file"

echo Update - $(date) >> "$location""$log"

exit 0