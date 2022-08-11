#!/bin/bash
# FUNCTION: Cleanup machine
# ARGUMENTS: /
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2022 GNU
# REQUIRES: /

desktop_files="$HOME""/Desktop/*"
downloads="$HOME""/Downloads/*"
screenshots="$HOME""/Pictures/Screenshot*"

rm -rf $(echo "$desktop_files" "$downloads" "$screenshots")