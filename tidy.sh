#!/bin/bash
#
# Tidy your machine

desktop_files="$HOME""/Desktop/*"
downloads="$HOME""/Downloads/*"
screenshots="$HOME""/Pictures/Screen*"
MacOS_trash_files="$HOME"".Trash/*""

rm -rf $(echo "$desktop_files" "$downloads" "$screenshots" "$MacOS_trash_files")