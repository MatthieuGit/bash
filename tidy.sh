#!/bin/bash
# FUNCTION: Tidy machine
# ARGUMENTS: /
# REQUIRES: /

desktop_files="$HOME""/Desktop/*"
downloads="$HOME""/Downloads/*"
screenshots="$HOME""/Pictures/Screenshot*"

rm -rf $(echo "$desktop_files" "$downloads" "$screenshots")