#!/bin/bash
git_repo="/path/to/your/repo"  #Git project folder


# Update a Git repository
cd "$git_repo"
git pull origin master
echo "Git repository updated."