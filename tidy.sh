#!/bin/bash
#
# Tidy your machine

# General Linux / MacOs destinations

desktop_files="$HOME""/Desktop/*"
downloads="$HOME""/Downloads/*"
screenshots="$HOME""/Pictures/Screen*"

rm -rf "$desktop_files" "$downloads" "$screenshots"

# MacOS specific destinations

if [ $(uname) == "Darwin" ]
then
	rm -rf ~/.Trash/*
	rm -rf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/.Trash/*
fi