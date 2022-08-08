#!/bin/bash
# FUNCTION: Cleanup machine
# ARGUMENTS: /
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2022 GNU
# REQUIRES: /

home_dir=$(echo ~)

#### Screenshots

desktop_files="$home_dir""/Desktop/*"
screenshots="$home_dir""/Pictures/Screenshot*"
downloads="$home_dir""/Downloads/*"

rm -rf $(echo "$desktop_files" "$screenshots" "$downloads")