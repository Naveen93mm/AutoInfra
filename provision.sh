#!/bin/bash
# Update packages
sudo yum update -y

# Install Apache
sudo yum install -y httpd

# Start Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Create sample webpage
echo "<h1>Welcome to AutoInfra Project - Deployed via Terraform + Linux!</h1>" | sudo tee /var
