####################
### Cheat sheet ###
####################

exit 0

# Move all files in current directory to another directory
find . -maxdepth 1 -name '*' -type f -exec mv -t ./anotherdirectory {} +

# Rename pattern 'a' to 'b' in all filenames in current directory
find . -maxdepth 1 -name "*" -type f -exec rename -n 's/a/b/g' {} +

# Convert all flac files to mp3
find . -name '*.flac' -type f -exec bash -c 'ffmpeg -i "{}" -ab 320k -map_metadata 0 -id3v2_version 3 "{}".mp3' \;

# Create an SSH tunnel on port 1111 that takes remote input from port 2222 and tunnels to local output on port 3333
ssh -p 1111 123.123.123.123 -L 2222:localhost:3333

# SSH using key KEY and copy FILE from REMOTE to LOCAL
scp -i /Users/jeremylanssiers/.ssh/KEY remote-user@123.123.123.123:/remote-path/FILE /local-path/FILE

# Find files larger than 100MB 
find . -type f -size +100M -exec sh -c 'du -hs "$1"' sh {} \;

# Display file size of current path and all children to a max depth
du -h . --max-depth=5 

# Redirect standard output and standard error into a log
mycommand >> mycommand.log 2>&1

# Install deb package
sudo dpkg -i package