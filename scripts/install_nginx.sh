#!/bin/bash
# Redirect all output to a log for debugging
exec > /tmp/user_data.log 2>&1
set -x

# Update package lists
apt-get update -y

# Install NGINX
apt-get install -y nginx

# Enable and start NGINX service
systemctl enable nginx
systemctl start nginx

# Optional: simple web page
echo "<h1>Hello from Terraform Ubuntu EC2 running NGINX</h1>" > /var/www/html/index.html