# Create VPC 
resource "aws_vpc" "myVPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Owner       = "${var.owner}"
    Terraform   = true
    Name        = "EpamProject-vpc"
  }
}


# Create Internet Gateway
resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Owner       = "${var.owner}"
    Terraform   = true
    Name        = "EpamProject-IGW"
  }
}


# Route Table for VPC
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.myVPC.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_gateway.id
}


# Create Subnet 1
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = var.subnet_1_cidr
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Owner       = var.owner
    Terraform   = true
    Name        = "project-subnet-1"
  }
}


# Create Routing table for subnet 1
resource "aws_route_table" "rt_1" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }

  tags = {
    Owner       = var.owner
    Terraform   = true
    Name        = "project-route-table-1"
  }
}


# Associating route table with subnet 1
resource "aws_route_table_association" "art_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.rt_1.id
}


# Create Subnet 2
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = var.subnet_2_cidr
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Owner       = var.owner
    Terraform   = true
    Name        = "project-subnet-2"
  }
}


# Create Routing table for subnet 2
resource "aws_route_table" "rt_2" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }

  tags = {
    Owner       = var.owner
    Terraform   = true
    Name        = "project-route-table-2"
  }
}


# Associating route table with subnet 2
resource "aws_route_table_association" "art_2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.rt_2.id
}