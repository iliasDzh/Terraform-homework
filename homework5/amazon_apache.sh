#!bin/bash

# sudo yum update 
# sudo yum install apache -y
# sudo systemctl start apache
# sudo systemctl enable apache

sudo yum update
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd