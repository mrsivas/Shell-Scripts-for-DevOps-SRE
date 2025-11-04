#!/bin/bash
packages=("nginx" "php-fpm" "mysql")

# Install listed packages using apt-get
for package in "${packages[@]}"; do
sudo apt-get install "$package" -y
done
echo "Packages installed successfully."