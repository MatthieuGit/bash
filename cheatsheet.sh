####################
### Cheat sheet ###
####################

exit 0

# Redirect standard output and standard error into a log
mycommand >> mycommand.log 2>&1

# Install deb package
sudo dpkg -i package

# Find pattern 'abc' in all files in current directory
find . -type f -exec sh -c 'cat "$1" | grep a' sh {} \;

# Rename pattern 'a' to 'b' in all files in current directory
find . -type f -exec sed -i '' -e 's/a/b/g' {} \;

# Rename pattern 'a' to 'b' in all filenames in current directory
find . -maxdepth 1 -name "*" -type f -exec rename -n 's/a/b/g' {} +

# Move all files in current directory to another directory
find . -maxdepth 1 -name '*' -type f -exec mv -t ./anotherdirectory {} +

# Create a local SSH key and copy it to remote address to allow passwordless connection
ssh-keygen -t rsa; ssh-copy-id -p 1234 user@111.111.111.111

# Create an SSH tunnel on port 1111 that takes remote address input on port 2222 and tunnels to localhost:3333
ssh -p 1111 111.111.111.111 -L 2222:localhost:3333

# SSH using key KEY and copy FILE from remote user at remote address to local path
scp -i /Users/jeremylanssiers/.ssh/KEY remote-user@111.111.111.111:/remote-path/FILE /local-path/FILE

# Get ALPN status
echo | openssl s_client -alpn h2 -connect localhost:1111 | grep ALPN

# Get status of ports on which processes are listening
sudo netstat -nelt | grep LISTEN
sudo lsof -i -P -n | grep LISTEN

# Get detailed status on port
sudo lsof -i:1111

# Get a map of open ports on address
sudo nmap -sTU -O 111.111.111.111

# Get details of request to address
curl -sIv 111.111.111.111

# Get details of request to address with set header
curl -sIv 111.111.111.111 --header "X-MyHeader: 123" www.google.com

# Find files larger than 100MB 
find . -type f -size +100M -exec sh -c 'du -hs "$1"' sh {} \;

# Display file size of current path and all children to a max depth
du -h . --max-depth=5 