alias cheatsheet="cat ~/repos/bash/cheatsheet.sh";
alias myip='echo $(curl -s ifconfig.me)';
alias toggle-wifi='~/repos/bash/toggle-wifi.sh';
alias convert-flac-to-mp3="find . -name '*.flac' -type f -exec bash -c 'ffmpeg -i "{}" -ab 320k -map_metadata 0 -id3v2_version 3 "{}".mp3' \;
";
