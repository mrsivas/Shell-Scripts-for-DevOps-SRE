#!/bin/bash

# Path to the file which needs to take backup
backup_dir="/var/logs/backup"   

# Path where backup will be stored
source_dir="/var/logs" 

# Create a timestamped backup of the source directory
tar -czf "$backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz" "$source_dir"
