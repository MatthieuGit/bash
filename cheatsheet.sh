#Move all files in current directory to another directory
find . -maxdepth 1 -name '*' -type f -exec mv -t /eaxample/example {} +

#Rename pattern 'example1' to 'example2' in all filenames in current directory
find . -maxdepth 1 -name "*" -type f -exec rename -n 's/example1/example2/g' {>

#Create an SSH Tunnel on port 443 that takes input from remote port 4000 and tunnels to local port 8888
ssh -p 443 192.168.0.212 -L 8888:localhost:4000

#Convert tags to IDV2.4
find . -name "*" -exec eyeD3 --to-v2.4 {} \; 

#Remove IDV1 tags from files
find . -name "*" -exec eyeD3 --remove-v1 {} \;
