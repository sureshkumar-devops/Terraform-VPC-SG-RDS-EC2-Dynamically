#!/bin/bash
# Redirect all output to a log file for debugging
exec > /tmp/user_data.log 2>&1
set -x

# Update packages
apt-get update -y

# Install Apache
apt-get install -y apache2

# Enable and start Apache service
systemctl enable apache2
systemctl start apache2

# Optional: Create a simple web page
echo "<h1>Hello from Terraform Ubuntu EC2</h1>" > /var/www/html/index.html