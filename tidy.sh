#!/bin/bash
#
# Tidy your machine

desktop_files="$HOME""/Desktop/*"
downloads="$HOME""/Downloads/*"
screenshots="$HOME""/Pictures/Screen*"

rm -rf $(echo "$desktop_files" "$downloads" "$screenshots")