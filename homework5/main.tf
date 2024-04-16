# Create VPC named kaizen and enable dns support with dns hostnames
# 4 subnets (2 public named public1 and public2 in us-west-2a and us-west-2b AZs, and 2 private named private1 and private2 - in us-west-2c and us-west-2d AZs)
# Internet Gateway named homework5_igw
# 2 route tables: with names public-rt and private-rt (do needful for public-rt to have internet access)
# Associate 2 public subnets with public-rt and 2 private subnets with private-rt
# Security group with port 22 and 80 opened

# Deploy 2 EC2 Instances in VPC kaizen: 1st with latest Ubuntu image and named Ubuntu, 2nd with latest Amazon AMI and named Amazon, and install Apache on both instances.

 

provider "aws" {
  region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block           = var.vpc_cidr[0].vcidr
  enable_dns_support   = var.vpc_cidr[0].enbl_dns_sup
  enable_dns_hostnames = var.vpc_cidr[0].enbl_dns_hostn
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "pub1" {
  vpc_id                  = aws_vpc.kaizen.id
  map_public_ip_on_launch = true
  availability_zone       = "${var.availability_zones}a"
  cidr_block              = var.sub_cidr[0].cidr

  tags = {
    Name = var.sub_cidr[0].sub_name
  }
}
resource "aws_subnet" "pub2" {
  vpc_id                  = aws_vpc.kaizen.id
  map_public_ip_on_launch = true
  availability_zone       = "${var.availability_zones}b"
  cidr_block              = var.sub_cidr[1].cidr

  tags = {
    Name = var.sub_cidr[1].sub_name
  }
}
resource "aws_subnet" "priv1" {
  vpc_id                  = aws_vpc.kaizen.id
  availability_zone       = "${var.availability_zones}c"
  cidr_block              = var.sub_cidr[2].cidr

  tags = {
    Name = var.sub_cidr[2].sub_name
  }
}
resource "aws_subnet" "priv2" {
  vpc_id                  = aws_vpc.kaizen.id
  availability_zone       = "${var.availability_zones}d"
  cidr_block              = var.sub_cidr[3].cidr

  tags = {
    Name = var.sub_cidr[3].sub_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name1
  }
}
resource "aws_route_table" "priv-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name2
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}