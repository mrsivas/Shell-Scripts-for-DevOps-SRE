#!/bin/bash
username="newuser"

#read -p "Enter new username: " username
#Enable aboce comment if need to get user input


# Check if user exists; if not, create new user
if id "$username" &>/dev/null; then
echo "User $username already exists."
else
useradd -m "$username"
echo "User $username created."
Fi