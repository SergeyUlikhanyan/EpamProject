# Create Epam Project VPC
resource "aws_vpc" "Project" {
  cidr_block       = var.cidrVPC
  instance_tenancy = "default"
  tags   = {
    Name = "Project VPC"
  }
}

resource "aws_internet_gateway" "ProjectIGW" {
  vpc_id = aws_vpc.Project.id
}

# VPC Public Subnet 1
resource "aws_subnet" "Project_Public1" {
  vpc_id                  = aws_vpc.Project.id
  cidr_block              = var.cidr1
  map_public_ip_on_launch = true
  availability_zone       = var.first_zone
  tags   = {
    Name = "Project_Public1"
  }
}

# VPC Public Subnet 2
resource "aws_subnet" "Project_Public2" {
  vpc_id                  = aws_vpc.Project.id
  cidr_block              = var.cidr2
  map_public_ip_on_launch = true
  availability_zone       = var.second_zone
  tags   = {
    Name = "Project_Public2"
  }
}

# Route Table for VPC
resource "aws_route_table" "Project_VPC_RT" {
  vpc_id       = aws_vpc.Project.id
  route {
    cidr_block = var.cidrRT
    gateway_id = aws_internet_gateway.ProjectIGW.id
  }
  tags   = {
    Name = "ProjectVPCRouteTable"
  }
}

resource "aws_route_table_association" "CentralPublic_SubnetRTassociation" {
  subnet_id      = aws_subnet.Project_Public1.id
  route_table_id = aws_route_table.Project_VPC_RT.id
}

resource "aws_route_table_association" "CentralSecondPublic_SubnetRTassociation" {
  subnet_id      = aws_subnet.Project_Public2.id
  route_table_id = aws_route_table.Project_VPC_RT.id
}
