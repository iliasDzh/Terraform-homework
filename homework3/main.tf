# Create Homework3 folder and perform following:
# Provision 3 EC2 instances with one resource block in the us-west-2 region.
# Instances type should be t2.micro.
# Use the latest Amazon Linux 2 AMI for the instance.
# Create security group with inbounds ports 22, 80, 443 and 3306 open and attach to the Instances.
# Add Bastion key to the Instances.
# Ensure EC2 instances are accessible over the internet. Assign a public IP address.
# Ensure EC2 instances created in each AZ.
# Ensure instances names are: web-1, web-2, web-2.
# Automatically install Apache web server and create a simple webpage that returns "Hello, World!" when visited.
# Provide GitHub URL in the comment below.

provider "aws" {
  region = "us-west-2"
}
 variable "avalability_zones" {
   default = [ "us-west-2a","us-west-2b", "us-west-2c"]
 }
data "aws_ami" "latest_amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

output "latest_amazon_linux_2_ami_id" {
  value = data.aws_ami.latest_amazon_linux_2.id
}


resource "aws_instance" "web" {
count = length(var.avalability_zones)
ami         = "ami-0395649fbe870727e"
instance_type = "t2.micro"
key_name = aws_key_pair.School. key_name
user_data = file("apache.sh")
user_data_replace_on_change = true
tags = {

Name = "web-${count.index + 1}"   
  }

}
