####################
### Cheat sheet ###
####################

exit 0

#### Standard output & error

# Redirect standard output and standard error into a log
mycommand >> mycommand.log 2>&1

#### Logs

# Get logs from journalctl
journalctl -u myservice.service --since today

#### DPKG

# Install deb package
sudo dpkg -i package

#### Find

# Find pattern 'abc' in all files in current directory
find . -type f -exec sh -c 'cat "$1" | grep a' sh {} \;

# Rename pattern 'a' to 'b' in all files in current directory
find . -type f -exec sed -i '' -e 's/a/b/g' {} \;

# Rename pattern 'a' to 'b' in all filenames in current directory
find . -maxdepth 1 -name "*" -type f -exec rename -n 's/a/b/g' {} +

# Move all files in current directory to another directory
find . -maxdepth 1 -name '*' -type f -exec mv -t ./another-directory {} +

# Delete all files in current directory older than 30 days
find . -type f -mtime +30 -exec echo {} \;

# Find files larger than 100MB 
find . -type f -size +100M -exec sh -c 'du -hs "$1"' sh {} \;

# Display file size of current path and all children to a max depth
du -h . --max-depth=5 

#### SSH 

# Create a local SSH key and copy it to remote address to allow passwordless connection
ssh-keygen -t rsa; ssh-copy-id -p 1234 user@111.111.111.111

# Create an SSH tunnel on port 1111 that takes remote address input on port 2222 and tunnels to localhost:3333
ssh -p 1111 111.111.111.111 -L 2222:localhost:3333

# SSH using key KEY and copy FILE from remote path to local path
scp -i /Users/me/.ssh/KEY remote-user@111.111.111.111:/remote-path/FILE /local-path/FILE

# SSH using key KEY and copy FILE from local path to remote path 
scp -i /Users/me/.ssh/KEY /local-path/FILE remote-user@111.111.111.111:/remote-path/FILE

#### Networking

# Get status of ports on which processes are listening
sudo netstat -nelt | grep LISTEN
sudo netstat -tulpn | grep LISTEN
sudo lsof -i -P -n | grep LISTEN

# Get detailed status on port
sudo lsof -i:1111

# Get a map of open ports on address
sudo nmap -sTU -O 111.111.111.111

# Get details of request to address
curl -sIv 111.111.111.111

# Get details of request to address with set header
curl -sIv 111.111.111.111 -H "X-MyHeader: 123" www.google.com

# Get ALPN status
echo | openssl s_client -alpn h2 -connect localhost:1111 | grep ALPN

#### User Management

# List all users
cut -d: -f1 /etc/passwd

# Create a new user with a home dir (-m)
sudo useradd -m username

# Change user home dir
sudo usermod -d /home/directory user

# Change user password
sudo passwd username 

# Remove a user
sudo userdel username

#### Git

# Store git credentials (follow up by git pull and git push)
git config --global credential.helper store

#### Java

# List available Java versions
update-java-alternatives --list

# Set Java version
sudo update-java-alternatives --set /java-alternative
