#!/bin/bash
#
# Bash aliases

alias cheatsheet="cat ~/Repos/bash/cheatsheet.sh";
alias tidy="~/Repos/bash/tidy.sh";
alias toggle-wifi='~/Repos/bash/toggle-wifi.sh';
alias convert-flac-to-mp3="find . -name '*.flac' -type f -exec bash -c 'ffmpeg -i "{}" -ab 320k -map_metadata 0 -id3v2_version 3 "{}".mp3' \;";
alias ls-ppa="grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*"
alias ls-ip="echo $(curl -s ifconfig.me)"