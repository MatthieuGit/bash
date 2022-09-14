#!/bin/bash
#
# Tidy your machine

desktop_files="~/Desktop/*"
downloads="~/Downloads/*"
screenshots="~/Pictures/Screen*"
MacOS_trash_files="~/.Trash/*"

rm -rf $(echo "$desktop_files" "$downloads" "$screenshots" "$MacOS_trash_files")