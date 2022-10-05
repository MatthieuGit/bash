#!/bin/bash
#
# Configs for bashrc

if [ -f "$BASH_REPO_DIR"/prompt.sh ]
then
    . "$BASH_REPO_DIR"/prompt.sh
fi

if [ -f "$BASH_REPO_DIR"/bash_aliases.sh ]
then
    . "$BASH_REPO_DIR"/bash_aliases.sh
fi    
 
if [ -f "$BASH_REPO_DIR"/bash_functions.sh ]
then
    . "$BASH_REPO_DIR"/bash_functions.sh
fi