#!/bin/bash
#
# Backup creator

# What to backup. 
backup_files="/home /etc /opt /usr/local"

# Where to backup to.
dest="/home/$USER/backups"

# Get the dates
yyyymmdd=$(date '+%Y-%m-%d')
year=$(date '+%Y')
month=$(date '+%m')

# Create archive filename.
hostname=$(hostname -s)
archive_file="$hostname-$yyyymmdd.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

exit 0