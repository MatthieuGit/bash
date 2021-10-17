####################
### Cheat sheet ###
####################

exit 0

#Move all files in current directory to another directory
find . -maxdepth 1 -name '*' -type f -exec mv -t ./anotherdirectory {} +

#Rename pattern 'a' to 'b' in all filenames in current directory
find . -maxdepth 1 -name "*" -type f -exec rename -n 's/a/b/g' {} +

#Convert all flac files to mp3
find . -name '*.flac' -type f -exec bash -c 'ffmpeg -i "{}" -ab 320k -map_metadata 0 -id3v2_version 3 "{}".mp3' \;

#Create an SSH Tunnel on port 1111 that takes remote input from port 2222 and tunnels to local output on port 3333
ssh -p 1111 192.168.0.212 -L 2222:localhost:3333

#Convert tags to IDV2.4 with eyed3
find . -name "*" -exec eyeD3 --to-v2.4 {} \; >> ~/eyed3.log 2>&1

#Remove IDV1 tags from files with eyed3
find . -name "*" -exec eyeD3 --remove-v1 {} \; >> ~/eyed3.log 2>&1

#install deb package
sudo dpkg -i package